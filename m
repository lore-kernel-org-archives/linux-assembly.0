From: madanigga <mada@deathbyice.com>
Subject: Re: Inline gcc assembly
Date: Sun, 16 Feb 2003 22:47:55 +0000 (GMT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.BSO.4.44.0302162243520.883-100000@mooper>
References: <20030217024655.31547.qmail@web11107.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030217024655.31547.qmail@web11107.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: "=?iso-8859-1?q?Rodrigo=20F.=20Baroni?=" <rodrigobaroni@yahoo.com.br>
Cc: linux-assembly@vger.kernel.org

Sorry but im not good at explaining things : )
but look for 'Using Inline Assembly With gcc' pdf
by Clark L. Coleman (plagiarist/researcher) gcc-inline-asm.pdf
another one thats shorter
http://www-106.ibm.com/developerworks/linux/library/l-ia.html?dwzone=3D=
linux
http://www.cs.virginia.edu/~clc5q/gcc-inline-asm.pdf
found it for you :) that one is a really good read.
On Sun, 16 Feb 2003, [iso-8859-1] Rodrigo F. Baroni wrote:

>
>    Hello all,
>
>
>      Please, could someone, explain how does work the
> gcc inline assembly code , like in the codes in
> /usr/src/linux/include/asm, or the sample above ? :
>
>
> #include <stdio.h>
>
> int main(void) {
>   register unsigned int out =3D 0;
>   register const char *a =3D "hello\n";
>   register size_t s =3D 6;
>
>   __asm__ __volatile__ ("movl %0, %%ebx;
> 			 movl %1, %%ecx;
> 			 movl %2, %%edx;
> 			 call __NR_write;"
> 			:
> 			:"r" (out, a, s)
> 			:"%ebx","%ecx","%edx");
>   return 0;
> }
>
>
>   There are a lot of theses at kernel source in /asm,
> .. I have look for a good explain about it, but I did
> not found yet...
>
>
>
>
>      Rodrigo F Baroni
> Computer Science Bach's Student
>     Sao Paulo, Brazil
>
> _____________________________________________________________________=
__
> Busca Yahoo!
> O servi=E7o de busca mais completo da Internet. O que voc=EA pensar o=
 Yahoo! encontra.
> http://br.busca.yahoo.com/
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
