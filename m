From: h-peter recktenwald <lx@lxhp.in-berlin.de>
Subject: Re: gas' nop(s)
Date: Mon, 5 Aug 2002 22:21:02 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020805222102.193b66fc.lx@lxhp.in-berlin.de>
References: <3D4D8E7F.8A393F62@wp.pl>
	<20020805102040.7d12bd33.*@lxhp.in-berlin.de>
	<3D4EBBA5.698AA14D@wp.pl>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D4EBBA5.698AA14D@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: m_hrebien@wp.pl
Cc: linux-assembly@vger.kernel.org

On Mon, 05 Aug 2002 19:53:41 +0200
m_hrebien@wp.pl wrote:
=20
> Guess what? I've tried this .align directive as Jani Monoses suggeste=
d
> like this:
>=20
> .text
>=20
> .align 1
>=20
> .globl _start
> _start:
> 	mov	$1,%eax
> 	xor	%ebx,%ebx
> 	int	$0x80
>=20
> and it's not working as i wish - gas adds lea (%esi),%esi after int
> $0x80 to the output :( I've tried with 2, 4, 8 & 16 and it seems that
> .align x works good if x is greater equal than 4 :( But why??

=2Etext section for ELF format defined to be page aligned, so it's alwa=
ys a=20
multiple of 4, and the end-alignment added for what "bu" gnu-ers seem t=
o=20
think is #the# appropriate thing or, just more convenient to further as=
m=20
output processing - just guessing, has anyone else a more thorough idea=
?

a work-around for piped output may be defining a label at code end and=20
taking the actually assmbled code length from the listing file. tested:

echo ".att_syntax noprefix;.global XLAB;jnc XLAB;movl eax,ebx;\
      movl ebx,edx;XLAB:;.end"|as -achnlsd m=3Dl --gstabs |tee t

the listing:
----------------------------------------------------
   1 0000 0F83FCFF      .att_syntax noprefix
   1      FFFF89C3
   1      89DA89F6
DEFINED SYMBOLS
    {standard input}:1      .text:0000000a XLAB

NO UNDEFINED SYMBOLS
--------------------------------------------------
asm 4 bytes shorter w/o the ".global" statement, <jnc> then w. byte dis=
p.

regards,
	hp
=20
--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
