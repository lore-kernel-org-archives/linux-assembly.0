From: "Richard Cooper" <pj@xersedefixion.com>
Subject: Re: Graphics for Assembly Language Program
Date: Fri, 26 Aug 2005 05:09:31 -0400
Message-ID: <op.sv3yd5oca5tgfg@sucks.airplane.fire>
References: <0D544207876CDA428F17DD7EA448C192088AAF@bailey.DOMAIN.KSNINC.PVT>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <0D544207876CDA428F17DD7EA448C192088AAF@bailey.DOMAIN.KSNINC.PVT>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Landon Blake <lblake@ksninc.com>
Cc: linux-assembly@vger.kernel.org

On Thu, 25 Aug 2005 15:59:49 -0400, Landon Blake <lblake@ksninc.com> wrote:

> What is the other alternatives to providing graphics functions to a computer
> language written in assembly?

One option is to use my rotten little program:

http://xerse.nfshost.com/softer/

It's limited in what it can do graphically, mostly because it's a text mode program that I just put graphics modes in one day because I realized I'd already done 95% of what was required.  I've written several (unreleased) programs that use it, one of which was a GPS mapping program, so I know it works and works well.  I've used it both with assembly language and with Perl, and if by "simple computer language" you mean something like BASIC, then have a look at what's written under the second screen capture here:

http://xerse.nfshost.com/softer/captures.html

It only does VGA modes 320x240x256 and 640x480x16 (as well as four text modes).  However, it's trivially easy to interface with; you either run your program under it with a command like "softer your-program" or you make your program start softer itself (which requires a few system calls to create pipes, fork, and exec, but really isn't that difficult, I even made a Perl script that can do it).  Then you just write graphics commands (or text mode commands) to stdout, and read keyboard data from stdin. When you're done, your program just exits (or gets killed or segfaults), and softer unloads and everything is back like it was.

I also designed it to restore the video mode even if Softer itself crashes, since I got tired of rebooting my computer when I was developing it, so even if the unimaginable should happen and you discover a bug in Softer, it'll still most likely restore your origional text mode rather than leave your system in an unusable state like most linux graphics solutions.  Also, unlike a lot of assembly programs, it checks the results of every system call it makes*, and displays error messages for every possible error.  (* except a couple where the call simply cannot fail and/or where the result simply doesn't matter)

The big plus is that only Softer has to be suid root, the programs that use it can be ordinary user processes.  That's one thing I never liked about svgalib, every program that uses it has to be suid root.  I had enough "fun" making softer a secure program that can be run suid root (at least I hope it is, it's impossible to know for sure), I can't imagine what it'd be like to write a game or programming language or something complicated like that and have to make that safe to run suid root as well.

And it's fully documented, which is a bit unusual:

http://xerse.nfshost.com/softer/orange.html

(the graphics functions are all the way at the bottom, starting with code 0x60,
however, make sure you read the top about the keyboard codes as well.)

For text mode over a modem connection it'd be great (the orange protocol was designed for BBS use way back in 1995), however, for graphics, it doesn't do much.  I can fairly easily add an "update entire screen" command, so that, e.g., when in 320x240x256 mode, you'd send 0x1B, 0x65, [76800 bytes of graphics data], 0x1B, 0x60 to stdout, and it'd appear on the screen.  (despite the large data transfer over stdout, it really would go quite fast, linux fifos are really quite packet-like)

However, there's a lot of reasons you may not want to use it:

The biggest is that it doesn't have a "print" command for graphics modes.  If you want text on your graphics screen, you have to draw it there yourself.

It only supports six modes,

text: 80x30, 80x40, 80x48, 80x60
You should read it's list of text mode features, it does everything that VGA can do in text mode.  Also, these are 8 pixel wide font modes, which are great for text mode graphics made by redefining character fonts.
(Which you'll probably want to redefine the text mode font, since I believe the default text font sucks, since I couldn't find a public domain font, and had to make my own since I wanted to release Softer as public domain.  It's readable, it just looks odd.)

vga: 320x240x256
This is the "Mode X" with four planes, however, softer makes it appear as a single plane to you, and it does all of the awful memory shuffling.

vga: 640x480x16
This is also a four plane mode, but again, softer makes it easy.  (If only Linux made framebuffer easy, that would rock.)

It doesn't work in framebuffer mode.  The reason being the Linux kernel has no means by which you can tell it to switch video modes.  Framebuffer mode just sets a graphics mode at boot and sticks with it, this is despite it requiring VESA 2.0 which includes protected mode functions you can call to switch modes.  I really don't know why Linux is so sucky in this regard.

It doesn't work in X.  Since Linux has no graphics API, softer doesn't use a graphics API, and so there's no API calls for X to intercept and emulate.  Thus, for it to work in X, it would have to specifically support X, which it doesn't.

It doesn't support a mouse.  Although there's drivers for mouse ports, Linux doesn't have a driver that interpretes mouse protocols, so any program that wants to use a mouse has to know every mouse protocol in existance.  More than I care to mess with.

Softer is like INT 13, it just works, and it's a super easy interface to use to do something that really shouldn't be that difficult.  That's the only reason I recommend it.  I'm sure that X, framebuffer, opengl, SDL, svgalib, and whatever else will give you more functionality, however, I'd be surprised if any of them weren't at least ten times as complicated to use as Softer.  But then, I wrote Softer, so of course I think it's easy.
