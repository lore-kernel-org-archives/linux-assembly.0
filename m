From: linuxassembly@evobsyniva.com
Subject: Interprocess Communication
Date: Wed, 24 Sep 2003 19:14:44 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprv01iut0lmcbdf@smtp-server.woh.rr.com>
Reply-To: linuxassembly@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


I need to figure out how to do interprocess communication.  Those who wish to know what I'm up to may start reading at the line of stars below and come back when they're done, it may help if you think you can suggest some other way I can do the same thing.  Those who don't care will save a lot of reading if they stop at the line of stars.

I'd be best off if I could make something like a pty, but a block device instead of a character device, but I don't think there's any such thing in Linux.

My number two choice is mmaping a file, although I'm sure it'd do well for speed with the kernel caching it, I fear the kernel might try to keep the disk up to date which is silly since the data doesn't need to be saved.  Perhaps a ram drive, but I'd hate to make people figure out how to set one of those up, and I'd hate to set one up myself.  If there's some way to tell Linux to not write a file out to disk, I'd go for that, but it seems unlikely.

So I guess I need shared memory.  I'm concerned it won't allow the type of access control I need, but I don't know.  I can't find anything that explains the ipc system call.  The man page is another of the "you should be programming in C, you know" man pages.  None of the online system call references have it (except maybe that 'closed for software patents' one, but it was mostly in German and I couldn't read it, which is weird because I don't remember it being that way).

Online descriptions of the C functions are a bit hazy as well, so even if I knew how to map the several C functions to the one ipc system call, I'd still be a bit confused.  Basically, I need to set up a server program that accepts connections from multiple other programs, shares a bit of memory with each of them and only each of them.  So I think it goes like this:

+ create socket (sys_socket)
+ bind to linux internal address space (sys_bind)
+ listen for connections (sys_listen)
+ then connect to each (sys_connect)
+ communicate whatever necessary to set up shared memory
+ get some kind of shared resource id (???)
+ create shared memory on this id (???)
+ map this share memory into my address space (???)
+ allow connection to this memory from client below, but not from anyone else (???)
+ go on merry way

on the client end, like this:

+ create socket
+ connect to server socket
+ somehow verify server socket belongs to the correct program and not some program spoofing it (keyboard input via this connection, we don't want a shell program connecting to some user server run by an evil hacker) (???)
+ communicate to get information to set up shared memory
+ get same shared memory id the server used (???)
+ connect to the shared memory on this id (???)
+ go on to do whatever

There's a lot of stuff in there I'm not sure about, since I've never done this before.  You can see why I'd think a mmap'd file would be easier.  I figured the best way to learn to do this is to try and do it, but like I said, nothing explains this sys_ipc call at all.

Anyone have any idea how it works?


*******************************************
*******************************************
*******************************************

I've got this idea stuck in my head that it might be a good idea to write a VGA driver for Linux.  Why?  Well, it basically comes down to this:

    call switcher.lock
      mov al, 0; call video.page
      add edi, [.pointer]; mov al, [.temp+63]; cld; stosb
      mov al, 1; call video.page
      add edi, [.pointer]; mov al, [.color]; cld; stosb
    call switcher.unlock

switcher.lock is a function that just sets a flag to tell the console switching code that the video hardware is being accessed.  video.page does one of two things, depending on whether or not our console is currently active.  If it is active, it switches to that memory plane in the VGA, and returns a pointer to it in esi and edi.  If not active, it returns a pointer to ordinary memory that's being used to represent that page of VGA memory when we're not active.  switcher.unlock, if while the lock was set, we recieved a signal to switch consoles, switcher.unlock goes ahead and does the switch now that we're done with the video access, otherwise it just clears the flag.

It seems not too complicated, but let's look at some of the swither code...  Basically what goes on is if the kernel request that we change consoles while we're accessing VGA hardware, we can't do it, so instead we set the flag switch_to_mode, 1 if we need to take over the VGA device (we recieved the console), or 2 if we need to give it up.  So this function checks the flag to see if it's set, and if so, calls the appropriate code.  The thing is, though, it can't clear the lock if it has to call one of these pieces of code, because if it does, and the kernel sends us another such signal, that signal will get processed immediatly (because the lock isn't set), and thus, out of order.  The end result would be that we'd tell the kernel it can have the video device back, and then immediatly start writing to it, screwing up whatever's running on the next console.  So we shift the bytes over (you can't use a lock prefix on a shift, but it's irrelevant since this is one processor co!
 
 de 
anyway), clearing the flag only if the switch_to_mode flag was clear.  If it was set, it's cleared in the process, and it's value is saved in the switch_lock flag, and that's where we check it.

vernix switcher.unlock; enter "switcher.asm - switcher.unlock"
  if byte [switcher_active], 1, z
    pushad
      # switch_lock is the byte right after switch_to_mode, so the following
      # instruction clears switch_to_mode and leaves the lock set if
      # switch_to_mode wasn't 0 to begin with.
      shl word [switch_to_mode], 8
      if [switch_lock], byte 1, z
        call do_aquire
      elseif a
        call do_release
      endif
    popad
  endif
leave; ret

So far it's become somewhat stupidly complicated, but let us continue on to the do_release function.

do_release; enter " -- do_release"
  call switcher.lock
    if [switch_status], byte 1, z
      call video.release
      call keyboard.release
      call console.release
      mov [switch_status], byte 0
      sys sys_ioctl, 1, VT_RELDISP
    endif
  call switcher.unlock
leave; ret

The first thing do_release does is lock the switcher.  Changing console states does involve VGA access, so the lock is required.  It is actually always already locked, as I just noticed, but whatever.  Anyway...  The switch_status check is just to make sure we actually have the console at the moment.  The kernel will happily send us more than one release request, and we wouldn't want to release a console we don't have.  video.release saves the video memory in system RAM, sets some flags for that video.page function, and changes the video mode back to whatever the kernel was using last time we aquired the console.  The next two functions don't do anything as it turned out everything they changed the kernel actually keeps per-console states on.  It finishes up by telling the kernel it can switch consoles now.  However, the last step is particulary important.  It calls switcher.unlock, recursively.  Why?  Because while we were releasing the console, the kernel might have sent u!
 
 s a 
signal to tell us we can have it back now.  Thus, switcher.unlock might call do_release which calls switcher.unlock which might call do_aquire which will call switcher.unlock which might call do_release which will call switcher.unlock which might call do_release, again, since the kernel sent us the singal twice, and then we get a mess of return calls to the main program.  Luckily it's difficult to get the kernel to stack these signals up like that, so the risk of a stack overflow isn't really there.

Anyway, toss in the do_aquire code you didn't see, as well as the switcher.aquire and switcher.release functions, called by the signal handler code that actually recieves the signal, and finish it off with this one little comment:

signal_handler; enter "signal.asm - signal_handler"
  # What a question...  Re-register the signal handler first and risk getting
  # a duplicate signal, or re-register it afterwards and risk getting killed.
  # Duplicate signals might leave the console in an unusable state.
  # Getting killed will almost certianly leave it in an unusable state.
  # So we'll re-register immediately.
  sys sys_signal, [esp + $04], signal_handler; systrap "re-registering a signal handler."

This handler catches some 50 signals that would otherwise have killed softer and left the display in an unuseable state.  If another of the same signal slips in before this handler re-registers itself, Softer dies.  The kernel doesn't care that the handler hasn't returned yet.  The kernel has no problems with sending a signal to a program that's currently processing another signal, even the same signal.  It's nonsense.

All in all, Linux is one sucky environment for doing graphics modes.  The thing is, though, most of this suckiness can be eliminated by simply refusing to do the console switching, and that's where my idea comes in...

Just not doing the console switching is bad because then people can run your program and only your program, and can't do anything else until they're done with it, but I have a plan.

My program will be the console multitasker.  It'll accept connections from multiple VT-100 emulators, as well as any other program in the system that wants video access.  For all of these programs, it'll allow them to use the display as if they're the only program using it, regardless of whether they use text or graphics mode.  It'll switch video modes for them.  It'll virturalize the video memory access, so that programs only have to know either 8-bit pseudocolor (although they might be limited to using only 16 of the 256 colors in 16-color modes) which will always work, or 24-bit red-green-blue, which will work on any 24-bit (whether red-green-blue or blue-green-red, etc.) as well as any 16-bit modes, etc.  And a couple text modes for good measure.  When you press Alt-Fn on they keyboard, it'll switch between each program's display, and the programs won't have to know a thing about it (although they can still get signals to let them know, there's little point in wasting sy!
 
 stem 
resources on a game when the user isn't playing it).  So current programs will access a VT-100 emulator on a pty interface and thus work just like they're running through a telnet, and if you start up a game or something graphical, it'll make it's own connection to the video driver program and get it's own screen.

This has several benefits as I see it:  It provides another graphics alternative for Linux, which I think is good since the current options (SVGAlib, X Window, and direct access like above) aren't very good, and none of them are easy.  Ok, so that's only one benifit, but it's a big one.  Once it's done, Linux would look the same as usual to most programs, just they'd be using a pty (as if they're running over telnet) instead of a regular tty.

It would break a lot of things too.  X would no longer work (I wouldn't miss it at all, it mucks up the display too often and makes me reboot), SVGAlib wouldn't work (I wouldn't miss the squigly line pictures and my monitor clicking off after 10 seconds making me think I just broke it), framebuffer programs wouldn't work (but what would we lose?  does anything use framebuffer aside from a couple of demo programs?) and programs like Softer wouldn't work (but I'll fix Softer).  X could be changed to work with this provided it comes to support something like vesa 2.0 modes or something more high-res than VGA (X on a VGA mode would suck), and I imagine they'd like to do it as they're currently doing two projects, an X server, and a linux graphics implementation.  It'd be easier if they could just do the X server and let setting up and managing the video devices be done for them by something else, as it should be.  An SVGAlib could be made to support it as well, but does anyone u!
 
 se 
SVGAlib?  Framebuffer programs would be easy to convert, just strip out the console switching code and make it connect to shared memory instead of mmaping a file and you're almost done.  As for Softer, I've always said it'd be a piece of cake to write if I didn't have to wrestle with the kernel to get the video access I needed.

Anyway, I mentioned something about interprocess communication at the beginning of this?...

 - Pj


