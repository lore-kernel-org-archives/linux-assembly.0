From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Problem with nasm
Date: Sat, 26 Mar 2005 15:50:31 -0800
Message-ID: <16965.62791.870164.701108@eidolon.muppetlabs.com>
References: <Pine.LNX.4.21.0503261209420.570-100000@hestia>
	<4245D101.2050206@nation.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4245D101.2050206@nation.pl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: shm@nation.pl
Cc: linux-assembly@vger.kernel.org

> bash-2.05b# cat exit.s
> global _start:
> 
> _start:
>          xor ebx, ebx
>          mov eax, 1
>          int 80h
> 
> 
> $ uname -srp
> Linux 2.6.11-gentoo-r3 AMD Duron(tm) Processor

I tried your file (both with and without the erroneous colon) and it
worked fine. This was on a 2.4 Linux, however, using Nasm 0.98.38.

> bash-2.05b# nasm -f elf -o exit.o exit.s
> bash-2.05b# ld -o exit exit.o

Try compiling with "gcc -nostartfiles -o exit exit.o" instead, and see
if you get different results. If so, then gcc probably knows of some
extra arguments that ld needs to produce a proper executable. Whenever
feasible, you should let gcc do the linking for you instead of
invoking ld directly. ld can take a lot of cmdline arguments.

The "-nostartfiles" option will tell gcc not to supply a _start
routine, and not to link in the usual C libraries. You will probably
still get a slightly bigger executable than if you invoked ld
directly, but not by much.

b
