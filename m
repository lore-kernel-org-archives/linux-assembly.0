From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: inline asm mmx: how to movq from memory to %mmX
Date: Tue, 17 Apr 2007 07:58:17 -0700
Message-ID: <1176821897.6227.3.camel@localhost>
References: <2cf50a010704170628r3f4229c3lad2b58743c63462e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <2cf50a010704170628r3f4229c3lad2b58743c63462e@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jack Andrews <effbiae@gmail.com>
Cc: linux-assembly@vger.kernel.org

You are missing two commas:
        asm("movq %0 %%mm1\n\t"
>             "paddq %%mm1 %%mm0"
> 

should be:
        asm("movq %0, %%mm1\n\t"
            "paddq %%mm1, %%mm0"

I did not check for any other errors, but this now compiles without error on my system.

-- Bob


On Tue, 2007-04-17 at 23:28 +1000, Jack Andrews wrote:

> 
> i get these errors when i try to compile:
> 
> [jack@fedora i]$ gcc -mmmx v.c
> /tmp/ccWXntVc.s: Assembler messages:
> /tmp/ccWXntVc.s:19: Error: suffix or operands invalid for `movq'
> /tmp/ccWXntVc.s:20: Error: junk `%mm0' after register
> 
> [jack@fedora i]$ gcc -v
> Using built-in specs.
> Target: i386-redhat-linux
> Configured with: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/u
> sr/share/info --enable-shared --enable-threads=posix --enable-checking=release -
> -with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-
> libgcj-multifile --enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable
> -java-awt=gtk --disable-dssi --with-java-home=/usr/lib/jvm/java-1.4.2-gcj-1.4.2.
> 0/jre --with-cpu=generic --host=i386-redhat-linux
> Thread model: posix
> gcc version 4.1.0 20060304 (Red Hat 4.1.0-3)
> 
> 
> [jack@fedora i]$ cat v.c
> #include <string.h>
> #include <stdio.h>
> #include <stdlib.h>
> 
> typedef long I;
> typedef char C;
> #define IZ sizeof(I)
> #define W 2
> 
> simd(n, is)
> I *is;
> {   I i;
>     asm("pxor %mm0,%mm0");
>     for (i=0; i < n; i += W) {
>         asm("movq %0 %%mm1\n\t"
>             "paddq %%mm1 %%mm0"
>             :
>             :"m"(is[i])           );
>     }
>     return 0;
> }
> 
> sisd(n, is)
> I *is;
> {
>     I i = 0, j = 0;
>     for (i = 0; i < n; i++)
>         j += is[i];
>     return j;
> }
> 


