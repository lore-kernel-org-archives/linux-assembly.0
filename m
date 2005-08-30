From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: video sync timing + softer update
Date: Tue, 30 Aug 2005 08:40:14 -0400
Message-ID: <op.swbmtcdnnro9m0@sucks.airplane.fire>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire> <op.swagf1lrnro9m0@sucks.airplane.fire> <4313B91F.4060206@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4313B91F.4060206@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Frank Kotler <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

> I took the liberty or reposting your question to news:alt.lang.asm -  
> more of a warzone than an asm forum, these days, but we were discussing  
> polling loops, and I thought somebody might have some ideas.

I subscribed to that group so I can read the responses.  Interesting to  
learn that even the kernel's FB driver doesn't implement syncing.  Even  
so, I couldn't use it if it did, since Softer is non-framebuffer.  When  
not in framebuffer mode, opening /dev/fb0 returns ENODEV or something like  
that, so using it's IOCTLs isn't possible.

> One response was "I don't bother doing that anymore, vga doesn't need  
> it." Would be nice if it were true, but your experience seems to differ.

Many things won't require it, but as this script shows, it's needed  
sometimes.  Just compare how it looks when running with -s as opposed to  
not running with -s.  There's quite a difference.

http://xerse.nfshost.com/secret/softer/sync_test.pl
(this script needs the general_functions.pl included with softer)

It's kind of hard to see, since softer doesn't do syncing when it's not  
the active console, and so just running 'top' you won't see it, but if you  
run the processor_utilization.pl script included with softer on another  
console, you can see that when softer runs with -s, you're basically using  
100% of the cpu (or close to it, those select calls in the script have to  
be sleeping a little).  Without -s it looks like it takes about 4%.

However, that's not what my problem is.  I haven't actually seen tearing  
outside of that test script.  Here's a script (and two files it needs)  
that demonstrates my problem:

http://xerse.nfshost.com/secret/softer/picture_sync_test.pl
http://xerse.nfshost.com/secret/softer/1.orange
http://xerse.nfshost.com/secret/softer/2.orange

It just flips between two images at 30 fps, to pretend like it's showing  
video.  (including enough images for a real video would have made one big  
tar file)  When run with -s it works fine, except that it takes about 50%  
of my CPU time.  When run without -s, it uses about 4%, however, it's got  
these bars of static in it that are about 1/4 of the screen tall, making  
it look kind of like a VHS tape on fast-forward.

It turns out that DOOM doesn't have this problem because even though it  
changes palettes, the pixel data on the screen is valid for both the old  
and the new palette.  These two images were each converted to their own  
256-color palette, and so each image when displayed with the other's  
palette just looks like garbage.

Since the palette changes take place immediately, (when softer writes to  
the registers), regardless of where the CRT beam is, you get that static  
stuff displayed between the time where you change the palette and the time  
when you change the pixel data, so you have to wait for the beginning of a  
retrace, change the palette, and then update the frame.

> Another poster (f0dder) posted a link to Kris Heidenstrom's PC timing  
> FAQ, and its info on "emulating a Vertical Retrace Interrupt".

I had a look at it, it basically describes what I was talking about on my  
message board, using the PIT to synchronize with the vertical retrace  
(although they call it the CTC which I believe is the Z80 equivelent,  
which isn't used in the PC).  Linux could do that on our behalf (using the  
PIT like I described to provide multiple timing signals), but it insist on  
keeping the PIT programmed to a single value, 100Hz.

> Sorry to hear you're meeting with such frustration.

Happens every time I work on Softer.  There's just so many stupid things  
about the kernel, like how with it's aquire/release signals, it'll send  
you one even if you're still in the signal handler for the last one it  
sent you.  There's no reason it should do that, and it's insane to expect  
any code to be able to deal with that.

On the not-so-dark side, at least the solution I came up with (in  
switcher.asm) seems to work.  I wrote a test script that told the kernel  
to switch consoles as fast as possible, and Softer didn't have a problem  
with it.

> Look on the bright side: Softer's a *hell* of a lot better than no  
> graphics at all (which is what I'm used to).

I just wish it did text in graphics modes.  I also wish it could draw  
circles.  (Yes, I could make it do both, but when I feel like working on  
it there always seems to be something else that should be done first.)   
And sprite support would be awesome, but I'm afraid to touch anything that  
involves memory management.  It'd make it really easy to make games,  
though.

There's also no way to tell from the video mode packet wether or not a  
given mode supports graphics.  I didn't realize that until last night.   
I've never actually used the video mode packet because I know what the  
modes are.

Email me if you run into any problems with it.  I rarely get emails about  
it, which I guess I should take to mean that it works just fine, but I  
can't help but worry that people just aren't reporting problems.  Also,  
I'd love to have an FAQ for it, but with no questions, that's not going  
anywhere.
