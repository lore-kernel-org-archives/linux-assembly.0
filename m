From: Guido Reina <guidore@yahoo.com>
Subject: Write sector (int 13h) under Linux?
Date: Wed, 29 Jan 2003 00:57:13 -0800 (PST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030129085713.57893.qmail@web11302.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi there, 

I am trying to delete a sector of my linux box from the kernel, for this 
I have included a small piece of code as inline assembly. With the 13h 
interruption I write the sector, I don't know why but it is not working. 
Do you know if the linux kernel avoids such accesses to the hard disk? 

My code is the following: 

asm ( " 
movb $0x03, %si; 
start: 
movb $0x03, %ah; 
movb $0x05, %al; 
movb $0x00, %ch; 
movb $0x02, %cl; 
movb $0x00, %dh; 
movb $0x80, %dl; 
int $0x13 
jnc success; 
movb $0x00, %ah; 
int $0x13 
dec si; 
jnz start; 
success: 
");

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
