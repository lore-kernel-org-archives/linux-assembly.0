From: lx <lx@lxhp.in-berlin.de>
Subject: Re: Assembly - newbie doubts
Date: Wed, 4 Sep 2002 13:32:20 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020904133220.2837cdeb.lx@lxhp.in-berlin.de>
References: <20020904055645.41287.qmail@web14506.mail.yahoo.com>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020904055645.41287.qmail@web14506.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Wed, 4 Sep 2002 06:56:45 +0100 (BST)
Anticipating a Reply <ruxyz@yahoo.com> wrote:

> /* C program - as.c */
> void funk(int f)
> {
>    printf("Hello");
> }
> main()
> {
>    int a ;
>    a=10 ;
>    funk(a); 
>    printf("Bye");
> }
> --------------------------------------------
> Assembly file contents -
> 	.file	"as.c"
> 	.version	"01.01"
> gcc2_compiled.:
> 		.section	.rodata
> .LC0:	.string	"Hello"
> .text	.align 4
> .globl funk
> 	.type	 funk,@function
> funk:	pushl	%ebp
> 	movl	%esp, %ebp
> 	subl	$8, %esp   ( **>'int' has 4 bytes size why 8 bytes allocated)
> 	subl	$12, %esp  ( **> why 12 bytes allocated on stack )

this is not assembly but, compiled "C", so why not - if it works?
ask your compiler, and 'printf'...

> 	pushl	$.LC0
> 	call	printf
> 	addl	$16, %esp
> 	leave
> 	ret
> .Lfe1:.size	 funk,.Lfe1-funk
> 	.section	.rodata
> .LC1:	.string	"Bye"
> .text	.align 4
> .globl main
> 	.type	 main,@function
> main:	pushl	%ebp
>>> 	movl	%esp, %ebp
>>> 	subl	$8, %esp   ( **>'int' has 4 bytes size why 8 bytes allocated)
>>> 	movl	$10, -4(%ebp) ( **> which order do the bytes go on stack)
>>> 	subl	$12, %esp  ( **> why 12 bytes allocated on stack )
> 	pushl	-4(%ebp)
> 	call	funk

GCC 'strategy', 'optimization' and, 'stack dancing', because otherwise the 
program might become too fastly executing. and, what stores < pushl -4(ebp) >...
'>>>' lines just "C"-ish nonsense. try -O2 or -O3 switch to (recent) GCC.


> 	addl	$16, %esp
> 	subl	$12, %esp  ( **> why 12 bytes allocated on stack )
				 ^^^^^^^
-?-	16-12 = 12 	-!-

> 	.ident	"GCC: (GNU) 2.96 20000731 (Red Hat Linux 7.1 2.96-81)"
		 ^^^^^^^^^ + ^^^

docs in gcc sources might have the answers, probably even <info gcc>.

hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
