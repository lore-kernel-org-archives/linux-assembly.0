From: h-peter recktenwald <*@lxhp.in-berlin.de>
Subject: Re: gas' nop(s)
Date: Fri, 9 Aug 2002 16:07:27 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020809160727.0462fe8c.*@lxhp.in-berlin.de>
References: <3D4D8E7F.8A393F62@wp.pl>
	<20020805102040.7d12bd33.*@lxhp.in-berlin.de>
	<3D4EBBA5.698AA14D@wp.pl>
	<20020805222102.193b66fc.lx@lxhp.in-berlin.de>
	<3D4F9750.328C98B1@wp.pl>
	<20020807074136.0a1c2cf3.lx@lxhp.in-berlin.de>
	<20020808155047.74fd863e.*@lxhp.in-berlin.de>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020808155047.74fd863e.*@lxhp.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org
Cc: m_hrebien@wp.pl

On Thu, 8 Aug 2002 15:50:47 +0000
h-peter recktenwald <*@lxhp.in-berlin.de> wrote:

> > >=20
> > > Yes, right! But it still adds "89F6" padding which stands for "mo=
v
> > > %esi,%esi" & my question was how to avoid this.
>=20
> just tried: apparently, the ".end" directive inhibits those alignemt =
bytes,=20
> (if not a label at end of code).

that was an error. though i wonder how some program of mine ends up=20
with an odd address. probably due to its .data end. so i tried asm=20
into a .data section, which works and, does #not# align. so, since you=20
seem not to asm to any fixed 'format', that might be the alternative.

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
