From: h-peter recktenwald <lx@lxhp.in-berlin.de>
Subject: Re: asmutils libc fun and games
Date: Sat, 18 May 2002 23:58:57 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020518235857.64d7047c.lx@lxhp.in-berlin.de>
References: <3CE5049F.5000405@gam.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3CE5049F.5000405@gam.co.za>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Furber <paulf@gam.co.za>
Cc: linux-assembly@vger.kernel.org

On Fri, 17 May 2002 15:24:47 +0200
Paul Furber <paulf@gam.co.za> wrote:

> bootdisk. Am Imissing the point of this libc? Even the shared librari=
es=20
> that build correctly are dynamically linked to libNoVersion and GNU l=
ibc=20
> when you ldd them. What's up with that?

I made a similar experience, -nostdlib &c just useless. found a workaro=
und=20
having "libc.a" first in the search path, which apparently keeps the GN=
U-ish=20
stuff happy but, doesn't forcedly include such nonsense.

regards,
	hp

=3D=3D=3D=3D=3D
compiled, tests passed:

> /usr/src/asm/nasm-98-3e-21/nasm 0.98.21 may miscompile asmutils, plea=
se=20
>	use only clean /usr/src/asm/nasm-98-3e-21/nasm 0.98!
patched version 98.03 (with %xdefine and un-deleted listing output)

> /usr/src/asm/nasm-98-3e-21/nasm -Llibc.lis -w+orphan-labels \
>	-w+macro-params -i/usr/src/asm/asmutils/inc/ -g -f elf \
>	-D__LINUX__ -D__KERNEL__=3D22 -D__SYSCALL__=3D__S_KERNEL__ \
>	-D__OPTIMIZE__=3D__O_SIZE__ -D__ELF__ -DDEBUG libc.asm||:
> libc.asm:154: message:
>	section attributes ignored on redeclaration of section `.text'
(always, as usual...)

> /usr/src/asm/nasm-98-3e-21/nasm -Llibc_stub.lis -w+orphan-labels \
>	-w+macro-params -i/usr/src/asm/asmutils/inc/ -g -f elf -D__LINUX__ \
>	-D__KERNEL__=3D22 -D__SYSCALL__=3D__S_KERNEL__ -D__OPTIMIZE__=3D__O_S=
IZE__ \
>	-D__ELF__ -DDEBUG libc_stub.asm||:
> ar rcv libc.a libc.o
> a - libc.o
> gcc -mcpu=3Dk6 -march=3Dk6 -Wall -O1 -g -D__NO_STRING_INLINES -fno-bu=
iltin \
>	-nostartfiles -nostdlib  -static -o test1-static test1.c \
both! 	^^^^^^^^^^^^^^^^^^^^^^^^
>	libc_stub.o libc.a

> gcc -mcpu=3Dk6 -march=3Dk6 -Wall -O1 -g -D__NO_STRING_INLINES -fno-bu=
iltin \
>	-nostartfiles -nostdlib  -static -mregparm=3D3 -D__FASTCALL__\
> 	-o test1-static-fastcall test1.c libc_stub.o libc.a
> gcc -mcpu=3Dk6 -march=3Dk6 -Wall -O1 -g -D__NO_STRING_INLINES -fno-bu=
iltin \
>	-nostartfiles -nostdlib  -static -o test2-static test2.c \
>	libc_stub.o libc.a
> gcc -mcpu=3Dk6 -march=3Dk6 -Wall -O1 -g -D__NO_STRING_INLINES -fno-bu=
iltin \
>	-nostartfiles -nostdlib  -static -mregparm=3D3 -D__FASTCALL__\
> 	-o test2-static-fastcall test2.c libc_stub.o libc.a
> /usr/src/asm/nasm-98-3e-21/nasm -Lmd5.lis -w+orphan-labels -w+macro-p=
arams \
>	-i/usr/src/asm/asmutils/inc/ -g -f elf -D__LINUX__ -D__KERNEL__=3D22 =
\
>	-D__SYSCALL__=3D__S_KERNEL__ -D__OPTIMIZE__=3D__O_SIZE__ -D__ELF__ \
>	-DDEBUG md5.asm||:
> /usr/src/asm/nasm-98-3e-21/nasm -Lrc6.lis -w+orphan-labels -w+macro-p=
arams \
>	-i/usr/src/asm/asmutils/inc/ -g -f elf -D__LINUX__ -D__KERNEL__=3D22 =
\
>	-D__SYSCALL__=3D__S_KERNEL__ -D__OPTIMIZE__=3D__O_SIZE__ -D__ELF__ \
>	-DDEBUG rc6.asm||:
> /usr/src/asm/nasm-98-3e-21/nasm --Lrmd.lis --w+orphan-labels \
>	--w+macro-params -i/usr/src/asm/asmutils/inc/ -g -f elf -D__LINUX__ \
>	-D__KERNEL__=3D22 -D__SYSCALL__=3D__S_KERNEL__ -D__OPTIMIZE__=3D__O_S=
IZE__\
>	-D__ELF__ -DDEBUG rmd.asm||:
> ar rcv libcrypto.a md5.o rc6.o rmd.o
> a - md5.o
> a - rc6.o
> a - rmd.o

--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
