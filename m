From: "Nanakos Chrysostomos" <nanakos@wired-net.gr>
Subject: Re: x86 Endiannes and libc printf
Date: Sat, 9 Jul 2005 17:41:54 +0300 (EEST)
Message-ID: <58406.62.38.142.246.1120920114.squirrel@webmail.wired-net.gr>
References: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
    <20050709101937.0aad4448@localhost>
Reply-To: nanakos@wired-net.gr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050709101937.0aad4448@localhost>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paolo Ornati <ornati@fastwebnet.it>
Cc: linux-assembly@vger.kernel.org

Thanks very much for your response.
I know that x86 CPU is little endian,but how the printf prints out the
that number which starts from the first lowest byte in mem /stack which is
0x44??
Maybe internally knows that this is a cast???
Lest assume the following example:
#include <stdio.h>

int main(void) {
 	unsigned int buf = {0x44,0x43,0x42,0x41};
 	unsigned char *x = (unsigned char*)&buf;
 	printf("%#x\n", *(int *)x);
 	return 0;
 }

prints out the buf array in reverse order ,little-ednian, and treats it as
a number,

0x41424344

But check out the following example:

endian.txt
-----------
DBCA
.section .data
        .filename: .string  "endian.txt"


.text
.globl _start

_start:
        pushl %ebp
        movl %esp,%ebp

        movl $5,%eax
        movl $.filename,%ebx
        movl $0x00,%ecx
        int $0x80

        movl %eax,%ebx
        movl $3,%eax
        leal -8(%ebp),%ecx
        movl $4,%edx
        int $0x80

        movl $4,%eax
        movl $1,%ebx
        movl $0x0a,-4(%ebp)
        leal -8(%ebp),%ecx
        movl $5,%edx
        int $0x80

        movl $1,%eax
        movl $0,%ebx
        int $0x80


#as -o example.o example.s
#ld -o example example.o
#./example
DBCA

We print out the memory from the lowest byte-order.
How can we print out by using the system call 'write' this byte-order and
treat it like a number,as printf does.????????????????????????????????

Thanks in advance.


example.s
----------


