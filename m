From: =?iso-8859-1?Q?=A3ukasz?= <blurrpp@yahoo.com>
Subject: Re: Passing parameters to assembler functions in 'C' 64 style.
Date: Thu, 4 Dec 2008 13:22:42 -0800 (PST)
Message-ID: <957934.50030.qm@web50312.mail.re2.yahoo.com>
References: <5360.11799.qm@web50303.mail.re2.yahoo.com>
Reply-To: blurrpp@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <5360.11799.qm@web50303.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org


Thank You for answers. It helps a lot ( of course i chacked what gcc is=
 doing with -S option, but i haven't enough time to chack what compiler=
 would do witch ex. 1000 parameters of different kinds( if there exist =
some body who would wants to create such function, without using for ex=
=2E struc ;)), so i guess that there must be a 'key'). Any way thanks t=
o U i have some clue.

Luke

--- On Thu, 12/4/08, =A3ukasz <blurrpp@yahoo.com> wrote:

> From: =A3ukasz <blurrpp@yahoo.com>
> Subject: Passing parameters to assembler functions in 'C' 64 style.
> To: linux-assembly@vger.kernel.org
> Date: Thursday, December 4, 2008, 9:20 PM
> Hi.=20
> I started to write assembler functions for C on 64-bit
> arch. On 32-bit arch. every parameters ware put on stack,
> now is different, what can be easyly seen reading source
> program. For example if im passing one =20
> (int *) parameter, adress (&int) is kept in %rdi
> register, and so one if u are passing more parameters.
> Ofcurse is not dificult to use it if u know but is there any
> key according to which parameters are stored?. I've made
> some "experiments" with different numbers and kind
> parameters, but the "key" must be described
> somewhere.
>=20
> Luke
>=20
>=20
>      =20
> --
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=20
> http://vger.kernel.org/majordomo-info.html


     =20
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
