From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: init.asm - 0.03 (19-Jun-2002) - asmutils 0.18
Date: Thu, 01 May 2008 05:32:09 -0400
Message-ID: <48198E19.7090605@verizon.net>
References: <4817406D.5000605@Giannone.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <4817406D.5000605@Giannone.de>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bodo Giannone <Bodo@Giannone.de>
Cc: linux-assembly@vger.kernel.org

Bodo Giannone wrote:
> Hello,
> 
> I am the maintainer of BG-Tiny Linux Bootdisk.

Thank you. I downloaded it and tried it. Sure is tiny! Seemed to work 
fine. (unlike "a-linux" which hung on me the last time I tried it, IIRC)

> The tiny init version included in asmutils-0.18 (init.asm 0.03,
> 19-Jun-2002) is exactly what I was looking for to integrate into BG-Tiny
> Linux Bootdisk. Unfortunately I am havging some problems I cannot
> resolve myself due to lacking assembler skills.
> 
> I want to start /bin/sh on tty1-4 without using getty or login.
> Unfortunately directly after booting I get the following error message:
> "can't access tty, job control turned off". This could mean that init
> does not activate the ttys completely. Is there a possibility to change
> that?

Always a "possibility"! I'm gradually acquiring a few assembly skills... 
but I'm not sure what "init" is supposed to do. Quite a difference 
between the asmutils "init" and /sbin/init on my system!!! The "init" 
you're using comes from Busybox, right?

> The sh I am using is ash from BusyBox 1.3.2. If I try to use sh.asm from
> asmutils-0.18 I only get a segfault.

Hmmm. It seems to work okay for me - that's launching it from my "usual" 
shell or from the shell from Busybox (I guess) that I get after booting 
your disk... and mounting the partition with asmutils on it - not "from 
scratch". How would I see this segfault?

> I am using linux kernel 2.4.36.2 and uClibc 0.9.27 (linked statically).
> 
> It would be great if someone had a suggestion.

I'd be willing to attempt to modify the asmutils "init", if I knew what 
it needed to do differently. Anyone know where I can find a "newbie's 
quickstart guide to init"? Maybe I should look at the Busybox  code...

That's not much of a "suggestion". I just wanted to give ya some 
encouragement. It "should" be a "possibility" to fix any problems you're 
having with asmutils.

Best,
Frank

