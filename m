From: "ssams" <ssams@telkom.net>
Subject: problem with printchar
Date: Wed, 24 Apr 2002 14:18:57 +0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <web-5620564@m1.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org.

i have this code
.globl mulai
mulai:
   movl $4,%eax
   movl $1,%ebx
   movl $'a',%ecx
   movl $1,%edx
   int   $0x80
   xorl  %eax,%eax
   movl  $1,%eax
   xorl  %ebx,%ebx
   int   $0x80
then i compile with
as program1.s -o program1.o
ld program1.o -o program1

by this code i want print one char but there is no output.
can anybody help me why..?

 
