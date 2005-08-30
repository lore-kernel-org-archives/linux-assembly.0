From: Stephen Ray <steve@mrmighty.net>
Subject: Re: video sync timing + softer update
Date: Tue, 30 Aug 2005 14:36:33 -0300
Message-ID: <43149921.5030709@mrmighty.net>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire> <op.swagf1lrnro9m0@sucks.airplane.fire> <4313CA51.5000902@mrmighty.net> <op.swbps0s2nro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.swbps0s2nro9m0@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Cooper <peajay@funrestraints.com>
Cc: linux-assembly@vger.kernel.org

Richard Cooper wrote:
>> What kernel series are you using?
> 
> 
> Linux version 2.4.26
> 
>> Did you compile it yourself?
> 
> 
> Possibly, I've compiled kernels before, but I think this one did  
> everything I needed out of the box, so I didn't have to recompile it.
> 
>> What is HZ set at?
> 
> 
> Aparently 100.  I wasn't aware you could change it.  I wanted to once  
> since Linux's multitasking is so sludgy sometimes, but I couldn't 
> figure  out how to do it.
> 
> (Turns out the slugyness is because it'll give processes more than one  
> timeslice in a row, it'll give them like 20 before switching tasks, so  
> you're only switching tasks 5 times a second.  Maybe I should just run  
> everything under SCHED_RR...)
> 
>> If it's a 2.6 kernel, did you try enabling preemption?
> 
> 
> I'm afraid to try 2.6.  I've heard nothing good about it.  (in fact, 
> this  is the first time I've seen 2.6 mentioned without being in 
> relation to  something not working because of it)
> 
I know there were teething problems.  I suspect a lot of it was due to 
widespread use of certain assumptions about kernel behaviour.  When the 
behaviour changed, it broke libraries and applications.  But, it's been 
almost 2 years now, and it's not like they're going to be returning to 
the 2.4 way of doing things.  2.6 also introduces a lot of improvements 
in the way the kernel works.

> It's not a problem with kernel threads blocking the scheduling, the 
> kernel  is just sitting idle when I run my test program.  As best I can 
> tell, the  kernel simply doesn't want to schedule things outside of it's 
> 10ms time  slices.  So when I try to sleep for any amount of time, the 
> wakeup time is  always set for the beginning of one of those 10ms 
> slices.  (which is the  documented behavior, I'm just surprised to see 
> that "realtime scheduling"  doesn't fix it)  It's not that the kernel is 
> incapable of splitting slices  between processes, it does it all the 
> time.  It just won't schedule  anything that way.

Realtime scheduling doesn't change the fact that the clock only ticks HZ 
times a second.  If you've got a 100 Hz tick rate, you'll only do 
scheduling on 10 ms intervals.  It will split slices between processes, 
but (if I recall correctly) only when the kernel is interrupted, and the 
scheduler finds that a higher-priority process is ready to run, or 
currently running process yields the process (waiting for I/O, or 
explicitly yielding).  You certainly can't rely on this, and the kernel 
has no universally-available way of telling how far into a tick it is.

> 
> I don't want to require that people modify their kernel just to run  
> Softer.  The way it is now, you download it, and it just works.  (Or it  
> tells you your in framebuffer mode.)  I download Linux programs now and  
> then, and 75% of the time they don't work.  I don't want Softer to be 
> like  that.
> 
> The reason it works so well now is because it doesn't depend on 
> anything.   You don't need libraries, you don't even have to compile it, 
> the binary  will work just fine.  If people have to modify their kernel, 
> then it's  working becomes dependant on wether or not the kernel 
> modifications are  sucessful.  I can make sure that Softer will work, 
> but I can't do anything  to make sure that kernel modifications will work.

Well, the 2.6 kernel has been the mainline kernel since December 2003. I 
don't know of any major distros that doesn't distribute a 2.6 kernel, 
and most no longer ship 2.4.  In addition, several distros, notably 
Redhat, shipped 2.4 kernels with the tick rate set at 1000 Hz rather 
than 100 in later versions.  Unfortunately, Hz (with almost all kernels) 
has to be set at kernel compile time (although there is a lot of work 
being done trying to set the PIT tick rate dynamically).

I understand why you'd want something that runs with stock kernels. 
However, I would suspect that most people are running with kernels using 
1000 Hz.  Why not embrace that fact, rather than beating your head 
against the 100 Hz tick rate?
