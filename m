From: "Bruno N. F. Pacheco" <brunonfp@fastmail.fm>
Subject: Re: newbie question on gnu 'as'
Date: Tue, 30 Jul 2002 14:24:25 -0300 (BRT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020730142143.N286-100000@hexa.org>
References: <20020730115914.24241.qmail@web14507.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020730115914.24241.qmail@web14507.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Just read the comments..

/*
 * letter.S
 *
 * % as letter.S -o letter.o
 * % ld -s letter.o
 * % a.out
 *
 * by live <brunonfp@fastmail.fm>
 */

    .data
buffer:
    .byte 65

    .text
    .globl _start
    .align 4

_start:
    movl $4, %eax       # write() syscall
    movl $1, %ebx       # stdout
    leal buffer, %ecx   # buff pointer
    movl $1, %edx       # number of characters to write
    int $0x80           # call kernel
        /* Ignoring erros */

.loop:
    jmp .loop


	-- Bruno N. F. Pacheco

On Tue, 30 Jul 2002, [iso-8859-1] Anticipating a Reply wrote:

> Hi Everybody,
>
>         I have got a small piece of Assembly code ,
> which writes a character "A" on the screen .
>
>   The below program is compiled and written
> to the boot sector of a floppy. It compiles
> using the command :
>
> 	as86 boot.s -o boot.o
> 	ld86 -d boot.o -o boot
>
>    I want to rewrite it in AT&T syntax and
> want to use GNU "as" assembler to compile it .
> I tried doing it ,but with no success .
>
>   Can anybody please help me rewite the
> below code in AT&T syntax and tell me how
> to compile & link it ?
>
>    Thanks in Advance .
>
> With Best Regards
>
>
> THE CODE :
> ------------
>
>
> entry start
>
> start:
>        mov ax,#0xb800 ; Video Memory address is 0xb800
>
>        mov es,ax      ; Video Memory is made as Extra
> Segment
>        seg es         ; Makes next instruction execute
> wrt Extra Segment
>        mov [0],#0x41  ; ASCII value of the Character
> to be displayed
>                       ;  in 1-row & 1-column
>        seg es         ; Makes next instruction execute
> wrt Extra Segment
>        mov [1],#0x1f  ; Attribute of the Character to
> be displayed
>                       ;  in 1-row & 1-column
>                       ; 0x1f represents White
> Character on a Blue Background
> loop1:
>        jmp loop1
>
>
> ________________________________________________________________________
> Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
>        visit http://in.autos.yahoo.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

