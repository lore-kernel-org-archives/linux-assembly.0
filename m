From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: newbie question on gnu 'as'
Date: Tue, 30 Jul 2002 12:59:14 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020730115914.24241.qmail@web14507.mail.yahoo.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Assembly Linux <linux-assembly@vger.kernel.org>

Hi Everybody,

        I have got a small piece of Assembly code ,
which writes a character "A" on the screen .

  The below program is compiled and written 
to the boot sector of a floppy. It compiles
using the command :

	as86 boot.s -o boot.o
	ld86 -d boot.o -o boot 

   I want to rewrite it in AT&T syntax and
want to use GNU "as" assembler to compile it .
I tried doing it ,but with no success .

  Can anybody please help me rewite the
below code in AT&T syntax and tell me how
to compile & link it ?

   Thanks in Advance .

With Best Regards


THE CODE :
------------


entry start 

start: 
       mov ax,#0xb800 ; Video Memory address is 0xb800
  
       mov es,ax      ; Video Memory is made as Extra
Segment
       seg es         ; Makes next instruction execute
wrt Extra Segment 
       mov [0],#0x41  ; ASCII value of the Character
to be displayed 
                      ;  in 1-row & 1-column
       seg es         ; Makes next instruction execute
wrt Extra Segment 
       mov [1],#0x1f  ; Attribute of the Character to
be displayed
                      ;  in 1-row & 1-column
                      ; 0x1f represents White
Character on a Blue Background
loop1: 
       jmp loop1


________________________________________________________________________
Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
       visit http://in.autos.yahoo.com
