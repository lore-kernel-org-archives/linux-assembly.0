From: h-peter recktenwald <lx@lxhp.in-berlin.de>
Subject: Re: i386: far jumps
Date: Fri, 19 Jul 2002 17:44:10 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020719174410.7c8f0d1f.lx@lxhp.in-berlin.de>
References: <1026786087.2055.99.camel@italia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1026786087.2055.99.camel@italia>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Emanuele Altieri <ealtieri@hampshire.edu>
Cc: linux-assembly@vger.kernel.org

On 15 Jul 2002 22:21:26 -0400
Emanuele Altieri <ealtieri@hampshire.edu> wrote:

> Greetings,
>=20
> I'm doing some experiments with far jumps to different code segments.
> For example:
>=20
>    ljmp *%fs:hello
>=20
> I get a general protection error. I don't understand why. I believe i=
t's
> a notation error. Can anybody see it?
>=20
> I'm interested in this because I need the segment argument of ljmp to=
 be

	Linux?

--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
