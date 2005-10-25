From: Ricardo Catalinas Jimenez <th1nk3r@server01.org>
Subject: printf without '\n'
Date: Tue, 25 Oct 2005 17:16:02 +0200
Message-ID: <20051025151602.GA2904@jehuty.server01.org>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Newbie simple question:

With a code like this:

.section .data
MSG:
	.ascii "Hello\0"
.section .text
	.globl _start
_start:
	pushl %ebp
	movl %esp, %ebp

	pushl $MSG
	call printf

        movl %ebp, %esp
        popl %ebp

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

I compiled it with:
as code.s -o code.o; ld --dynamic-linker /lib/ld-linux.so.2 -lc \
	test.o -o test

With that ascii string, nothing is printed but when I use "Hello\n\0" it
works fine. 

What is the reason for not printing the string if there isn't a '\n' in
it?

I something related with the buffered (by lines) IO?

Why with a C program it does not happend.

Thanks in advance.

