From: "ssams" <ssams@telkom.net>
Subject: print_int
Date: Wed, 08 May 2002 14:10:32 +0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <web-10630639@m1.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

i have code for printing integer, but no output i get.
can anybody help me..?

.data
angka:
	.byte 0x32
.text
.globl  mulai
mulai:
	movl $angka,%eax
	movb $10,%dh
ulang:
	xorl %ecx,%ecx
	div  %dh
	pushl %ecx
	inc   %edx
	cmp   $0,%eax
	jne   ulang

cetak:
	popl %ecx
	movl  %eax,%ecx
	addl $0x30,%ecx
	movl  $4,%eax
	movl  $1,%ebx
	movl  $3,%edx
	int   $0x80
	
	movl  $1,%eax
	int  $0x80 

