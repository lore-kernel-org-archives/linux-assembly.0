From: h-peter recktenwald <hp@lxhp.in-berlin.de>
Subject: Re: code-need-to-correct
Date: Thu, 19 Sep 2002 20:03:15 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020919200315.7c1ccaa3.hp@lxhp.in-berlin.de>
References: <web-50448669@m1.plasa.com>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-50448669@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ssams <ssams@telkom.net>
Cc: linux-assembly <linux-assembly@vger.kernel.org>

On Thu, 19 Sep 2002 21:40:09 +0700
"ssams" <ssams@telkom.net> wrote:

re just below your '_start:' label:

linux program space, '.text' section, by standard is in read/execute me=
mory,=20
so you cannot input to program memory. define a label and reserve some =
space=20
in the '.bss' section which is always writable - but does not contain a=
ny=20
data at program start, filled w. <nul>-s, by the linux loader. the othe=
r=20
commonly used section, '.data' can store nay data as well as may be wri=
tten=20
to, but also occupies it's space in the program binary, which .bss does=
 not.=20
just for completeness, there is also a '.rodata' setion for read-only d=
ata=20
- and several others, used by "ld" which are usually of no concern.

=2Elong 0 etc will work, but no other=20
data, re '.fill', '.rept' in the manual.

----
	.bss
inputmem:
	.long 0	# as often as required
----

best,
	hp

>=20
>  .macro sys_write
> 	mov $4,%eax
> 	mov $1,%ebx
> 	int $0x80
> .endm
> .macro sys_read
> 	mov $3,%eax
> 	mov $2,%edx
> 	mov $0,%ebx
> 	int $0x80
> .endm
> .data
> msg1: .ascii "Masukkan Angka: "
> jum_masuk:=20
> 	.byte .- msg1
> satu: .ascii "Satu Lagi: "
> jum_satu:=20
> 	.byte .- satu
> spasi: .byte 10
> .bss
> .lcomm input1,0
> .lcomm input2,0
> angka: .byte 0
> .text=20
> .globl _start
> _start:
> 	mov $msg1,%ecx		<=3D=3D read only memory
> 	mov $16,%edx
> 	sys_write
> 	sys_read		<=3D=3D cannot store to .text section
> 	mov %eax,input1
>=20
> =09
> 	mov $satu,%ecx
> 	mov $11,%edx
> 	sys_write
> 	sys_read
> 	mov %eax,input2
>=20
>=20
> tambah:
> 	mov (input2),%eax
> 	add (input1),%eax
> 	mov $10,%bx
> 	xor %ecx,%ecx
> ulang:
> 	div %bx
> 	push %edx
> 	inc %ecx
> 	cmp $0,%al
> 	jne ulang
> cetak:
> 	pop %edx
> 	add $0x30,%dx
> 	mov %dx,angka
> 	push %ecx
> 	mov $angka,%ecx
> 	mov $1,%edx
> 	sys_write
> 	pop %ecx
> 	loop cetak=09
>=20
> 	mov $spasi,%ecx
> 	mov $1,%edx
> 	sys_write
>=20
> 	movl $1,%eax	#exit
> 	movl $1,%eax	#exit
> 	movl $0,%ebx
> 	int  $0x80
>=20
> output:
>=20
> Masukkan angka: 4
> Satu lagi: 5
> 2478030160157010470915781817.....
>=20
> How to read input...?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Khusus Pelanggan Telepon DIVRE 2, Tekan 166 untuk mendengarkan pesan =
Anda.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
    software=A0patents =A0http://petition.eurolinux.org/pr/pr17.html
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
