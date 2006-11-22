From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: GAS colorr pixel problem
Date: Wed, 22 Nov 2006 18:06:28 -0500
Message-ID: <4564D7F4.6080507@comcast.net>
References: <BAY22-F18087E5BEE37FFA472DDD5F5E30@phx.gbl> <4564B541.2080704@lnxscene.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4564B541.2080704@lnxscene.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Jean-Yves Lamoureux wrote:
> A D wrote:
> 
>>> Jean-Yves Lamoureux wrote:
>>> gas is just an assembler. You can do whatever you want with an 
>>> assembler, as every single executed bit on your processor is the 
>>> output of an assembler (ok purists, I just simplified).
>>> "Filling a rectangle" means nothing. You have to draw something that 
>>> will be interpreted as a bunch of pixels having the sahpe of a 
>>> rectangle. You can do that in ascii (libcaca for example, 
>>> http://libcaca.zoy.org ), or in graphic mode (SVGAlib, old as hell 
>>> but works on most PC cards, without X), X11 (which itself has dozen 
>>> of low (xlib) and high (sdl, ptc, gtk, qt, whatever) level libraries 
>>> to do that).
>>>
>>> I suggest you to learn how to call C-like functions (pushing 
>>> arguments, calling function), how to work with memory (lea, syscalls, 
>>> brk, etc), then to use something like SDL for example, which does 
>>> most of the work for you.
>>
>>
>> Thanks to all for your input. I guess it would be really difficult to 
>> color pixels in assembly language. Can anyone tell me what steps are 
>> involved in that(color pixels in assembly)? Just for my knowledge. 
>> Thanks.
>>
> 
> http://www.google.com/codesearch?q=show:GtRjeWKEOlc:2P9VXd642nk:3e2ZV6Tu0vo&sa=N&ct=rd&cs_p=http://allergy.alrj.org/Code/xtest.tgz&cs_f=xtest/PTC4k.asm 
> 
> 
> May seem hard to understand, it is a "complete" graphical library in 
> asm, using xlib. That's not the easiest way, but hey, you wanna learn !
> 
> (Wrote by me yeaaaars ago, when I was a young padawan, rewritten from 
> scratch by a friend later)

Very nice! I hadn't seen that one. Thanks!!!

Other possible ways to plot a pixel... If you enable the "frame buffer 
device" at bootup ("vga=769" or somesuch), you can open "/dev/fb0" and 
write to it (need root access). This is fairly easy, but requires that 
the user enable the device.

Richard Cooper/PJ (you still around?) wrote a thing called "softer", 
which acquires access to the ports, and does vga (yuck) graphics by 
diddling the ports. I find this quite impressive, but it isn't a 
"Beginner Project"!!! *Using* softer from your own code - as it's 
intended - is fairly easy. (so easy that Richard provide examples in 
Perl!!!)

Even crazier, I'm in the midst of an experiment to use the X windows 
system without using Xlib - int 80h only. It's in a very early stage, 
but "seems to work".

This is assembly language! We can do anything that *can* be done, and 
usually several different ways. The "right" way to do it - "The Unix 
Way" - is to use the library(s). But there are options, if you want to 
see "what we can get away with".

Any examples I could provide would be in Nasm syntax. Mostly easy enough 
to "translate" to Gas. More Nasm examples (glut, SDL, etc.) can be found 
  in the "files" section of the !Yahoo! group 
http://groups.yahoo.com/group/linux-nasm-users

I don't suppose I could interest you in any hot stock tips? :)

Best,
Frank

