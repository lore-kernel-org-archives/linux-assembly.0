From: Bodo Giannone <Bodo@Giannone.de>
Subject: Re: init.asm - 0.03 (19-Jun-2002) - asmutils 0.18
Date: Fri, 02 May 2008 17:46:28 +0200
Message-ID: <481B3754.7090000@Giannone.de>
References: <4817406D.5000605@Giannone.de> <48198E19.7090605@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <48198E19.7090605@verizon.net>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@verizon.net>
Cc: linux-assembly@vger.kernel.org

Hello Frank and all others,

>> I am the maintainer of BG-Tiny Linux Bootdisk.
> 
> Thank you. I downloaded it and tried it. Sure is tiny! Seemed to work
> fine. (unlike "a-linux" which hung on me the last time I tried it, IIRC)
> 
>> The tiny init version included in asmutils-0.18 (init.asm 0.03,
>> 19-Jun-2002) is exactly what I was looking for to integrate into BG-Tiny
>> Linux Bootdisk. Unfortunately I am havging some problems I cannot
>> resolve myself due to lacking assembler skills.
>>
>> I want to start /bin/sh on tty1-4 without using getty or login.
>> Unfortunately directly after booting I get the following error message:
>> "can't access tty, job control turned off". This could mean that init
>> does not activate the ttys completely. Is there a possibility to change
>> that?
> 
> Always a "possibility"! I'm gradually acquiring a few assembly skills...
> but I'm not sure what "init" is supposed to do. Quite a difference
> between the asmutils "init" and /sbin/init on my system!!! 

You are right. Normally init is supposed to execute some initscripts at
bootup time and then to start getty on several virtual terminals. At
shutdown time it should start/stop again some initscripts and then shut
down the system. However most of this is not really required for a small
rescue system like BG-Tiny Linux Bootdisk.

The init from asmutils at bootup first starts an init script and then
executes /sbin/sh (or whatever is hardcoded) on /dev/tty1-4. It is
something like a simple but effective combination of init/getty/login.


> The "init" you're using comes from Busybox, right?

Yes, the init used until now comes from Busybox. But due to ram- and
diskspace reasons I would like to change it to the one from asmutils.


>> The sh I am using is ash from BusyBox 1.3.2. If I try to use sh.asm from
>> asmutils-0.18 I only get a segfault.
> 
> Hmmm. It seems to work okay for me - that's launching it from my "usual"
> shell or from the shell from Busybox (I guess) that I get after booting
> your disk... and mounting the partition with asmutils on it - not "from
> scratch". How would I see this segfault?

sh from asmutils taken by itself works fine. It segfaults only in
combination with init from asmutils. At least it does so on my system.

If I use another type of sh, for example ash from busybox I get the
following error and no segfault: "can't access tty, job control turned off".

I think the cause could be the same. It could probably mean that init
does not activate the ttys completely.


>> I am using linux kernel 2.4.36.2 and uClibc 0.9.27 (linked statically).
>>
>> It would be great if someone had a suggestion.
> 
> I'd be willing to attempt to modify the asmutils "init", if I knew what
> it needed to do differently. Anyone know where I can find a "newbie's
> quickstart guide to init"? Maybe I should look at the Busybox  code...
> 
> That's not much of a "suggestion". I just wanted to give ya some
> encouragement. It "should" be a "possibility" to fix any problems you're
> having with asmutils.

Thank You very much. I am looking forward to Your answer. Have a nice
weekend.

Greetings,

Bodo Giannone
