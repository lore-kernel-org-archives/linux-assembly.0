From: Oleg Nesterov <oleg@tv-sign.ru>
Subject: Q: -fpic and $_GLOBAL_OFFSET_TABLE_
Date: Tue, 15 Jul 2003 17:19:05 +0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <E19cPhx-0000W5-00@mail.tv-sign.ru>
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello.

I thought, that &GOT == $_GLOBAL_OFFSET_TABLE_ + .

$ cat test.c

void test(void)
{
	asm volatile (
		"addl $_GLOBAL_OFFSET_TABLE_, %eax\n"
		"addl $_GLOBAL_OFFSET_TABLE_, %ecx\n"
	);
}

$ cc -c -fpic -fomit-frame-pointer test.c && ld -shared -o test.so test.o && objdump -d test.so

test.so:     file format elf32-i386

Disassembly of section .text:

0000018c <test>:
 18c:	05 0d 10 00 00       	addl   $0x100d,%eax	==> &GOT = 0x18c + 0x100d = 0x1199
 191:	81 c1 07 10 00 00    	addl   $0x1007,%ecx	==> &GOT = 0x191 + 0x1007 = 0x1198
 197:	c3                   	ret    

How can it be?

Oleg.
