From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: newbie question about integers size/portabilty.
Date: Wed, 29 Dec 2004 02:31:11 +0100
Message-ID: <20041229013110.GD22398@mail.13thfloor.at>
References: <20041228122916.GA7137@ic.unicamp.br> <opsjpz0szcuqea3r@sucks.airplane.fire> <16849.57445.118809.760890@eidolon.muppetlabs.com> <20041228235227.GA28029@ic.unicamp.br> <16849.63382.724038.94484@eidolon.muppetlabs.com> <20041229010558.GB28029@ic.unicamp.br>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041229010558.GB28029@ic.unicamp.br>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ribamar Santarosa de Sousa <ribamar.sousa@ic.unicamp.br>
Cc: Brian Raiter <breadbox@muppetlabs.com>, linux-assembly@vger.kernel.org

On Tue, Dec 28, 2004 at 11:05:58PM -0200, Ribamar Santarosa de Sousa wrote:
> > 
> > Which is exactly why you need to use code to determine the sizes.
> > Documentation won't help because the sizes are free to change over
> > time, with new versions of the OS and/or the compiler.
> > 
> 
> We're talking about 2 differents things...
> *yes, i need the codes to warranty portability in timeline (you meant
> this, i didn't meant this)
> *i don't have the machine the code was written for the first
> time, so i don't know what authors meant when defining a structure
> having an int member: 16, 32, 64 bits? code doesn't help in this case (i
> suppose :). 
> ...But don't care about this... 
> 
> > 
> > Using the types defined in <linux/types.h> will make your code
> > unportable. They aren't even guaranteed to be present in future
> > versions of Linux.
> > 
> 
> ... living and learning... i didn't know this... i thought this types
> are defined for ensure i will have a unsigned 16 bit whenever i need a
> unsigned 16 bit structure... 

yes, that is exactly the purpose of those types 
(as is with C99 stdint.h types like uint16_t
and friends)

> > If you need a type that is at least 16 bits in size, use short or
> > int. If you need a type that is exactly 16 bits in size (no more or
> > less), then use conditional compilation with the macros in <limits.h>.
> > For example:
> > 
> >   #if USHRT_MAX == 0xFFFF
> >   typedef unsigned short u16;
> >   #elif UINT_MAX == 0xFFFF
> >   typedef unsigned int u16;
> >   #else
> >   #error "Platform lacks an integer type that is exactly 16 bits."
> >   #endif
> 
> i will use this... thanks... 

if you are coding for the linux-kernel, then
I would use the __u/sXX or u/sXX types ...

best,
Herbert

> > If you don't care about portability, then why bring this up in the
> > first place?
> > 
> 
>  i do care!
> 
> Thanks,
> Riba
> 
> > b
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
