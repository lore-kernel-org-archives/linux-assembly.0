From: "Lada 'Ray' Lostak" <ray@unreal64.net>
Subject: Re: Threads, timing
Date: Mon, 7 Oct 2002 20:05:55 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <003e01c26e2c$2e732670$0d01a8c0@utopia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi !

Thank you for reply :o)
>information in the man pages, eg: man ipc, man semctl, man semget, man
semop.
From what I gather, the sysv ipc functions aren't exactly as fast at thread
>syncronization as a windows implementation, but that is being fixed in the
>2.5.x kernels using the new futex kernel call.
One of reasons, why we decided to implement own sync is fact, that stc sync
objects in all OS we want to support are 'same but different' if you
understand what I mean. Next thing was missing some really often used sync
objects - such as 'multiple readers single writer' (which can be implemented
using standards ones, but it is not fast as it can be). And last point -
some OS (like windoze) switch to kernel every time, sync object is called.
So, it is expensive.... Now sync objects are stable and I have to verify, it
can be ported without problem. If not, resedign it a bit. And test again
(you can imagine, how bad you can test this kind of code - it takes ages :)

We also implement message queue - agian becasue it was impossible to create
'portable' queue, which have same features and behaviour). And for sync, we
uses some sync object (event/mutex mainly).

For me is enogh from system 'simple sync' - like semaphore. I looked around
semget and similar - I didn't know, that it is done throw 'ipc'... I was
searching some kernel call :o) My bad. Now I found 'ipc' directory with
sem.c - it was something what I was searching for :o) I need simple sync
object, which comes from kernel - to minimize loosing speed and races (would
be nice to have function like lock_kernel() in right3 sometimes :o)

I see it allows wait for multiple semaphores as atomic operation (it is good
:) You kick me right way, thank you !

What is 'futex' in new kernel ? In 2.4.x I found only 'reserved for futex'
but not real code/man.

Anyone have experimence with speed - ipc versus signals ? I guess IPC will
be faster, but mow many ? 2x ? 10x ? 100 ? 'similar' ?

Best regards,
Lada 'Ray' Lostak
Unreal64 Develop group
http://www.unreal64.net

--------------------------------------------------------------------------
In the 1960s you needed the power of two C64s to get a rocket
to the moon. Now you need a machine which is a vast number
of times more powerful just to run the most popular GUI.


