From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: Newbie doubts about stack !
Date: Mon, 16 Sep 2002 06:17:10 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020916051710.36306.qmail@web14506.mail.yahoo.com>
References: <20020915131008.2309f48b.clf@lxhp.in-berlin.de>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020915131008.2309f48b.clf@lxhp.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: clf@lxhp.in-berlin.de, Assembly Linux <linux-assembly@vger.kernel.org>

Hello !

  The link sent by you is dead . 
Can you please send me the document ,
if you have it .

  Thank you .

Harmony !

 --- hp <clf@lxhp.in-berlin.de> wrote: > On Sun, 15
Sep 2002 11:47:51 +0100 (BST)
> Anticipating a Reply <ruxyz@yahoo.com> wrote:
> 
> you'd probably better get familiar with your "C"
> compiler and 
> try understandig it's purpose. document which
> compares "C"-ish 
> data structures to assembly available via
> 
> 	http://www.lxhp.in-berlin.de/linux-asm.ps.gz
> 
> > 
> > Hello All !
> > 
> >    I wrote the following C program and
> > obtained its assembly version , using command :
> > 
> >   cc -S temp.c
> > 
> > < on an x-86 Linux machine >
> > 
> > /* File Name - temp.c */
> > 
> > void function(int a, int b, int c) {
> >    char buffer[SIZE];  ------------------->
> SIZE=51 
> > }
> > 
> > void main() {
> >   function(1,2,3);
> > }
> > 
> > 
> > The Assembly File is as below :-
> > 
> > 
> > .file	"temp.c"
> > 	.version	"01.01"
> > gcc2_compiled.:
> > .text
> > 	.align 4
> > .globl function
> > 	.type	 function,@function
> > function:
> > 	pushl	%ebp
> > 	movl	%esp, %ebp
> > 	subl	$72, %esp -----------> Stack allocation
> > 	leave
> > 	ret
> > .Lfe1:
> > 	.size	 function,.Lfe1-function
> > 	.align 4
> > .globl main
> > 	.type	 main,@function
> > main:
> > 	pushl	%ebp
> > 	movl	%esp, %ebp
> > 	subl	$8, %esp
> > 	subl	$4, %esp
> > 	pushl	$3
> > 	pushl	$2
> > 	pushl	$1
> > 	call	function
> > 	addl	$16, %esp
> > 	leave
> > 	ret
> > .Lfe2:
> > 	.size	 main,.Lfe2-main
> > 	.ident	"GCC: (GNU) 2.96 20000731 (Red Hat Linux
> 7.1
> > 2.96-81)"
> > 
> > 
> > In the function part of the assembly 
> > file , I noticed that the depending on 
> > the "SIZE" of the array , it allocates 
> > memory on stack as shown in the below
> > table .  
> > 
> >  Array Size       Actual stack allocation 
> > 
> >     0  - 4     =    4 
> >     5  - 16    =   24 
> >     17 - 32    =   40 
> >     33 - 48    =   56 
> >     49 - 64    =   72
> > 
> > Can anybody please explain me ,
> > what is the reason behind this ?
> > 
> > Why is it that only the required 
> > amount of stack is not allocated ?
> > 
> > 
> > Harmony !
> > 
> > 
> > 
> >
>
________________________________________________________________________
> > Missed your favourite TV serial last night? Try
> the new, Yahoo! TV.
> >        visit http://in.tv.yahoo.com
> > -
> > To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 
> 
> -- 
> Linux,Assembly,Forth:
> http://www.lxhp.in-berlin.de/index-lx.shtml en/de
>     software patents 
http://petition.eurolinux.org/pr/pr17.html 

________________________________________________________________________
Missed your favourite TV serial last night? Try the new, Yahoo! TV.
       visit http://in.tv.yahoo.com
