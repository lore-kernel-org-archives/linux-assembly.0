From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Please give me an example.. - getuid() in nasm
Date: Sat, 24 Jan 2004 05:32:08 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16402.29656.426159.617362@eidolon.muppetlabs.com>
References: <S266928AbUAXMIm/20040124120842Z+36743@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <S266928AbUAXMIm/20040124120842Z+36743@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: RaZoR <RaZoR@darksorcerers.org>
Cc: linux-assembly@vger.kernel.org

> Please give me an example how to use getuid() (syscall 24) in nasm ,
> but not copied from asmutils. I want clear example , because I've
> got big problems with this one :)

    Okay ...

	mov	eax, 24
	int	0x80
	; uid now in eax

    Is that clear enough?

    Here's a program that verifies that syscall 24 returns the same
    thing as the getuid() library function:

; uid.asm
BITS 32
GLOBAL main
EXTERN getuid
EXTERN printf
SECTION .text
main:
	call	getuid		; first call the one in libc
	push	eax		; push the result
	mov	eax, 24		; now do the direct syscall
	int	0x80
	push	eax		; push the result
	push	dword fmt	; print the return values on stdout
	call	printf		; so that the user can compare them
	add	esp, byte 12
	xor	eax, eax	; return
	ret
fmt:	db	'syscall 24 => %d', 10, 'getuid()   => %d', 10, 0

    Build this program like so:

nasm -f elf foo.asm && gcc foo.o

    And run it. You should see something like:

syscall 24 => 532
getuid()   => 532

-- 
b
