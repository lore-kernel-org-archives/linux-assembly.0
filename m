From: h-peter recktenwald <*@lxhp.in-berlin.de>
Subject: Re: gas' nop(s)
Date: Mon, 5 Aug 2002 10:20:40 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020805102040.7d12bd33.*@lxhp.in-berlin.de>
References: <3D4D8E7F.8A393F62@wp.pl>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D4D8E7F.8A393F62@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: m_hrebien@wp.pl
Cc: linux-assembly@vger.kernel.org

On Sun, 04 Aug 2002 22:28:47 +0200
m_hrebien@wp.pl wrote:

> Hi there,
>=20
> did You noticed that GNU as adds some padding nop(s) like:
>=20
> lea (%esi),%esi
> mov %esi,%esi
> nop
>=20
> at the end of .text section? Is this really necessary? The .text sect=
ion
> mustn't be padded to 4 like it seems to be or am i wrong? How can i
> avoid this? Is there any gas option to switch this off?

some time back, i tried AS as an intermediate program, w. piped i/o, an=
d=20
encountered the same problem, which i didn't manage to solve, too. ther=
e=20
is no option + no other idea. those gods of gnu binutils devel might kn=
ow=20
but, i myself never received an answer to any AS related question...

anyway, AS wsn't meant to do plain, stand alone assembly but is designe=
d=20
to produceing a set of data which can be combined to something, probabl=
y=20
executeable, with the "ld" linker. so the implicite alignment might eve=
n=20
be very helpful for faster processing.

i'd (highly) recommend the "fasm" assembler for the more 'direct' work:=
)
	http://fasm.metro-nt.pl/

> Sorry if this topic is doubled by me but i couldn't find something
> similar in the archive :(
>=20
> --=20
> Maciej Hrebien
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
