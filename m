From: "J." <mailing-lists@xs4all.nl>
Subject: Re: Unable to access memory address.
Date: Fri, 25 Mar 2005 12:46:08 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0503251235230.681-100000@hestia>
References: <032520050157.21649.42436FF80006F972000054912205886014C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Reply-To: linux-assembly@vger.kernel.org
Mime-Version: 1.0
In-Reply-To: <032520050157.21649.42436FF80006F972000054912205886014C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Fri, 25 Mar 2005 TheReader06@comcast.net wrote:
> Also might want an exit call on the end..  otherwise it'll keep on executing 
> whatever is after the code you load in to memory..  keep reading down a bit in 
> that article, it mentions this and shows you how to do an exit syscall in asm..
> 
> 	; for the program to properly exit instead of segfaulting right here
> 	; ( it doesn't seem to like to fall off the end of a program ), call 
> 	; a sys_exit
> 
> 	mov	eax,1
> 	mov	ebx,0
> 	int	80h
> 
> Joshua Roys

I changed `_start' to `main' because during the linking fase it keeps
complaining about define's.

~: cat prog.asm
section	.text		; declaring our .text segment
        global	_start	; telling where program execution should start

_start: 		; this is where code starts getting exec'ed
        pop	ebx	; get first thing off of stack and put into ebx
        dec	ebx	; decrement the value of ebx by one
        pop	ebp	; get next 2 things off stack and put into ebx
        pop	ebp

        mov     eax,1    ; exit
        mov     ebx,0
        int     80h

~: nasm -f elf prog.asm
~: gcc prog.o -o prog
prog.o: In function `_start':
prog.o(.text+0x0): multiple definition of `_start'
/usr/lib/crt1.o(.text+0x0): first defined here 
/usr/lib/crt1.o: In function `_start': 
/usr/lib/crt1.o(.text+0x18): undefined reference to `main' 
collect2: ld returned 1 exit status

I'm a bit lost here I guess.. ;-)

J.

