From: hp <clf@lxhp.in-berlin.de>
Subject: Re: Newbie doubts about stack !
Date: Sun, 15 Sep 2002 13:10:08 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020915131008.2309f48b.clf@lxhp.in-berlin.de>
References: <20020915104751.47329.qmail@web14507.mail.yahoo.com>
Reply-To: clf@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020915104751.47329.qmail@web14507.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ruxyz@yahoo.com
Cc: linux-assembly@vger.kernel.org

On Sun, 15 Sep 2002 11:47:51 +0100 (BST)
Anticipating a Reply <ruxyz@yahoo.com> wrote:

you'd probably better get familiar with your "C" compiler and=20
try understandig it's purpose. document which compares "C"-ish=20
data structures to assembly available via

	http://www.lxhp.in-berlin.de/linux-asm.ps.gz

>=20
> Hello All !
>=20
>    I wrote the following C program and
> obtained its assembly version , using command :
>=20
>   cc -S temp.c
>=20
> < on an x-86 Linux machine >
>=20
> /* File Name - temp.c */
>=20
> void function(int a, int b, int c) {
>    char buffer[SIZE];  -------------------> SIZE=3D51=20
> }
>=20
> void main() {
>   function(1,2,3);
> }
>=20
>=20
> The Assembly File is as below :-
>=20
>=20
> .file	"temp.c"
> 	.version	"01.01"
> gcc2_compiled.:
> .text
> 	.align 4
> .globl function
> 	.type	 function,@function
> function:
> 	pushl	%ebp
> 	movl	%esp, %ebp
> 	subl	$72, %esp -----------> Stack allocation
> 	leave
> 	ret
> .Lfe1:
> 	.size	 function,.Lfe1-function
> 	.align 4
> .globl main
> 	.type	 main,@function
> main:
> 	pushl	%ebp
> 	movl	%esp, %ebp
> 	subl	$8, %esp
> 	subl	$4, %esp
> 	pushl	$3
> 	pushl	$2
> 	pushl	$1
> 	call	function
> 	addl	$16, %esp
> 	leave
> 	ret
> .Lfe2:
> 	.size	 main,.Lfe2-main
> 	.ident	"GCC: (GNU) 2.96 20000731 (Red Hat Linux 7.1
> 2.96-81)"
>=20
>=20
> In the function part of the assembly=20
> file , I noticed that the depending on=20
> the "SIZE" of the array , it allocates=20
> memory on stack as shown in the below
> table . =20
>=20
>  Array Size       Actual stack allocation=20
>=20
>     0  - 4     =3D    4=20
>     5  - 16    =3D   24=20
>     17 - 32    =3D   40=20
>     33 - 48    =3D   56=20
>     49 - 64    =3D   72
>=20
> Can anybody please explain me ,
> what is the reason behind this ?
>=20
> Why is it that only the required=20
> amount of stack is not allocated ?
>=20
>=20
> Harmony !
>=20
>=20
>=20
> _____________________________________________________________________=
___
> Missed your favourite TV serial last night? Try the new, Yahoo! TV.
>        visit http://in.tv.yahoo.com
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
