From: Jean-Yves Lamoureux <jylam@lnxscene.org>
Subject: Re: GAS colorr pixel problem
Date: Wed, 22 Nov 2006 21:38:25 +0100
Message-ID: <4564B541.2080704@lnxscene.org>
References: <BAY22-F18087E5BEE37FFA472DDD5F5E30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY22-F18087E5BEE37FFA472DDD5F5E30@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org
Cc: A D <a_d_249@hotmail.com>

A D wrote:
>> Jean-Yves Lamoureux wrote:
>> gas is just an assembler. You can do whatever you want with an 
>> assembler, as every single executed bit on your processor is the 
>> output of an assembler (ok purists, I just simplified).
>> "Filling a rectangle" means nothing. You have to draw something that 
>> will be interpreted as a bunch of pixels having the sahpe of a 
>> rectangle. You can do that in ascii (libcaca for example, 
>> http://libcaca.zoy.org ), or in graphic mode (SVGAlib, old as hell 
>> but works on most PC cards, without X), X11 (which itself has dozen 
>> of low (xlib) and high (sdl, ptc, gtk, qt, whatever) level libraries 
>> to do that).
>>
>> I suggest you to learn how to call C-like functions (pushing 
>> arguments, calling function), how to work with memory (lea, syscalls, 
>> brk, etc), then to use something like SDL for example, which does 
>> most of the work for you.
>
> Thanks to all for your input. I guess it would be really difficult to 
> color pixels in assembly language. Can anyone tell me what steps are 
> involved in that(color pixels in assembly)? Just for my knowledge. 
> Thanks.
>

http://www.google.com/codesearch?q=show:GtRjeWKEOlc:2P9VXd642nk:3e2ZV6Tu0vo&sa=N&ct=rd&cs_p=http://allergy.alrj.org/Code/xtest.tgz&cs_f=xtest/PTC4k.asm

May seem hard to understand, it is a "complete" graphical library in 
asm, using xlib. That's not the easiest way, but hey, you wanna learn !

(Wrote by me yeaaaars ago, when I was a young padawan, rewritten from 
scratch by a friend later)



-- 
Jean-Yves Lamoureux
Software Developper

