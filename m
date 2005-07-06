From: Frank Kotler <fbkotler@comcast.net>
Subject: linuxassembly.org - asmutils
Date: Wed, 06 Jul 2005 16:03:35 -0400
Message-ID: <42CC3917.3020105@comcast.net>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <opss5nv9y85khrlj@sucks.airplane.fire> <42CBC727.8060203@linuxassembly.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42CBC727.8060203@linuxassembly.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Konstantin Boldyshev wrote:
> Perhaps you've meant linuxassembly.ORG?

What's the story with http://asm.sourceforge.net ? Just a mirror, or is 
there some difference?

...
> Still hoping to release new asmutils..

Great! There are a couple bugs in 0.17...

Makefile - insists on buggy 0.98 to build. Deleting the obvious 
offending lines fixes it. (we apologize for 0.98.37 - elf output was 
badly broken... but 0.98??? Jesus, it won't even assemble its own "test" 
directory!)

truss.asm - "pause" is an instruction nowadays. Speak to Intel, not 
Nasm's fault. I fixed it by changing to "$pause" (two places, IIRC), but 
any change would fix it...

Several of the utilities segfault on 2.6.10+ (this was first brought to 
my attention on 2.6.11, but the patch appears to have been applied to 
2.6.10 - still there in 2.6.12) This applies to those utilities with the 
(only) code section set to "R X", but those with "RWX" still work okay. 
I don't know if the proper fix is to make all code sections writeable 
(last lines in Brian's "elf.inc") or to make sure every program made 
this way has a "UDATASEG"...

Call it a "kernel bug" if you like (I do), but I don't think it's going 
to go away.

What are the security implications of making the code section writeable? 
Is this a "safe" thing to do?

> And still lacking time for this.. :(

So many bits,so little time... :) Huge thanks to you and others involved 
for what you've done. It's a *tremendous* help!

Best,
Frank

