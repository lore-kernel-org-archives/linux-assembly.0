From: Lu Zhao <zhlsd@yahoo.com>
Subject: Re: Hi folks
Date: Fri, 23 Apr 2004 08:15:15 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040423151515.21810.qmail@web40710.mail.yahoo.com>
References: <4088B722.2020001@eprocess.fr>
Reply-To: luzhao@cs.bgsu.edu
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4088B722.2020001@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux assembly <linux-assembly@vger.kernel.org>

Assembly is very important, but it depends on where to use it.

There are two types of things, I think, that one can do in assembly
language for a system. One is to add support for new hardware. However,
most of the time, hardware vendors've done the work by providing kernel
modules. The second one is more interesting and challenging for a
general purpose computer. That's to improve the current linux assembly,
making it better, or start a new object-oriented interface for kernel
development, making it easily usable by C++. Those kernel developers
for some architectures must have been working on rebuilding the lowest
interface for kernel development, but I am wondering why nobody is
trying to come up with an object-oriented solution. Maybe the high risk
of nobody using it after developing such a system places any formal
efforts under table. Some day in the future, I might start to try it as
a hobby, just like the way the linux kernel was born, or I'll never do
it because I'm lazy. :)

Some good places for practicing assembly is to look at some chip
vendors' mailing lists to see what others are doing.

Assembly is not meant to be hot these days, because it means a sort of
binding with hardware. Things get complicated once touching hardware.
Maybe the basic constraint is that hardware is a type of physical
resource, not pure intelligent resource. Only some people may have it.

Tyne

--- Frederic Marmond <fmarmond@eprocess.fr> wrote:
> Steffen Solyga wrote:
>=20
> >is it really that silent in here?
> >nevertheless, greetings from berlin!
> >
> > =20
> >
> yes, it seems that:
> 1- the list is broken
> 2- assembly is so badly represent in today's computer world that
> nobody=20
> want to show he loves it
> 3- nobody have problems in assembly
>=20
> ;)
> It's a little boring, I've a lot of time theses days, and would very=20
> much appreciate to do some support on assembly/kernel/system
> things...
>=20
> Bonjour de Montpellier (South France)
>=20
> Fred
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash
