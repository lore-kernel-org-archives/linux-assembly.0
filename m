From: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Subject: Newbie Question
Date: Thu, 24 Oct 2002 17:42:35 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200210241742.35488.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

Hello, 

I have recently started learning x86 assembly and have been programming it in 
Linux with NASM (Netwide Assembler). 

I am trying to write a program that takes a string as input, reverses it and 
calculated its length.  I'm using the stack to do so.  

Here's my problem..  NASM only lets me move the string into a 32-bit register.

e.g.  		mov	EBX, the_string		; move memory address of the_string into EBX

At this point I need to push the register on the stack.  I know I can do:

push EBX
call string_length_procedure

BUT I was wondering how it is possible to push BX instead.  Does BX also hold 
the string in this case, considering the size of the string it isn't that 
big?  If not, is there a way to put the contents of EBX (the string) into BX? 
For the time being I would like to just deal with 16-bit registers because it 
is easier to follow along with the book I am using.

P.s. I am using an already coded procedure that gets the string for me and 
puts it into 'string' in this case.
