From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: OSS ioctls...
Date: Thu, 23 Dec 2004 10:25:22 +0100
Message-ID: <41CA8F02.EAE296D8@wp.pl>
References: <41C988EB.9CC568EF@comcast.net> <opsje7k0wruqea3r@sucks.airplane.fire> <41C9DBB4.C82BDD71@wp.pl> <41C9E536.11EBD867@wp.pl> <opsjfpstznuqea3r@sucks.airplane.fire>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Richard Cooper wrote:
> 
> > Did you tried the linuxassembly.org/articles/audio.html? Your code looks
> > very similar and %define's seems to be different.
> 
> I must have skimmed throught the list too fast, I didn't realize there was
> an article.  Otherwise I would have read that instead of the massive PDF
> than is the OSS documentation.  It's really quite nice documentation.  It
> just naturally doesn't define the IOCTL numbers.  It's at
> http://www.opensound.com/pguide/oss.pdf if anyone's interested.
> 
> But anyway, looking at the example I see there's a $C0040000 or'ed with
> most of the ioctl numbers, and adding that to my numbers fixed everything
> up.
> 
> Looking back at the header file I see that some of the IOCTL numbers go
> through a different macro...
> 
>    #define SNDCTL_DSP_SETFRAGMENT               _SIOWR('P',10, int)
>    #define      _SIOWR(x,y,t)   ((int)(SIOC_INOUT|((sizeof(t)&SIOCPARM_MASK)<<16)|(x<<8)|y))
>    #define      SIOC_INOUT      (SIOC_IN|SIOC_OUT)
>    #define      SIOC_OUT                0x20000000      /* copy out parameters */
>    #define      SIOC_IN         0x40000000      /* copy in parameters */
> 
> Now as I see it, that should make those IOCTL numbers begin with $6004,
> not $C004, but $6004 doesn't work, only $C004 works.  So I still don't see
> where the $C004 is coming from, but at least I know how to make it work
> now.
> 
> Thanks for your help.  I probably wouldn't have figured that out on my own
> until next year or the year after when I happen to stumble upon the
> linuxassembly article, seeing as the header file isn't even correct.

Read soundcard.h more careful. soundcard.h includes <linux/ioctl.h>
which includes <asm/ioctl.h> with defined _IOWR. So the code we are
considering is not even preprocesed. "#if defined(_IOWR)..." from
soundcard.h does "#define _SIOWR _IOWR". _IOWR from <asm/ioctl.h>
takes three arguments with first one named 'type' and 'dir' eq
_IOC_READ|_IOC_WRITE when going to _IOC(dir,type,nr,size). As
_IOC_READ|_IOC_WRITE is numericaly eq 3 and 'dir' from  _IOC is
shifted left 30 times (_IOC_DIRSHIFT) so you have 0xc in the MSB.

Hope this helps :)

-- 
Maciej Hrebien

