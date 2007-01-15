From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: CPU cores...
Date: Mon, 15 Jan 2007 19:06:12 +0200
Message-ID: <d93f04c70701150906k2ea921e4ub5bbfad462fedbf3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Henio Paszczak <blurrpp@yahoo.com>
Cc: linux-assembly@vger.kernel.org

On 1/14/07, Henio Paszczak <blurrpp@yahoo.com> wrote:

> Thanks .. but i want to turn secund core alive, and i
> don't know how. For example how to write program for
> two cores .. first core is summing integers from memry
> locations mem0-mem1, second core does the same but
> with memory location (mem1+1)-mem2 ... , how to load
> %eip register in second core and start it , and so one
> .. :)
> Lukas

Well yeah....

I'm going to explain from the Linux perspective AFAIK, and you
can check the dmesg etc. output to confirm these.

When the kernel starts up, it will startup on (typically) CPU0 core0, ie. the
first available CPU/core, as the BIOS etc. does that initialization, and since
it is single threaded only, only a single cpu/core is "active" at that stage.

The kernel then checks the ACPI (MPI??) and related information to
see how many CPUs etc and then also checks the CPUs to see their
capabilities. Once done (and SMP/HT/etc. is enabled in the kernel) the
kernel will fire up and activae all those CPUs and their cores.

Check /proc/cpuinfo for the info the kernel knows about.

Then it's simple scheduling algorithms that the kernel makes decisions to decide
which CPU/core gets which process that available to execute.

So, your program  can't normally decide on which
CPU/core what gets executed as it's a decision done by the kernel, and
the kernel
will also decide for how long your process will be on that specific CPU/core.

Thus fore multi CPU and/or multi-core systems, the most generic (and
usefull way)
is to make use of threads/multiple processes and make use of kernel
synchronization
methods to sync between the seperate threads/processes.

Okay, there are ways (given the Linux kernel supports it like the
Solaris kernel does)
that you could request the kernel to keep your process/thread on a
specific CPU/cpuset
for reasons related to better utilization of cache data etc.

-- 
Hendrik Visage
