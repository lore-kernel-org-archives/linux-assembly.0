From: kiran kumar <kathireddy01@yahoo.com>
Subject: c code and asm code linking
Date: Wed, 27 Nov 2002 23:05:56 -0800 (PST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20021128070556.40495.qmail@web20101.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Sir,
 i am trying to call a asm routine in C model, for
testing i have taken a small program. 
 
 my main program is 
====================================
#include<stdio.h>

extern int BSWAP ( unsigned int a);

void main()
  {

    unsigned int a ;
    unsigned int b;

     a=255;

    b= BSWAP(a);

    printf(" a = %d b = %d",a,b);
  return;
  }
=========================================

my bswap.asm code is 
=========================================
bits 32

section .data
align 16

section .text


;===========================================================================
;
; uint32_t bswap(uint32_t a);
;
;===========================================================================

align 64

global _BSWAP

_BSWAP
                mov     eax, [esp+4]
                bswap eax
                ret

==================================

i have complied the asm code using 
$nasm -f elf bswap.asm 
 i got bswap.o
then i compiled main code using
gcc -c main.c

then i used ld to link

$ ld -o test main.o bswap.o

it is giving the error
ld: warning: cannot find entry symbol _start;
defaulting to 08048080
main.o: In function `main':
main.o(.text+0x14): undefined reference to `BSWAP'
main.o(.text+0x2d): undefined reference to `printf'

sir, help me in resolving this linking problem.

 thanking you sir
kiran kumar k

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
