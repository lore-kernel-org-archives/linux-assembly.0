From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: Prblem with AT&T
Date: Thu, 8 Aug 2002 10:28:09 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020808092809.84870.qmail@web14502.mail.yahoo.com>
References: <3D5225AD.3000302@eprocess.fr>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D5225AD.3000302@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fmarmond@eprocess.fr, linux-assembly@vger.kernel.org

Hi Frederic !

  I'am fine but got up late this morning , 
because of the beautiful dream .

  The code you sent was for 32 bit mode 
and I have passed the address in the same 
manner to "bp" . 

   I think there is some other method to 
pass the address to the " bp " for 16 
bit mode which is OS independent  .

   Hope some AT&T 16 bit specialist 
will rescue me out of this problem .

   Waiting for the AT&T Robinhood to 
help me out .

Harmony !


  
 --- Frederic Marmond <fmarmond@eprocess.fr> wrote: >
hi!
> 
> how are you today?
> ;-)
> 
> well, with your error code, I think that what i said
> yesterday was right:
> your syntax at
> 
> mymsg: 
> 	.byte 13,10 
> 	.ascii "Handling BIOS interrupts"
> 
> [...]
> 
> 	movw $mymsg,%bp 
> 
> But as I don't know about At&t syntax, here is an
> example of good syntax
> 
> $ cat write.s
> .data
> hw:
> 	.string "hello world\n"
> .text
> .globl main
> main:
> 	movl	$SYS_write,%eax
> 	movl	$1,%ebx
> 	movl	$hw,%ecx
> 	movl	$12,%edx
> 	int	$0x80
> 	movl	$SYS_exit,%eax
> 	xorl	%ebx,%ebx
> 	int	$0x80
> 	ret
> 
> 
> For At&t / intel syntax, please refer to:
> www.linuxassembly.org
> or more precisely:
> http://www.linuxassembly.org/linasm.html
> 
> 
> happy new year!
> 
> ;-)
> Fred
> 
> 
> Anticipating a Reply wrote:
> 
> >Hi All !
> >
> >  I have got the below 16 bit code which is 
> >in Intel Syntax . 
> >
> >----------- INTEL SYNTAX CODE
> ------------------------
> >
> >entry start 
> >
> >start: 
> >	mov ah,#0x03 ; read cursor position. 
> >	xor bh,bh 
> >	int 0x10 
> >	mov cx,#26 ; length of our beautiful string. 
> >	mov bx,#0x0007 ; page 0, attribute 7 (normal) 
> >	mov bp,#mymsg 
> >	mov ax,#0x1301 ; write string, move cursor 
> >	int 0x10 
> >	
> >	loop1: jmp loop1 
> >	
> >mymsg: 
> >	.byte 13,10 
> >	.ascii "Handling BIOS interrupts"
> >
> >
> >---------------------------------------------
> >
> >I am trying to write to the above code in 
> >AT&T format as given below . 
> >
> > But I get the error in "ld" . 
> >
> >sect2.o: In function `_start':
> >sect2.o(.text+0xd): relocation truncated to fit:
> >R_386_16 data
> >
> >  
> >-------------AT&T SYNTAX --------------------
> >
> >
> >.code16
> >
> >.align 4
> >
> >.data
> >
> >mymsg: 
> >	.byte 13,10 
> >	.ascii "Handling BIOS interrupts"
> >
> >.text
> >
> >.globl _start 
> >
> >_start: 
> >	movb $0x03,%ah   # read cursor position. 
> >	xor  %bh,%bh
> > 
> >	int  $0x10 
> >
> >	movw $24,%cx     # length of our beautiful string.
> 
> >	movw $0x0007,%bx # page 0, attribute 7 (normal) 
> >	movw $mymsg,%bp 
> >	movw $0x1301,%ax # write string, move cursor 
> >
> >	int  $0x10 
> >	
> >loop1: 
> >        jmp loop1 
> >	
> >----------------------------------------------
> >
> >   Please help me how to resolve this .
> >
> >Regards 
> >
>
>________________________________________________________________________
> >Want to sell your car? advertise on Yahoo Autos
> Classifieds. It's Free!!
> >       visit http://in.autos.yahoo.com
> >-
> >To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> >
> >  
> >
> 
> 
>  

________________________________________________________________________
Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
       visit http://in.autos.yahoo.com
