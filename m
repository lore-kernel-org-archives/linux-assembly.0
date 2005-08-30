From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: video sync timing + softer update
Date: Tue, 30 Aug 2005 16:24:24 -0400
Message-ID: <op.swb8aympnro9m0@sucks.airplane.fire>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire> <op.swagf1lrnro9m0@sucks.airplane.fire> <4313CA51.5000902@mrmighty.net> <op.swbps0s2nro9m0@sucks.airplane.fire> <43149921.5030709@mrmighty.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <43149921.5030709@mrmighty.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Stephen Ray <steve@mrmighty.net>
Cc: linux-assembly@vger.kernel.org

> I understand why you'd want something that runs with stock kernels.  
> However, I would suspect that most people are running with kernels using  
> 1000 Hz.  Why not embrace that fact, rather than beating your head  
> against the 100 Hz tick rate?

I wasn't aware that 2.6 used HZ=1000 by default.  I'll have to look into  
that then, because it's certainly possible to make Softer do what it's  
doing now with HZ=100, and actually do some sleeping with HZ=1000.  I  
thought all kernels used HZ=100, and I wasn't about to tell people "you  
should recompile your kernel to make Softer work better."

Anyway, the Softer download page has been begging for someone to send me a  
register dump from a 2.6 kernel, but it doesn't look like anyone is going  
to do it.  A friend of a friend ran Softer on 2.6, and all I ever heard  
back about it was that Softer says "unknown error," which doesn't tell me  
much.  (Just that the EAX error code wasn't one that's regdump.asm, and  
it's got them all up to #124, so it must be a new 2.6 error code.)  I  
tried to get the friend to get the other friend to get me the full  
debugging output, but somehow all I ever got back from that was "EAX has  
some numbers and a lot of zeros."

However, this all might be a bit pointless.  It occured to me that slower  
machines might not be able to write the whole palette before vertical  
retrace ends.  It looks like my other computer doesn't completely get the  
palette changed until half-way through the first scanline of the picture.   
Maybe changing the palette every frame is trying to do too much.

I bumped into another problem.  When testing that on the other computer,  
Softer started saying "stdin and stdout must refer to a console TTY."  So  
I made it so that when it gets that error, it puts the r_dev field of stat  
into eax and ebx and calls the register dump code.  For some reason the  
kernel was giving it (3,224) for stdin and (3,217) for stdout.  For  
console TTYs, the last number is between 1 and 63, and softer only accepts  
1 through 12 because Slackware by default has 666 permissions on the  
others, which lets a non-in-front-of-the-monitor user start Softer, which  
is a bad thing.  224 is /dev/ttyd0 and 217 is /dev/ttyc9, I don't even  
know what those are supposed to be.  I tried it on another console, and  
then it returned (0,0) (regular file) for stdin and something else for  
stdout.  I had to reboot Linux to get it to quit doing that.  I tried  
doing again what I did before to see if it would start doing it again, but  
it wouldn't.  The never-ending fun of Linux.
