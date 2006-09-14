From: Marcin =?utf-8?q?Ko=C5=9Bcielnicki?= <markosc@interia.pl>
Subject: Re: hint?
Date: Fri, 15 Sep 2006 00:05:59 +0200
Message-ID: <200609150005.59939.markosc@interia.pl>
References: <20060914195852.88791.qmail@web50313.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060914195852.88791.qmail@web50313.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-assembly@vger.kernel.org

> Hi.
> I've read hint in some magazine that if you are not
> using the same registers in following lines new
> procesor ( my is quite old PIII(coppermine)600Mhz )
> can make commands syumyltaniously ie:
>
> mov %eax,%ebx
> mov %ecx,%edx
>
> can be does allmost in the same time. i've check it by
> using extremly simple example:
>
> movl $3,%ebx
> movl $3,%edx
> movl $0b111111111111111111111111111,%ecx
>
> loop:
> sall $2,%eax
> orl  %ebx,%eax
> sall $2,%edi
> orl  %edx,%edi
>    loop loop
>
> it works ( agains theorem from magazine ) faster then
>
> movl $3,%ebx
> movl $3,%edx
> movl $0b111111111111111111111111111,%ecx
>
> loop:
> sall $2,%eax
> sall $2,%edi
> orl  %ebx,%eax
> orl  %edx,%edi
>    loop loop
>
> so what is real answer ?

Doing mutually-independent computations [that is, ones that can be exec=
uted=20
parallel without changing the outcome] simultanously indeed speeds up t=
he=20
computation. HOWEVER, modern x86s look ahead several instructions at a =
time=20
and have the capability to move some instructions out of order a bit if=
 it=20
can be proved to not change the result. Since your code snippets are qu=
ite=20
short, the CPU sees the whole thing at once and rearranges the code to=20
parallel version anyway. So basically, both versions should be executed=
 in=20
about the same time, with minor differencies due to internal chip detai=
ls=20
varying between different CPU models.

Scheduling operations for mutual independence is important when you're =
dealing=20
with bigger pieces of code. If your function does the same long computa=
tion=20
on 3 sets of data [and you can manage to fit 3 simultanous computations=
 in=20
x86's small register set], it's much faster to interleave these three=20
computations than do them one after another.

> Secund i'he allways trying not to use moemory becouse
> its extremly slow .
>
> nut again if i exchange walue between registers with
> using temporary memory:
>
> movl %eax,temp
> movl %ebx,%eax,
> movl temp,%ebx
>
> it works faster than:
>
> movl %eax,%edx
> movl %ebx,%eax,
> movl %edx,%ebx
>
> WHY? maybe linux is doing something in the mean time
> ... ?

Where did you get that result? On my machine, the version using memory =
is 1.5x=20
slower than register-only, as expected.

> amaizing hink is that
>
> xchgl %eax,%ebx
>
> works slowest :) WHY ?

See, x86 is 20 years old. Some things that seemed like a good idea 20 y=
ears=20
ago proved to be teh suck by now. One major category of sucky things in=
 x86=20
are useless instructions. One of them is xchg for register-to-register=20
exchange. It is slow, because intel only bothers to speed up instructio=
ns=20
that people actually use. And noone uses it, since code rarely swaps co=
ntents=20
of registers around. The variables usually just stay in one register. A=
nd=20
there's no reason to move them around later -- what's gained by freeing=
 this=20
register only to occupy another one?

Note: xchg for memory is entirely different beast. It is way slower tha=
t you=20
might assume. That's because xchg for memory is actually useful, but on=
ly for=20
one thing: as an atomic operation for implementing locking mechanisms f=
or=20
multi-threaded and/or multi-processor stuff. And locking needs special=20
measures to be taken so that this location is always consistent among a=
ll CPU=20
caches. And that is slow.

> I realy need time in my programs thats why i'm looking
> for any optimalization...
>
> Lukas

Marcin Ko=C5=9Bcielnicki

-----------------------------------------------------------------------=
-
Szybko i tanio ubezpiecz samochod!=20
Kupno polisy zajmie Ci 15 minut! Kontakt przez telefon albo Internet.=20
Kliknij i sprawdz: http://link.interia.pl/f19a0

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
