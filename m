From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: How to get allocate memory run time
Date: Wed, 11 Feb 2004 16:51:39 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16426.52763.577200.389101@eidolon.muppetlabs.com>
References: <20040211172713.07ca6282.vadiraj@mail.cyberneme.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040211172713.07ca6282.vadiraj@mail.cyberneme.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>
Cc: linux-assembly@vger.kernel.org

>   I was wondering how to allocate memory run time in assembly? till
> now I used to allocate from c and pass it to the assembly function,
> and when I looked at the assembly code of small funtion which calls
> malloc, the asm calls malloc internally.
> 
>   If any one know how to allocate memory in assembly other than
> calling the extern c funtion..

libc's malloc et al work by using the brk system call (#45 in Linux).

All this system call does is increase the amount of memory your
application can use. Typically, your program is organized in memory so
that code (and read-only data) come first, then initialized writeable
data, and finally zero-initialized writeable data (i.e. the .bss
segment). The brk system call can then be seen as a way to expand the
size of your bss segment at runtime (although without
zero-initializing).

The typical way to use it is to first call brk with an argument of
zero. The return value then gives you the initial break position. Save
this value, and then use it in a second call to brk after increasing
it by the amount of extra memory you desire. (If the return value is
the same as the saved value, then the allocation request failed.) The
saved value is then your pointer to the bottom of the new memory.

Note that the system does not do any arena or heap management. That is
what libc provides. So, if you need arbitrarily large amounts of
arbitrarily-sized memory, using libc is definitely the easiest way.

b
