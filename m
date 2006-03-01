From: Marcin =?utf-8?q?Ko=C5=9Bcielnicki?= <markosc@interia.pl>
Subject: Re: redirection
Date: Wed, 1 Mar 2006 15:48:18 +0100
Message-ID: <200603011548.18539.markosc@interia.pl>
References: <030120061337.10844.4405A3A4000D752C00002A5C22073000339B9D9A0D0409@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <030120061337.10844.4405A3A4000D752C00002A5C22073000339B9D9A0D0409@comcast.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-assembly@vger.kernel.org

> I have the following program:
>
> 	SECTION .data		; data section
> msg1:	db "Hello World -- 1",10,0 ; the string to print, 10=3Dcr
> msg:	db "Hello World",10	; the string to print, 10=3Dcr
> len:	equ $-msg		; "$" means "here"
> 				; len is a value, not an address
>
> 	SECTION .text		; code section
>         global main		; make label available to linker
>         extern printf
> main:				; standard  gcc  entry point
>
> 	mov	edx,len		; arg3, length of string to print
> 	mov	ecx,msg		; arg2, pointer to string
> 	mov	ebx,1		; arg1, where to write, screen
> 	mov	eax,4		; write command to int 80 hex
> 	int	0x80		; interrupt 80 hex, call kernel
>
>         push    msg1
>         call    printf
>         add	esp, 4
>
>         mov	ebx,0		; exit code, 0=3Dnormal
> 	mov	eax,1		; exit command to kernel
> 	int	0x80		; interrupt 80 hex, call kernel
>
>
> When I assembled/linked it, I used:
>
> nasm -f elf burtp1.asm
> gcc burtp1.o
>
> when i ran it, I got two lines of output.:
>
> [burt@linux2 ~]$ ./a.out
> Hello World
> Hello World -- 1
>
>
> When I redirected it, I got:
>
> [burt@linux2 ~]$ ./a.out > foo
> [burt@linux2 ~]$ cat foo
> Hello World
>
> Why was the output from using printf not redirected?

It's because printf buffers output when it goes to file.

In c program, it cannot do any wrong, since library exit() function flu=
shes=20
all buffers before actually exitting.

However, you exit with direct kernel syscall. It's REALLY bad idea, as =
it=20
terminates the process immediately, not allowing anything to run before=
 it=20
happens -- including the flush-buffers-on-exit thingie.

If you're not using libc, direct syscall is alright. However, if you us=
e libc,=20
you have to use the whole framework, or something's bound to break=20
eventually. Will people never learn?

To make it do the Right Thing=E2=84=A2, change this:

>         mov	ebx,0		; exit code, 0=3Dnormal
> 	mov	eax,1		; exit command to kernel
> 	int	0x80		; interrupt 80 hex, call kernel

to this:

push dword 0 ;exit code
call exit

Should work now.

----------------------------------------------------------------------
Kliknij po wiecej! >>> http://link.interia.pl/f18ed

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
