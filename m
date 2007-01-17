From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: CPU cores...
Date: Wed, 17 Jan 2007 13:23:54 +0200
Message-ID: <d93f04c70701170323x10b3061bv7b4b811d97529174@mail.gmail.com>
References: <d93f04c70701150906k2ea921e4ub5bbfad462fedbf3@mail.gmail.com>
	 <479423.63667.qm@web50313.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <479423.63667.qm@web50313.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Henio Paszczak <blurrpp@yahoo.com>
Cc: linux-assembly@vger.kernel.org

On 1/16/07, Henio Paszczak <blurrpp@yahoo.com> wrote:
> >
> Yes .. I understand that kernel is controlling that
> everything, but for sure there is some linux system
> call which give possibility to load secund core
> another thread, to synchronize this processes and so
> one. Any way .. some body  had to write the kernel and
> give it "power" to decide which core to use ( of
> course i can read kernel source and for sure i will,
> but now i don't have enough time :) )

SOlaris gives you (the system administrator/programmer/etc)
 the ability to bind (using pbind) a process (not sure about threads,
but it might
be possible too) to a specific CPU/core.
I still haven't played enough on multiple core Linux servers to
have a need for that facility/function :( as I've found that the
kernel's scheduling is mostly adequate enough once I've threaded/forked of the
correct number of threads/processes for the available CPUs/cores.

... so for
> example i want to create binary file .. program which
> doing some computation on both cores, put it to
> diskette boot block and restart system. There is no
> linux and other os I can use only bios system calls
> etc. and there is for sure some method to take control
> over both cores.
> Lukas

Check on ACPI and I think MPI (I believe 1.4 is the later version)
that tells you
about these CPUs/cores etc.

Then use the bus locking instructions for synchronization and protection
of critical stages/areas in your code. Again these principles are described
in most text books on process/thread synchronization, it's just the
assembler codes
that different from CPU to CPU ;^P


-- 
Hendrik Visage
