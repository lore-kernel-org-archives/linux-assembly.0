From: "J." <mailing-lists@xs4all.nl>
Subject: Unable to access memory address.
Date: Fri, 25 Mar 2005 00:08:51 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0503242354490.1652-100000@hestia>
Reply-To: linux-assembly@vger.kernel.org
Mime-Version: 1.0
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Thursday, March 24 23:54:49

Hello,

I am totally new to asm and have a question. I trying the following
nasm program from the document http://www.leto.net/writing/nasm.txt . 

section .text
 global main

main:
 pop     ebx
 dec     ebx
 pop     ebp
 pop     ebp

When I try to execute it this is what happends.
~: ./program 12 7
Illegal instruction

Some searches on the Internet the only clou's turned up are type of `howto
bufferoverflow' ... Hmmzz.. :( So I decided to use GDB. 

The debugger says:
Cannot access memory at address 0x6d6f682f

What am I doing wrong and how do I make sure that I use the right memory
addresses ?

Thanks a lot..

J.

