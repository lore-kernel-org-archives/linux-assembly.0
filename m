From: h-peter recktenwald <*@lxhp.in-berlin.de>
Subject: Re: asmutils 0.17
Date: Sun, 18 Aug 2002 20:01:40 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020818200140.38cbcc2b.*@lxhp.in-berlin.de>
References: <Pine.LNX.4.43L.0208171734360.1025-100000@alpha.linuxassembly.org>
	<20020817181020.28d3a051.stephan.walter@gmx.ch>
	<20020818140104.47feb4ca.lx@lxhp.in-berlin.de>
	<20020818183716.24b4e303.stephan.walter@gmx.ch>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020818183716.24b4e303.stephan.walter@gmx.ch>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Stephan Walter <stephan.walter@gmx.ch>
Cc: linux-assembly@vger.kernel.org

On Sun, 18 Aug 2002 18:37:16 +0200
Stephan Walter <stephan.walter@gmx.ch> wrote:

> On Sun, 18 Aug 2002 14:01:04 +0000, h-peter recktenwald
> <lx@lxhp.in-berlin.de> wrote:
>=20
> > On Sat, 17 Aug 2002 18:10:20 +0200
> > Stephan Walter <stephan.walter@gmx.ch> wrote:
> >=20
> > > truss.asm should be updated. As a label of a "dd" statement it us=
es
> > > "pause", which is a reserved word in NASM 0.98.33 (and possibly i=
n
> > > all the 0.98.xx versions).
> >=20
> > why not asking nasm 'developers' to sticking to more reasonable
> > nameing?
> >=20
> > > The file MCONFIG or the Makefile respectively should be changed t=
o
> > > allow compiling with NASM 0.98.33 (and higher) as well.
> >=20
> > 'optimizing' nasm is un-safe!
> =20
> Can somebody tell me what is so bad about the newer NASM versions? If

i can, but, since you already seem to provide the answer, i doubt you'd=
=20
honestly ask.

> you don't like auto-optimization, leave it turned off.

thank you a lot for that surprising hint but, then?

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
