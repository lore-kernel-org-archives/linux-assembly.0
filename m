From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Segmented or Flat model
Date: Wed, 23 May 2007 21:20:40 -0700
Message-ID: <18005.4760.669314.281153@eidolon.muppetlabs.com>
References: <18004.62605.733392.766670@eidolon.muppetlabs.com>
	<BAY133-F13206F74E0BF11906D203CF5340@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-F13206F74E0BF11906D203CF5340@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A D <a_d_249@hotmail.com>
Cc: linux-assembly@vger.kernel.org

>>> I suppose that depends on your target platform. Since you sent
>>> this to linux-assembly, I'm going to assume that the answer is
>>> "flat". For all practical purposes, there is no "segmented" memory
>>> model on 32-bit x86 linux.
> 
> correct me if i'm wrong. But what I understand are you saying that
> x86 linux doesn't use segmented memory model.

Well, note that I did say, "for all practical purposes".

Linux does have selectors, of course, but you hardly ever think about
them. A process under 32-bit Linux can access a maximum of 4GB, so
there is basically only one memory segment, and it contains
everything. And that's basically the definitely of a flat memory
model. (This is still a simplification -- there are actually four
selectors, but they all map to the same address space.)

Linux instead uses the memory paging mechanism to control access. Thus
for example, most executables are loaded to the same virtual memory
address (namely 0x08048000), and it's the kernel's job to map each
process's physical memory to the correct virtual address while that
process is running.

> Because I'm reading the book "Understanding Linux Kernel" and the
> author is saying that linux uses segmented memory model.

Well, if you're talking about kernel programming, that's a slightly
different context. In that case, I would say that yes, Linux does have
segments, but it doesn't really do much with them beyond setting up
the global selector table during bootup, and a bit when switching
between kernel-mode and user-land. From the perspective of an
application programmer, however, Linux memory model is definitely
flat.

b
