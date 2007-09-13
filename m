From: =?ISO-8859-1?Q?Gerardo_Garc=EDa_Pe=F1a?= <gerardo@kung-foo.dhs.org>
Subject: Re: getting at raw command line
Date: Thu, 13 Sep 2007 17:46:44 +0200
Message-ID: <46E95B64.4090300@kung-foo.dhs.org>
References: <2cf50a010709130518m78231c2fla98997a3a7b5c9fc@mail.gmail.com>	 <316574.13339.qm@web50312.mail.re2.yahoo.com> <2cf50a010709130801y5c4538f2p5fdfae95954f8b52@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <2cf50a010709130801y5c4538f2p5fdfae95954f8b52@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

Jack Andrews escribi=F3:
> the shell changes arguments like * to a number of arguments.  is ther=
e
> a way to get the *?  that is, if my program is p, i want this
> behaviour:
>
>  $ ls
>  file.1 file.2
>  $ ls *
>  file.1 file.2
>  $ p file.1
>  file.1
>  $ p *
>  *
>
> i don't want
>
>  $ p *
>  file.1 file.2
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20

Wildcard expansion is not responsability of Unix/Operating System... it
is done by the shell (bash)
if you try

ls '*'

you will get:

ls: *: No such file or directory

and if you try

p '*'
*

You can also escape wildcard expansion in these ways:

ls '*'
ls "*"
ls \*


luck,
ge

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
