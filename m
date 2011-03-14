From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Fwd: 4x4 single-precision matrix product with SSE
Date: Mon, 14 Mar 2011 15:43:08 +0000
Message-ID: <AANLkTimtyx3+bapOWEC=WO5hV5v+q4_EWh15TvHFQVdz@mail.gmail.com>
References: <4D7AA710.2030303@gmail.com> <AANLkTimCWmanFU19admtg5q18HvCOxrdjm+9XWFT-0Zm@mail.gmail.com>
 <4D7D27C3.5050404@gmail.com> <AANLkTim-ZqzJ+2q+u=7+yRjzTf7FQDcuu-YDN=RV0H6X@mail.gmail.com>
 <AANLkTimny0PkR0bYBjKgaH4j=_=2aL=rt=YcDjWeQCG6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-type:content-transfer-encoding;
        bh=97G/D0o8x8joHitqd5PAMYfL5NVtvA1gDOK2IXdmiRY=;
        b=Gw5H0t4J5vGXzJEwaikHmPexgejxFJmHZFN7JLLaAyhXl2QSohJI146AGDZeE/D/O0
         8vuy3vphSr09bCCeVZrQC+UOKeiL8XB4eqfYT7KKRK4G+lWxx4704hbFr77myjt82byz
         wu/gaVv96E3hF0kf2iZ8vzldAuGg3i77MxtOA=
In-Reply-To: <AANLkTimny0PkR0bYBjKgaH4j=_=2aL=rt=YcDjWeQCG6@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-assembly <linux-assembly@vger.kernel.org>

Hi Ren=C3=A9,

you might be completely right, I have yet to discover a better way of
ordering the registers. But I wonder, wouldn't the statement in line
49 coupled with line 52 make sure that dpps is done? The blendps
instruction in line 52 can not be computed unless the result of xmm13
from dpps in line 49 is known. By the time the program hits line 55,
all dependencies on xmm8 are gone. I have to admit though that I am
just guessing here, I don't think I have a good understanding yet as
to how to deal with instruction dependencies...

=C2=A041 =C2=A0 # Calculate C(1,:).
=C2=A042 =C2=A0 movaps %xmm4, %xmm10
=C2=A043 =C2=A0 dpps $0xf1, %xmm8, %xmm10
=C2=A044 =C2=A0 movaps %xmm5, %xmm11
=C2=A045 =C2=A0 dpps $0xf2, %xmm8, %xmm11
=C2=A046 =C2=A0 movaps %xmm6, %xmm12
=C2=A047 =C2=A0 dpps $0xf4, %xmm8, %xmm12
=C2=A048 =C2=A0 movaps %xmm7, %xmm13
=C2=A049 =C2=A0 dpps $0xf8, %xmm8, %xmm13
=C2=A050 =C2=A0 blendps $0x01, %xmm10, %xmm11
=C2=A051 =C2=A0 blendps $0x03, %xmm11, %xmm12
=C2=A052 =C2=A0 blendps $0x07, %xmm12, %xmm13
=C2=A053 =C2=A0 addps %xmm13, %xmm0
=C2=A054
=C2=A055 =C2=A0 movaps 0x20(A), %xmm8

On Sun, Mar 13, 2011 at 21:08, Ren=C3=A9 Dudfield <renesd@gmail.com> wr=
ote:
>
> Hi,
>
> I may be completely wrong... but I think you could avoid dependencies=
 with this following block and xmm8?=C2=A0 dpps is high latency, so may=
be you can do some non dependent things while it does it's business?
>
> =C2=A0 # Calculate C(1,:).
> =C2=A0 movaps %xmm4, %xmm10
> =C2=A0 dpps $0xf1, %xmm8, %xmm10
> =C2=A0 movaps %xmm5, %xmm11
> =C2=A0 dpps $0xf2, %xmm8, %xmm11
> =C2=A0 movaps %xmm6, %xmm12
> =C2=A0 dpps $0xf4, %xmm8, %xmm12
> =C2=A0 movaps %xmm7, %xmm13
> =C2=A0 dpps $0xf8, %xmm8, %xmm13
> =C2=A0 blendps $0x01, %xmm10, %xmm11
> =C2=A0 blendps $0x03, %xmm11, %xmm12
> =C2=A0 blendps $0x07, %xmm12, %xmm13
> =C2=A0 addps %xmm13, %xmm0
>
> =C2=A0 movaps 0x20(A), %xmm8
>
>
>
> 2011/3/13 Nicolas Bock <nicolasbock@gmail.com>
>>
>> I have attached a short test project that demonstrates what I am doi=
ng.
>>
>> I time this simply with the time function, i.e.
>>
>> $ time ./mul_SSE 100000000
>>
>> real =C2=A0 =C2=A00m1.037s
>> user =C2=A0 =C2=A00m1.036s
>> sys =C2=A0 =C2=A0 0m0.001s
>>
>> $ time ./mul_SSE4_1 100000000
>>
>> real =C2=A0 =C2=A00m2.006s
>> user =C2=A0 =C2=A00m2.003s
>> sys =C2=A0 =C2=A0 0m0.002s
>>
>> I assume that I have prepared the A matrix for SSE a little bit by
>> "dilating" the elements into A =3D { A11, A11, A11, A11, A12, A12, .=
=2E. =C2=A0},
>> while for SSE4.1 I am calling the multiply with the transpose of B.
>>
>> As these matrices are really small, they should be completely in L1,=
 so
>> the movaps operation should have pretty low latency. Since the SSE
>> version uses 4 times more data for A than the SSE4.1 version, I am
>> surprised that given the larger number of data movements for the SSE
>> version it still beats the SSE4.1 version. But maybe I am just not
>> coding this very intelligently.
>>
>> Any suggestions would be very welcome,
>>
>> Thanks already, nick
>>
>>
>> On 03/12/11 01:20, Frederic Marmond wrote:
>> > Hello Nicolas,
>> >
>> > Yes, it's the right place :)
>> > could you please paste your code as well as your benchmark context=
 ?
>> >
>> > Fred
>> >
>> > 2011/3/11 Nicolas Bock <nicolasbock@gmail.com
>> > <mailto:nicolasbock@gmail.com>>
>> >
>> > =C2=A0 =C2=A0 Hello list,
>> >
>> > =C2=A0 =C2=A0 I am writing an assembly function that multiplies 2 =
4x4 single precision
>> > =C2=A0 =C2=A0 matrices. I wrote 2 versions, one using SSE the othe=
r using SSE4.1. What
>> > =C2=A0 =C2=A0 surprised me is that the SSE4.1 version fails to bea=
t the SSE version,
>> > =C2=A0 =C2=A0 it is in fact slightly slower.
>> >
>> > =C2=A0 =C2=A0 Is this the right place to ask for help? If anyone i=
s interested I can
>> > =C2=A0 =C2=A0 post some code which would maybe clarify the situati=
on a bit.
>> >
>> > =C2=A0 =C2=A0 If this is not the right place, please ignore me...
>> >
>> > =C2=A0 =C2=A0 nick
>> >
>> >
>
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
