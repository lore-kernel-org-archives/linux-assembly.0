From: lx <lx@lxhp.in-berlin.de>
Subject: Re: ald
Date: Sun, 1 Sep 2002 00:06:46 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020901000646.08c13a17.lx@lxhp.in-berlin.de>
References: <Pine.LNX.4.10.10207121652080.5471-100000@newton.physics.drexel.edu>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.10.10207121652080.5471-100000@newton.physics.drexel.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick Alken <cosine@newton.physics.drexel.edu>
Cc: linux-assembly@vger.kernel.org

On Fri, 12 Jul 2002 16:54:11 -0400 (EDT)
Patrick Alken <cosine@newton.physics.drexel.edu> wrote:

i'd patch (hack) ALD to displaying encountered symbols=20
while single-stepping - 'file symbols', clobbering the=20
screen with hundreds of symbols wasn't helpful, at all.
also, reverted to compact regs display instead of full=20
screen for a single step.
and, added chars display for any size of data dumps.
'not much sense in displaying...' imho won't apply to=20
a debugger since that tool would most often be used just=20
because something un-reasonable was going on.

not much up to the 'state of the art', just functional.
diff-s and rsp. files at
	http://www.lxhp.in-berlin.de/ald-0.1.3.patch.tar.bz2

Patrick, could you probably add some means to preset a=20
base address wrt which the code addrs would display?=20
much easier setting a base ref once than to calculating=20
evry address of interest, by hand...


best,
	hp

>  The distribution site (ellipse.mcs.drexel.edu/ald.html) is down
> indefinitely due to circumstances beyond my control. I've put up a
> temporary mirror at : http://dunx1.irt.drexel.edu/~psa22/ald.html unt=
il I
> can find a more permanent site. I apologize for any inconvenience.
>=20
> Patrick Alken


--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
    software=A0patents =A0http://petition.eurolinux.org/pr/pr17.html
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
