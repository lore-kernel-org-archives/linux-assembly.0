From: Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>
Subject: Re: newbie question about integers size/portabilty.
Date: Tue, 28 Dec 2004 23:05:58 -0200
Message-ID: <20041229010558.GB28029@ic.unicamp.br>
References: <20041228122916.GA7137@ic.unicamp.br> <opsjpz0szcuqea3r@sucks.airplane.fire> <16849.57445.118809.760890@eidolon.muppetlabs.com> <20041228235227.GA28029@ic.unicamp.br> <16849.63382.724038.94484@eidolon.muppetlabs.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16849.63382.724038.94484@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>, linux-assembly@vger.kernel.org

> 
> Which is exactly why you need to use code to determine the sizes.
> Documentation won't help because the sizes are free to change over
> time, with new versions of the OS and/or the compiler.
> 

We're talking about 2 differents things...
*yes, i need the codes to warranty portability in timeline (you meant
this, i didn't meant this)
*i don't have the machine the code was written for the first
time, so i don't know what authors meant when defining a structure
having an int member: 16, 32, 64 bits? code doesn't help in this case (i
suppose :). 
...But don't care about this... 

> 
> Using the types defined in <linux/types.h> will make your code
> unportable. They aren't even guaranteed to be present in future
> versions of Linux.
> 

... living and learning... i didn't know this... i thought this types
are defined for ensure i will have a unsigned 16 bit whenever i need a
unsigned 16 bit structure... 

> If you need a type that is at least 16 bits in size, use short or
> int. If you need a type that is exactly 16 bits in size (no more or
> less), then use conditional compilation with the macros in <limits.h>.
> For example:
> 
>   #if USHRT_MAX == 0xFFFF
>   typedef unsigned short u16;
>   #elif UINT_MAX == 0xFFFF
>   typedef unsigned int u16;
>   #else
>   #error "Platform lacks an integer type that is exactly 16 bits."
>   #endif
> 


i will use this... thanks... 

> If you don't care about portability, then why bring this up in the
> first place?
> 

 i do care!

Thanks,
Riba

> b
