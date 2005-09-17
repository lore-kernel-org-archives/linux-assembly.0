From: Claudio Fontana <sick_soul@yahoo.it>
Subject: Re: Someone should correct me when I'm wrong.
Date: Fri, 16 Sep 2005 20:53:40 -0700 (PDT)
Message-ID: <20050917035340.95689.qmail@web26005.mail.ukl.yahoo.com>
References: <op.sw75nudbnro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.sw75nudbnro9m0@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Cooper <peajay@funrestraints.com>
Cc: linux-assembly <linux-assembly@vger.kernel.org>

Hello,

--- Richard Cooper <peajay@funrestraints.com> wrote:

> 
> > Your program is loaded a little bit above address
> 0x80000000,
> 
> I can't believe no one caught that...

no one cares to count zeroes I believe.

> Linux programs load a little bit above 0x08000000, 
> not 0x80000000.
> 
> The exact address is 0x08048080.

This address is not set in stone.
Try this one (the asm file is just a random example):

$ cat prova2.asm

BITS 32
GLOBAL _start
SECTION .text

_start:
        mov     eax, 4
        mov     ebx, 1
        mov     ecx, erase_screen
        mov     edx, 4

        int     0x80

        mov     eax, 4
        mov     ecx, string
        mov     edx, 7
        int     0x80

        mov     eax, 1
        xor     ebx, ebx
        int     0x80

SECTION .data

erase_screen:   db 1bh, '[2J'
string:         db 'Hello!', 0ah

SECTION .bss

$ nasm -f elf -o prova2.o prova2.asm
$ ld --section-start .text=0x1000 --section-start
.data=0x10000 prova2.o

$ objdump -h a.out

a.out:     file format elf32-i386

Sections:
Idx Name          Size      VMA       LMA       File
off  Algn
  0 .text         00000030  00001000  00001000 
00001000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY,
CODE
  1 .data         0000000b  00010000  00010000 
00002000  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .got.plt      00000000  00002000  00002000 
0000200b  2**0
                  CONTENTS
  3 .bss          00000000  0001000c  0001000c 
0000200b  2**2
                  ALLOC
  4 .comment      0000001f  00000000  00000000 
0000200b  2**0
                  CONTENTS, READONLY

Bye,

Claudio



		
__________________________________ 
Yahoo! Mail - PC Magazine Editors' Choice 2005 
http://mail.yahoo.com
