From: lx <lx@lxhp.in-berlin.de>
Subject: Re: code_for_integer_printing
Date: Fri, 6 Sep 2002 18:50:41 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020906185041.1f61cee6.lx@lxhp.in-berlin.de>
References: <web-46557921@m1.plasa.com>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-46557921@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ssams <ssams@telkom.net>
Cc: linux-assembly@vger.kernel.org

On Sat, 07 Sep 2002 00:06:03 +0700
"ssams" <ssams@telkom.net> wrote:

	[...]
> ulang_cetak:
> 	push %ecx
> 	pop %edx		#take point
> 	add $0 ,%dl		#convert to ascii

	add $'0,dl
or
	add $48,dl

> 	mov %edx,%ecx		#for printing
> 	mov $1,%edx
> 	cetak			#print
> 	pop %ecx
> 	dec %ecx
> 	jnz ulang_cetak
>=20

regards,
	hp

--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
    software=A0patents =A0http://petition.eurolinux.org/pr/pr17.html
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
