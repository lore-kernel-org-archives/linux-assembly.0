From: Joshua Roys <TheReader06@comcast.net>
Subject: [Fwd: Re: Reading user input related question]
Date: Wed, 21 Feb 2007 22:30:06 -0500
Message-ID: <45DD0E3E.5030105@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030308040004010202020302"
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.
--------------030308040004010202020302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Oops.  Forgot to 'reply all.'  Here's a copy for the list.

Charles O'Neil wrote:
> Hi! I am a newbie to gas and I want to know whether it is possible to
> read input
> from keyboard(after the enter key is pressed) using read syscall but
> not using c function? if yes how this can be accomplished?
> 
> Thanks.

Yep.  I use nasm, but here's what I've got.

You're welcome!

Joshua Roys


--------------030308040004010202020302
Content-Type: text/plain;
 name="test1.asm"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="test1.asm"

section .bss
c	resb	1

section .text
	global _start

_start:

read_again:
	mov	eax, 3		; sys_read for read() in eax.
	mov	ebx, 0		; int    fd           in ebx. STDIN_FILENO = 0 in unistd.h
	mov	ecx, c		; void * buf          in ecx
	mov	edx, 1		; size_t count        in edx
	int	80h		; syscall

	test	eax, eax
	jz	eof		; jump if zero (EOF)
	js	error		; jump if signed

	mov	edx, eax	; number of bytes read returned in eax, save in edx (should be 1)
	mov	eax, 4		; sys_write for write() in eax.
	mov	ebx, 1		; int         fd        in ebx. STDOUT_FILENO = 1 in unistd.h
				; const void *buf       in ecx. still set from above.
				; size_t      count     in edx.
	int	80h		; syscall

	jmp	read_again

eof: ; we know eax is 0 (EOF), which is the success exit value..  so just use `error' to exit
error:
	mov	ebx, eax	; errno returned in eax, save in ebx
	mov	eax, 1		; sys_exit for exit()
				; errno in ebx
	int	80h		; syscall


--------------030308040004010202020302--
