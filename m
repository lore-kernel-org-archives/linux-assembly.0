From: dh <dh@icbook.com.ua>
Subject: Re:variables & How interrupts work
Date: Fri, 23 Aug 2002 14:52:19 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D663003.7800E652@icbook.com.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Assembly Linux <linux-assembly@vger.kernel.org>

Hi all!

> Hi all, 

 and Hi RCS!


>
>  I need some help to understand how interrupts work on Intel. 

Intel can help you to understand how interrupts work on x86 :)
http://developer.intel.com/design/PentiumIII/manuals/

>  For example, how do I print a character in the screen? 
> Wich register must contain the character for that? Is "int 10h" the correct 
> interrupt for that? 

Yes, int 10 is correct interrupt for that. 
For more information, please, input in google.com string - helppc,
download this program and just read.


> Hi all, 
>
>  Can anyone explain me how global and local variables from C are treated in 
>assembler? 

Many people know how it make, but explain this for you... 
It's a very long story.

>  Is that write that local variables are storage in the stack? 
Not, it isn't write :)

Good buy all!

Khmara Dmitro
engineer, IC Book Lab
dh@icbook.com.ua
www.icbook.com.ua
