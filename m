From: peter willy krause <wklux@yahoo.co.uk>
Subject: Re: I've got a stupid question...
Date: Fri, 16 Jan 2004 22:58:18 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200401162258.39086.wklux@yahoo.co.uk>
References: <S265333AbUAPPiW/20040116153822Z+31565@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <S265333AbUAPPiW/20040116153822Z+31565@vger.kernel.org>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: RaZoR <RaZoR@darksorcerers.org>, linux-assembly@vger.kernel.org, linux-assembly-owner@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

examples, for instance, in  "lib4th", file "l4jobs.inc".
	http://www.lxhp.in-berlin.de/e-lhpf8.html

w. "asmutils" (re http://linuxassembly.org") just
	sys_getuid

plain "nasm":
	mov eax,24
	int 128

"as":
	movl $24,eax
	int 128

best,
	hp

Am Freitag, 16. Januar 2004 15:33 schrieb RaZoR:
> So I've written many progs in nasm , but I wonder how to write
> a program that returns the current UID. I know the sys call and so on
> but it doesn't return the value in EAX and I don't have an idea where
> it returns it..
> So I'm asking for a favor , if someone could give me an example of
> writing code in nasm with sys calls like 24 (get user id)
> Best Regards
>        RaZoR at DarkSorcerers
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-assembly" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

- -- 
mailto lx -a- lxhp -:- in-berlin -:- de
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFACGye4A8LYevsFkwRAiyVAJkBk3Rtydt4B+BAk9uUSMS6fPBdrACgnxfp
oT1GW6GljepDVAn0QM+YLTM=
=v5NU
-----END PGP SIGNATURE-----

