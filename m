From: glburt@comcast.net
Subject: redirection
Date: Wed, 01 Mar 2006 13:37:40 +0000
Message-ID: <030120061337.10844.4405A3A4000D752C00002A5C22073000339B9D9A0D0409@comcast.net>
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I have the following program:

	SECTION .data		; data section
msg1:	db "Hello World -- 1",10,0 ; the string to print, 10=cr
msg:	db "Hello World",10	; the string to print, 10=cr
len:	equ $-msg		; "$" means "here"
				; len is a value, not an address

	SECTION .text		; code section
        global main		; make label available to linker 
        extern printf
main:				; standard  gcc  entry point
	
	mov	edx,len		; arg3, length of string to print
	mov	ecx,msg		; arg2, pointer to string
	mov	ebx,1		; arg1, where to write, screen
	mov	eax,4		; write command to int 80 hex
	int	0x80		; interrupt 80 hex, call kernel
	
        push    msg1
        call    printf
        add	esp, 4

        mov	ebx,0		; exit code, 0=normal
	mov	eax,1		; exit command to kernel
	int	0x80		; interrupt 80 hex, call kernel


When I assembled/linked it, I used:

nasm -f elf burtp1.asm
gcc burtp1.o

when i ran it, I got two lines of output.:

[burt@linux2 ~]$ ./a.out
Hello World
Hello World -- 1


When I redirected it, I got:

[burt@linux2 ~]$ ./a.out > foo
[burt@linux2 ~]$ cat foo
Hello World

Why was the output from using printf not redirected?
