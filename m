From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: chdir command
Date: Fri, 3 May 2002 14:31:03 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15571.407.735989.579814@shub.muppetlabs.com>
References: <3CD2EAF6.5A27E998@exeter.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3CD2EAF6.5A27E998@exeter.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Allan Wooley <awooley@exeter.edu>
Cc: Linux Assembly <linux-assembly@vger.kernel.org>

> I can not get system call #12 to work as advertised.  In Read Hat Linux
> 7.2 under bash using nasm with elf I write:
> 
> section .text
>     global _start
> 
> path    db '/root',0
> 
> _start:
> 
>     mov ebx, path
>     mov eax,12
>     int 80h
> 
>     mov eax, 1
>     int 80h        ;; int 0x80
> 
> Although I have gotten system calls 1, 3-6 & 11 to work fine in assembly
> programs, I can not get the change-working-directory call to work.

The chdir call is working just fine. What you're forgetting is that
every process has its own current directory. That's why the cd command
has to be a shell builtin -- a process can't change its parent's
current directory, only its own.
________________

section .bss
cwdbuf:
    resb 1024

%macro printcwd 0			;; call getcwd, then write
		pusha
		mov	ebx, cwdbuf
		mov	ecx, 1024
		mov	eax, 183
		int	0x80
		mov	byte [ebx + eax], 10
		inc	eax
		mov	edx, eax
		mov	ecx, ebx
		mov	ebx, 1
		mov	eax, 4
		int	0x80
		popa
%endmacro


section .text
    global _start

path    db '/root',0

_start:

	printcwd

    mov ebx, path
    mov eax, 12
    int 80h

	printcwd

    xor ebx, ebx
    mov eax, 1
    int 80h        ;; int 0x80
________________

b
