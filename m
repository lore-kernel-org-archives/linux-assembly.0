From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Assembly - newbie doubts
Date: Wed, 4 Sep 2002 06:56:45 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020904055645.41287.qmail@web14506.mail.yahoo.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Assembly Linux <linux-assembly@vger.kernel.org>

Hi All !

  The following C program 
was compiled using 

 cc -S as.c

to get the assembly instructions .

  I have the doubts marked in the 
assembly generated . 

  Please help me out with 
this .Thanks in advance .

Regards!

/* C program - as.c */

void funk(int f)
{
   printf("Hello");
}

main()
{
   int a ;
   a=10 ;
   funk(a); 
   printf("Bye");
}

--------------------------------------------
Assembly file contents -

  
	.file	"as.c"
	.version	"01.01"
gcc2_compiled.:
		.section	.rodata
.LC0:
	.string	"Hello"
.text
	.align 4
.globl funk
	.type	 funk,@function
funk:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp   ( **>'int' has 4 bytes size why 8
bytes allocated)
	subl	$12, %esp  ( **> why 12 bytes allocated on stack
)
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	leave
	ret
.Lfe1:
	.size	 funk,.Lfe1-funk
		.section	.rodata
.LC1:
	.string	"Bye"
.text
	.align 4
.globl main
	.type	 main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp   ( **>'int' has 4 bytes size why 8
bytes allocated)
	movl	$10, -4(%ebp) ( **> which order do the bytes go
on stack)
	subl	$12, %esp  ( **> why 12 bytes allocated on stack
)
	pushl	-4(%ebp)
	call	funk
	addl	$16, %esp
	subl	$12, %esp  ( **> why 12 bytes allocated on stack
)
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	leave
	ret
.Lfe2:
	.size	 main,.Lfe2-main
	.ident	"GCC: (GNU) 2.96 20000731 (Red Hat Linux 7.1
2.96-81)"

-----------------------------------------

Any documents on the related issues 
will be of great help .

Thanks again

________________________________________________________________________
Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
       visit http://in.autos.yahoo.com
