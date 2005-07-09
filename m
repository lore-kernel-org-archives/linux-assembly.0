From: Paolo Ornati <ornati@fastwebnet.it>
Subject: Re: x86 Endiannes and libc printf
Date: Sat, 9 Jul 2005 18:31:41 +0200
Message-ID: <20050709183141.75f3b4ba@localhost>
References: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
	<20050709101937.0aad4448@localhost>
	<58406.62.38.142.246.1120920114.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <58406.62.38.142.246.1120920114.squirrel@webmail.wired-net.gr>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nanakos@wired-net.gr
Cc: linux-assembly@vger.kernel.org

On Sat, 9 Jul 2005 17:41:54 +0300 (EEST)
"Nanakos Chrysostomos" <nanakos@wired-net.gr> wrote:

> #as -o example.o example.s
> #ld -o example example.o
> #./example
> DBCA
> 
> We print out the memory from the lowest byte-order.
> How can we print out by using the system call 'write' this byte-order
> and treat it like a number,as printf
> does.????????????????????????????????


1) from a quick read of your assebly code it seems that you are reading
some bytes from a file and writing them to standard output.

These bytes are the ASCII codes of D, B, C, A
NOTE that this is very different than hexadecimal values D, B, C, A.

I hope you agree with me that 'A' != 0xA... sice 'A' = 65, and 0xA = 10.

But maybe you are doing it on purpose...


2) if you want "treat it as a number" in assembly, just put these bytes
in a register.

Assuming that they are in little endian order at -8(%ebp):

	movl	-8(%ebp), %eax

Now you have the WHOLE number in %eax register.


3) To print the value in a HUMAN-READABLE way you should do something
like this (written in C for semplicity):

	const char digits[] = "0123456789abcdef";
	unsigned int x = 64335252;	// this is the NUMBER to print
	unsigned int base = 10;		// you can change it to anything from 2 to 16
	char tmp;

	while (x) {
		tmp = x % base;		// extract low order digit
		x /= base;		// discard low order digit
		PRINT_WITH_SOMETHINTG( digit[tmp] );
	}

This is basically what printf does...


PS: in this example I've done the RAW NUMBER DIGIT to ASCII conversion
with an array... but you can do it in other ways as well.


-- 
	Paolo Ornati
	Linux 2.6.12.2 on x86_64
