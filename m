From: A D <a_d_249@hotmail.com>
Subject: Problem:Embed C code in GAS language file
Date: Thu, 13 Sep 2007 08:09:33 -0400
Message-ID: <BAY133-W8664E2A629FE17C826D19F5C30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org


I saw Gnu C code embedded in gnu assembly file. I've a simple code like below:

.section .data
int i = 1;

.section .text
.globl main
main:
   nop
   movl $2, i
   movl $1, %eax
   movl $0, %ebx
   int  $0x80


But when i try to compile with gcc -c i get the message:

test1.s: Assembler messages:
test1.s:2: Error: invalid character '=' in operand 1

Am i missing something obvious? Thanks.
_________________________________________________________________
Explore the seven wonders of the world
http://search.msn.com/results.aspx?q=7+wonders+world&mkt=en-US&form=QBRE