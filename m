From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: linux system call for allocation of memory
Date: Thu, 13 Nov 2003 12:34:28 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16307.60116.606849.254490@eidolon.muppetlabs.com>
References: <3FB33D54.9000605@cbf.chinese2000.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FB33D54.9000605@cbf.chinese2000.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> I would like to know if the linux kernel has the syscall for memory
> manipulation(allocation, release and resize) that synonymous with
> DOS 48H of INT 21.  I've read some documents saying that these are
> implemented in C library.

The brk system call can be used to enlarge your process's heap. You
can then manage your heap by writing your own set of
malloc-realloc-free functions. Alternately, you can use the mmap
system call to allocate arbitrary pages of memory directly.

b
