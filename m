From: Learner <ruxyz@yahoo.com>
Subject: Re: OFF-TOPIC : Confusion about basic C program behaviour
Date: Mon, 14 Mar 2005 01:05:38 -0800 (PST)
Message-ID: <20050314090538.86802.qmail@web41127.mail.yahoo.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
In-Reply-To: 6667
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Gerardo =?ISO-8859-1?Q?=20=22Garc=EDa=22?= =?ISO-8859-1?Q?=20=22Pe=F1a=22?= <gerardo@kung-foo.dhs.org>
Cc: Linux Kernel Newbie <kernelnewbies@nl.linux.org>, Assembly Linux <linux-assembly@vger.kernel.org>

Thank you for the useful link .

--- Gerardo Garc=EDa Pe=F1a <gerardo@kung-foo.dhs.org>
wrote:
> Learner wrote:
>=20
> >Hi,
> >
> >  I know this is not the correct place to post this
> >question, but I feel it would be pretty easy for
> the
> >kernel gurus to explain this. =20
> >
> >TEST CODE
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >#include <stdio.h>
> >
> >main()
> >{
> >   float a1=3D1.0;
> >   float a2=3D2.0;
> >
> >   printf(" \n");
> >   printf(" Size of Float > %d \n", sizeof(float)
> );
> >   printf(" Size of Int   > %d \n", sizeof(int) );
> >   printf(" \n");
> >
> >   printf(" CASE 1 : f-f > %f - %f \n\n", a1, a2);
> >   printf(" CASE 2 : f-d > %f - %d \n\n", a1, a2);
> >   printf(" CASE 3 : d-f > %d - %f \n\n", a1, a2);
> >   printf(" CASE 4 : d-d > %d - %d \n\n", a1, a2);
> >}
> >
> >OUTPUT :
> >
> > Size of Float > 4
> > Size of Int   > 4
> >
> > CASE 1 : f-f > 1.000000 - 2.000000
> >
> > CASE 2 : f-d > 1.000000 - 0
> >
> > CASE 3 : d-f > 0 - 0.000000
> >
> > CASE 4 : d-d > 0 - 1072693248
> >
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >The CASE1 & CASE2 & CASE4 outputs are expected.
> >
> >   Any explanation for CASE3 behaviour.=20
> >   I presume it should behave similar to CASE2 and
> >print 0 - 2.000000 .
> >
> >   Could somebody please pin-point what is=20
> >lacking in my presumtion .
> >
> >Thanks !
> >
> > =20
> >
> I believe this happens because float is promoted to
> double when it is=20
> passed as an arg... so you should think that double
> =3D 8 and int =3D 4.
>=20
> I have been googling and I have found this:
>=20
>   =20
>
http://www-ccs.ucsd.edu/c/function.html#argument%20promotion
>   =20
>=20


	=09
__________________________________=20
Do you Yahoo!?=20
Yahoo! Small Business - Try our new resources site!
http://smallbusiness.yahoo.com/resources/=20
