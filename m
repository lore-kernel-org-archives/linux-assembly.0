From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: newbie question about integers size/portabilty.
Date: Tue, 28 Dec 2004 16:17:26 -0800
Message-ID: <16849.63382.724038.94484@eidolon.muppetlabs.com>
References: <20041228122916.GA7137@ic.unicamp.br>
	<opsjpz0szcuqea3r@sucks.airplane.fire>
	<16849.57445.118809.760890@eidolon.muppetlabs.com>
	<20041228235227.GA28029@ic.unicamp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20041228235227.GA28029@ic.unicamp.br>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ribamar Santarosa de Sousa <ribamar@fee.unicamp.br>
Cc: linux-assembly@vger.kernel.org

> I really needed of documentation on data syzes and no code would
> save me because i don't have all the machines that the code could
> work.

Which is exactly why you need to use code to determine the sizes.
Documentation won't help because the sizes are free to change over
time, with new versions of the OS and/or the compiler.

> The code was written with (i guess) not with the best pratices in
> this point, it uses int, short , long instead the data types defined
> in linux/types.h (__u16, __s8, ...)...

Using the types defined in <linux/types.h> will make your code
unportable. They aren't even guaranteed to be present in future
versions of Linux.

If you need a type that is at least 16 bits in size, use short or
int. If you need a type that is exactly 16 bits in size (no more or
less), then use conditional compilation with the macros in <limits.h>.
For example:

  #if USHRT_MAX == 0xFFFF
  typedef unsigned short u16;
  #elif UINT_MAX == 0xFFFF
  typedef unsigned int u16;
  #else
  #error "Platform lacks an integer type that is exactly 16 bits."
  #endif

If you don't care about portability, then why bring this up in the
first place?

b
