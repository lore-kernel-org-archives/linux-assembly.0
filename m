From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Prblem with AT&T
Date: Thu, 8 Aug 2002 08:31:33 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020808073133.53517.qmail@web14505.mail.yahoo.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Assembly Linux <linux-assembly@vger.kernel.org>

Hi All !

  I have got the below 16 bit code which is 
in Intel Syntax . 

----------- INTEL SYNTAX CODE ------------------------

entry start 

start: 
	mov ah,#0x03 ; read cursor position. 
	xor bh,bh 
	int 0x10 
	mov cx,#26 ; length of our beautiful string. 
	mov bx,#0x0007 ; page 0, attribute 7 (normal) 
	mov bp,#mymsg 
	mov ax,#0x1301 ; write string, move cursor 
	int 0x10 
	
	loop1: jmp loop1 
	
mymsg: 
	.byte 13,10 
	.ascii "Handling BIOS interrupts"


---------------------------------------------

I am trying to write to the above code in 
AT&T format as given below . 

 But I get the error in "ld" . 

sect2.o: In function `_start':
sect2.o(.text+0xd): relocation truncated to fit:
R_386_16 data

  
-------------AT&T SYNTAX --------------------


.code16

.align 4

.data

mymsg: 
	.byte 13,10 
	.ascii "Handling BIOS interrupts"

.text

.globl _start 

_start: 
	movb $0x03,%ah   # read cursor position. 
	xor  %bh,%bh
 
	int  $0x10 

	movw $24,%cx     # length of our beautiful string. 
	movw $0x0007,%bx # page 0, attribute 7 (normal) 
	movw $mymsg,%bp 
	movw $0x1301,%ax # write string, move cursor 

	int  $0x10 
	
loop1: 
        jmp loop1 
	
----------------------------------------------

   Please help me how to resolve this .

Regards 

________________________________________________________________________
Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
       visit http://in.autos.yahoo.com
