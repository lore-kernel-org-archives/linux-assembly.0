From: Ewald Wasscher <ewald.wasscher@pobox.com>
Subject: Re: Problem building httpd
Date: Sat, 17 Aug 2002 19:59:41 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D5E8F0D.6030904@pobox.com>
References: <3D5E7E4C.1080303@pobox.com> <B0309172403@yoda.dccnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-assembly <linux-assembly@vger.kernel.org>

Robin Miyagi wrote:

 >On Saturday 17 August 2002 09:48, Ewald Wasscher wrote:
 >
 >
 >>Hello all,
 >>
 >>I just anxiosly tried to build httpd from the new 0.17 release with cgi
 >>support enabled. Unfortunately it fails:
 >>
 >>bash-2.05a$ make httpd
 >>nasm -w+orphan-labels -w+macro-params -i../inc/ -f bin -D__LINUX__
 >>-D__KERNEL__=24 -D__SYSCALL__=__S_KERNEL__ -D__OPTIMIZE__=__O_SIZE__
 >>-D__ELF__ -D__ELF_MACROS__ httpd.asm
 >>httpd.asm:282: short jump is out of range
 >>make: *** [httpd] Error 1
 >>
 >>As I know next to nothing about assembler I wonder how one should fix
 >>that (replace jb with jmp?)
 >>
 >>Ewald Wasscher
 >>
 >>-
 >>To unsubscribe from this list: send the line "unsubscribe linux-assembly"
 >>in the body of a message to majordomo@vger.kernel.org
 >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
 >>
 >>
 >
 >For which assembler was this source code written for.
 >
For nasm 0.98.

 >
 >The problem here is that the jump is more than 128 before, or 127 
after the
 >current instruction pointer (the jump displacement is represented by a 
signed
 >one byte integer -- -128 to 127).  This should be replaced by a long 
jump,
 >which uses the machine integer/pointer size (4 bytes) to store the
 >displacement.
 >
Hah, I guessed so (I do remeber a little: I once bought a book on
assembler in the days that a 80286@12mhz was a very fast pc)

 > Please send me a copy of the assembler source code.
 >
 >
 >

You got it in private mail, it's httpd.asm from the asmutils 0.17 release.

Ewald


