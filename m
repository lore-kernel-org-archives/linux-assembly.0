From: zad <zacido@tiscali.it>
Subject: simple problem under linux
Date: Wed, 12 Nov 2003 18:37:42 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB27DF6.9060003@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

section .text
global _start

	_start:
		mov ah ,0ah
		mov al , 'A'
		int 10h

I tried to run this simple asm code in linux but I always got a 
Segmentation fault
I compiled the asm file with these commands
$ nasm -f elf a.asm -o a.o
$ ld a.o
$ ./a.out
Segmentation fault

I was working into a shell in kde.

can someone help me thanks

