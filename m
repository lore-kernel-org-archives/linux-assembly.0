From: hpr <phpr@snafu.de>
Subject: Re: ld trouble
Date: Wed, 29 Jan 2003 15:12:57 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200301300442.h0U4gVDn017101@hirsch.in-berlin.de>
References: <3E37A809.7080407@nm.ru>
Reply-To: lx@snafu.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3E37A809.7080407@nm.ru>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kirill Ratkine <rabbitos@nm.ru>, linux-assembly@vger.kernel.org

modify the linker command:

	ld --dynamic-linker /lib/ld-linux.so.2 -ldl -s -o cg cg.o


Kirill Ratkine am Mittwoch, 29. Januar 2003 10:08:
> Hello.
>
> Could somebody explain me where the problem is?
>
> my nasm file:
> ; ===
> section .text
>      global _start
>
> msg     db      'Dyna Loading!',0xa
> len     equ     $ - msg
>
> _start:
>          mov     edx,len
>          mov     ecx,msg
>          mov     ebx,1
>          mov     eax,4
>          int     0x80
>          mov     eax,1
>          int     0x80
>
>
> my Makefile:
> #
> cg:     cg.o
>          ld -s -o cg cg.o -ldl
> cg.o:   cg.asm
>          nasm -f elf cg.asm
>
> I added '-ldl' because I'm going to use dlopen and other functions for
> shared lib loading. Compilation is Ok but ... system says 'this is non
> executable file' when I try to run it. Why??? (If I delete '-ldl'
> everything is Ok).
> Do I need to make my myself loader for '.so', indeed?
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
