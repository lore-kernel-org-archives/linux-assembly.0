From: Henio Paszczak <blurrpp@yahoo.com>
Subject: Re: CPU cores...
Date: Tue, 16 Jan 2007 04:51:01 -0800 (PST)
Message-ID: <479423.63667.qm@web50313.mail.yahoo.com>
References: <d93f04c70701150906k2ea921e4ub5bbfad462fedbf3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d93f04c70701150906k2ea921e4ub5bbfad462fedbf3@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvjunk@gmail.com>
Cc: linux-assembly@vger.kernel.org


--- Hendrik Visage <hvjunk@gmail.com> wrote:

> On 1/14/07, Henio Paszczak <blurrpp@yahoo.com>
> wrote:
> 
> > Thanks .. but i want to turn secund core alive,
> and i
> > don't know how. For example how to write program
> for
> > two cores .. first core is summing integers from
> memry
> > locations mem0-mem1, second core does the same but
> > with memory location (mem1+1)-mem2 ... , how to
> load
> > %eip register in second core and start it , and so
> one
> > .. :)
> > Lukas
> 
> Well yeah....
> 
> I'm going to explain from the Linux perspective
> AFAIK, and you
> can check the dmesg etc. output to confirm these.
> 
> When the kernel starts up, it will startup on
> (typically) CPU0 core0, ie. the
> first available CPU/core, as the BIOS etc. does that
> initialization, and since
> it is single threaded only, only a single cpu/core
> is "active" at that stage.
> 
> The kernel then checks the ACPI (MPI??) and related
> information to
> see how many CPUs etc and then also checks the CPUs
> to see their
> capabilities. Once done (and SMP/HT/etc. is enabled
> in the kernel) the
> kernel will fire up and activae all those CPUs and
> their cores.
> 
> Check /proc/cpuinfo for the info the kernel knows
> about.
> 
> Then it's simple scheduling algorithms that the
> kernel makes decisions to decide
> which CPU/core gets which process that available to
> execute.
> 
> So, your program  can't normally decide on which
> CPU/core what gets executed as it's a decision done
> by the kernel, and
> the kernel
> will also decide for how long your process will be
> on that specific CPU/core.
> 
> Thus fore multi CPU and/or multi-core systems, the
> most generic (and
> usefull way)
> is to make use of threads/multiple processes and
> make use of kernel
> synchronization
> methods to sync between the seperate
> threads/processes.
> 
> Okay, there are ways (given the Linux kernel
> supports it like the
> Solaris kernel does)
> that you could request the kernel to keep your
> process/thread on a
> specific CPU/cpuset
> for reasons related to better utilization of cache
> data etc.
> 
> -- 
> Hendrik Visage
> 
Yes .. I understand that kernel is controlling that
everything, but for sure there is some linux system
call which give possibility to load secund core
another thread, to synchronize this processes and so
one. Any way .. some body  had to write the kernel and
give it "power" to decide which core to use ( of
course i can read kernel source and for sure i will,
but now i don't have enough time :) )... so for
example i want to create binary file .. program which
doing some computation on both cores, put it to
diskette boot block and restart system. There is no
linux and other os I can use only bios system calls
etc. and there is for sure some method to take control
over both cores.
Lukas 


 
____________________________________________________________________________________
Don't pick lemons.
See all the new 2007 cars at Yahoo! Autos.
http://autos.yahoo.com/new_cars.html 
