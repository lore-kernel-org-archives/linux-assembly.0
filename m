From: Simonas Leleiva <Simonas.Leleiva@e-net.lt>
Subject: benchmarking bandwidth Northbridge<->RAM
Date: Thu, 5 Feb 2004 18:05:34 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040205160534.GA80011@uosis.mif.vu.lt>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org, linux-assembly@vger.kernel.org

Hello all,

I'm writing a benchmarking program under Linux.

Here's what I do (and what I sadly find inefficient):

1. I use the PCI_MEMORY_BAR0 address from the PCI device 00:00.0 (as
given in 'lspci' it's the Host (or North) bridge) and then I mmap the
opened /dev/mem with this address into user space, as it would be done
with any PCI device, which memory I want to access.

2. I manipulate on the returned pointer and the malloc'ed pointer (to
represent RAM) with memset command, keeping in mind that: A time for
data to flow between NB and RAM is equal to the time a RAM<->RAM
operation is completed minus the one with NB<->RAM (as I asume the
data goes RAM->NB->CPU->NB->RAM and NB->CPU->NB->RAM).

Now my doubts on each step mentioned above are:

1. Is such approach corrent? I doubt, because I've come across with
such Host bridges, which do NOT have an addresable memory region (on
my AMD Athlon NB starts @ 0xd0000000 and is of 128MB length; elsewhere
I've found it starting @ 0xe8000000-32MB, but recently my programme
crashed because the were NO addressable PCI region to the Host
bridge).
   After all, is this the way to directly accessing NB?

2. But what about L1/L2 caching ruining the benchmark, about which I judge
from very big results (~5GB/s is truly not the correct benchmark with my
2x166MHz RAM and 64bit bus - in the best case it should not overflow
2.5GB/s)? I've searched the web for cache disablings, but what I've only
found was the memtest's source-code, which works only under plain non-Linux
(non PM) environment (memtest makes a bootable floppy and then launches 'bare
naked'). So I find memtest's inline assembly useless under linux..
   The present workaround is to launch my benchmark with different set of
mem-chunks, and observing a speed-decrease at the specific size (when the
chunk doesn't fit in cache. In my case - decrease from 5GB/s to 2.9GB/s -
still too big..) and then treat that sized-chunks to be the actual benchmark
results.. However, part of the chunk may lay in cache anyway..

Where am I thinking wrong? Hope to get a tip from you out-there :)

Hear ya (hopefully soon) !

--
Simon

