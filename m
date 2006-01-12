From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: hello again :D
Date: Thu, 12 Jan 2006 11:52:07 +0200
Message-ID: <d93f04c70601120152t53631e03q6d21f6f7d5948508@mail.gmail.com>
References: <20060107110622.65f5623a.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060107110622.65f5623a.amerei@gmail.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Niel A <amerei@gmail.com>
Cc: linux-assembly@vger.kernel.org

On 1/7/06, Niel A <amerei@gmail.com> wrote:

> first, what am i trying to do? i'm trying to replace an instruction with a nop.

As mentioned by others "caveat emptor" (Buyer beware :) changing stuff
in the "text" or "code" segments aren't always guaranteed as it should be
static/read-only to prevent malicious code injections etc. etc. (Read
stack smashing and all those insecure coding pratices :()

Anycase back to the code in question:

> _start:
>         xor ebx, ebx
>         mov byte [t1], 0x90
> t1:
>         inc ebx ; try to skip this so exit(0) instead of exit(1);
>bye:
>       xor eax, eax
>       inc eax
>       int 80h<snip>

> i figured that since an "inc" is 1 byte, mov byte [t1], 90h will do the trick. if the nop was succesful, the proggie would have returned a zero exit status instead of one.

Okay, let's assume for one moment that the .text/code segment is writable.

In the modern CPUs it would run fine in the debuggers, but without the debugger
it'll mostly allways exit(1). Why? It's called the instruction
pipeline, prefetch queue etc. :)

An old test between the 8086/80186 and the 8088/80188 was to to modify
a byte 5 or 6 bytes ahead and check the results. On the 8086/80186
with a 6byte pre-fetch
that byte would already be in the queue before the change to the memory location
thus the old instruction will get executed. On the 8088/80188, however, with a
4byte prefetch queue, those byte would be changed in RAM/memory by the
time the instruction is fetched, thus the new instruction will get executed.

This might be exasparated by the newer CPUs that does several instructions
per clock tick like the SPARC CPUs. ie. the SuperSPARCs did three instructions
(given certain rules) at once, the UltraSPARC version 1 (they are now
past 4) can do four instructions (given the rules) to be executed at
once. I do recall the
Xeons and Athlons also having multiple instructions per clock tick as
they also have multiple processing units on board.

Thus, if you want to dynamically change code, do it in a function that
you'll call after the
change as to try and clear the prefetch (and also the predictive
branching) queues



--
Hendrik Visage
