From: h-peter recktenwald <*@lxhp.in-berlin.de>
Subject: Re: gas' nop(s)
Date: Thu, 8 Aug 2002 15:50:47 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020808155047.74fd863e.*@lxhp.in-berlin.de>
References: <3D4D8E7F.8A393F62@wp.pl>
	<20020805102040.7d12bd33.*@lxhp.in-berlin.de>
	<3D4EBBA5.698AA14D@wp.pl>
	<20020805222102.193b66fc.lx@lxhp.in-berlin.de>
	<3D4F9750.328C98B1@wp.pl>
	<20020807074136.0a1c2cf3.lx@lxhp.in-berlin.de>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020807074136.0a1c2cf3.lx@lxhp.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org
Cc: m_hrebien@wp.pl

On Wed, 7 Aug 2002 07:41:36 +0000
h-peter recktenwald <lx@lxhp.in-berlin.de> wrote:

> On Tue, 06 Aug 2002 11:30:56 +0200
> m_hrebien@wp.pl wrote:
>=20
> > > asm 4 bytes shorter w/o the ".global" statement, <jnc> then w. by=
te disp.
> >=20
> > Yes, right! But it still adds "89F6" padding which stands for "mov
> > %esi,%esi" & my question was how to avoid this.
>=20
> ok. you can not.

just tried: apparently, the ".end" directive inhibits those alignemt by=
tes,=20
(if not a label at end of code).


hp

--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
