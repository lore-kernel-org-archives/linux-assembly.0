From: Kirill Ratkine <rabbitos@nm.ru>
Subject: ld trouble
Date: Wed, 29 Jan 2003 13:08:09 +0300
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3E37A809.7080407@nm.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org


Hello.

Could somebody explain me where the problem is?

my nasm file:
; ===
section .text
     global _start

msg     db      'Dyna Loading!',0xa
len     equ     $ - msg

_start:
         mov     edx,len
         mov     ecx,msg
         mov     ebx,1
         mov     eax,4
         int     0x80
         mov     eax,1
         int     0x80


my Makefile:
#
cg:     cg.o
         ld -s -o cg cg.o -ldl
cg.o:   cg.asm
         nasm -f elf cg.asm

I added '-ldl' because I'm going to use dlopen and other functions for
shared lib loading. Compilation is Ok but ... system says 'this is non 
executable file' when I try to run it. Why??? (If I delete '-ldl' 
everything is Ok).
Do I need to make my myself loader for '.so', indeed?

