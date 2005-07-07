From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: linuxassembly.org - asmutils
Date: Thu, 07 Jul 2005 23:20:53 +0400
Message-ID: <42CD8095.8000109@linuxassembly.org>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <opss5nv9y85khrlj@sucks.airplane.fire> <42CBC727.8060203@linuxassembly.org> <42CC3917.3020105@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42CC3917.3020105@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Frank Kotler ?????:

> What's the story with http://asm.sourceforge.net ? Just a mirror, or 
> is there some difference? 

It's the original site. linuxassembly.org is a redirect, actually.

>> Still hoping to release new asmutils..
>
> Great! There are a couple bugs in 0.17...
>
> Makefile - insists on buggy 0.98 to build. Deleting the obvious 
> offending lines fixes it. (we apologize for 0.98.37 - elf output was 
> badly broken... but 0.98??? Jesus, it won't even assemble its own 
> "test" directory!) 

Oh, I guess now the latest 0.98.xx should work fine.. I will remove the 
check.

> truss.asm - "pause" is an instruction nowadays. Speak to Intel, not 
> Nasm's fault. I fixed it by changing to "$pause" (two places, IIRC), 
> but any change would fix it...

Thanks, fixed.

> Several of the utilities segfault on 2.6.10+ (this was first brought 
> to my attention on 2.6.11, but the patch appears to have been applied 
> to 2.6.10 - still there in 2.6.12) This applies to those utilities 
> with the (only) code section set to "R X", but those with "RWX" still 
> work okay. I don't know if the proper fix is to make all code sections 
> writeable (last lines in Brian's "elf.inc") or to make sure every 
> program made this way has a "UDATASEG"...
>
> Call it a "kernel bug" if you like (I do), but I don't think it's 
> going to go away. 

Okay, I'll see how this can be solved. Still haven't tried any 2.6 
kernel :-)

> What are the security implications of making the code section 
> writeable? Is this a "safe" thing to do?

 From a glance, I do not see any point in doing this. However, perhaps
study of linux-kernel archives may clarify why this was done.

>> And still lacking time for this.. :(
>
> So many bits,so little time... :) Huge thanks to you and others 
> involved for what you've done. It's a *tremendous* help! 

Well, we're just having fun... when time permits :-)

--
Regards,
Konstantin.

