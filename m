From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: Does anyone code in assembler today?
Date: Sun, 21 Sep 2003 05:05:52 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030921044233.0149a1a0@fluent2.pyramid.net>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br>
 <200309171020.17639.jko@save-net.com>
 <3F695140.60003@eprocess.fr>
 <200309180835.05190.jko@save-net.com> <3F6D7B14.C37A3152@wp.pl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F6D7B14.C37A3152@wp.pl>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br>
 <200309171020.17639.jko@save-net.com>
 <3F695140.60003@eprocess.fr>
 <200309180835.05190.jko@save-net.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: m_hrebien@wp.pl, linux-assembly@vger.kernel.org

At 12:19 PM 9/21/2003 +0200, Maciej Hrebien wrote:
>All you say is true. With comparition to HLLs assembly is more
>powerfull, flexible, not generalized like all HLLs, gives you more
>control on code the cpu is executing, so any speed/size optimizations
>can take place. It gives you possibility to use some special units of
>cpu or the computer system as a whole. Generalizing: it makes possible
>to use all features the computer system can offer & control them as you
>wish.
>
>I think people turn into assembly only if they want such power, they
>want to know exactly what's going on & want to have control in details,
>sometimes bit-details. Of course not even mention cases where assembly
>is the only way to do the job.
>
>Yes, people are diffrent & they "talk" in diffrent languages. Some of
>them like more hardware focus in daily coding but some are focused only
>on their data structures & algorithms and want to think only in
>genaralized way without wondering what cpu will run their algorithms &
>how it achieve this.
>
>So there is another reason why more poeple stay in HLLs: they just want
>their code to be more portable/machine independent & HLLs like ie. C
>gives you (more or less) this advantage.

I'm afraid I can't agree with you.  The focus of my disagreement revolves 
around maintainability, optimization, and bug avoidance.

Last thing first:  bug avoidance.  Coding style guides help tame many 
classes of typo-bugs in assembler more so than in HLLs, but the brain-fart 
bugs are there just the same, only more subtle in assembler than in 
HLLs.  From a productivity standpoint, then, assembler has little to 
recommend it.  With the power of processors today, the old 80/20 rule still 
applies, but more and more you see eight lines of assembler here, a couple 
of lines there, and only after much profiling to show a significant 
gain.  For an example, see the TCP/IP stack code, and the hand-coding of 
crc calculations in the various architectures -- but the base C code is 
still in the source.

Maintainability:  Ignoring for the moment the shrinkage of good assembler 
programmers, there is the issue of maintaining the code long-term.  I have 
a hunk of assembler code that lasted over 10 years in the Intel/MS-DOS 
world...and it finally fell so behind the advances in architecture that I 
dumped it a couple of years ago in favor of an HLL implementation that ran 
faster, was more reliable, and allowed a more general API to other 
code.  By hand, it would have been a bitch to convert to 32-bit.  Assembler 
coders are going to face the same thing in their code when they try to move 
to 64 bits.

Finally, optimization.  The rules for code optimization have grown so 
bizarre that a human being has great trouble keeping track of who does what 
to whom in the course of several thousand lines of code.  The penalties 
vary by architecture:  in CISC you have merely a time penalty (assuming the 
chip doesn't have any mistakes in resource tracking); in RISC you have an 
incorrectly running program if you break the timing rules.  The fact is, 
any computer does a MUCH better job of tracking this sort of stuff than 
your average human being.  So let the computer do what computers are good 
for:  bookkeeping.

Which points up the potential need (see below, though) for something I once 
worked on:  an intermediate language that falls somewhere between HLLs and 
machine code.  The one I developed looked something like a jazzed-up 
P-Code, in which I define atomic operations with symbolic linkages , and 
let a code generator figure out how to generate code to implement the 
atomic operations and shuffle the result to make the most of whatever chip 
is being targeted.

Because I was using the gcc back-end, the language tended to be 
architecture-agnostic -- there were dialects to deal with register 
machines, stack machines, and RISCs.  The quality of the code generated, 
when compared with hand-coded "pure" assembler, was comparable, but the 
algorithms were more maintainable because one didn't have to worry about 
"the timing rules" to get time-optimized code.

The result wasn't salable, so there was no point to continue with the 
experiment when funds dried up.

Satch



Simplicity is prerequisite for reliability. -- Edsger W. Dijkstra

