From: hp <lx@lxhp.in-berlin.de>
Subject: Re: Q: -fpic and $_GLOBAL_OFFSET_TABLE_
Date: Wed, 16 Jul 2003 00:24:52 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200307160024.53028.lx@lxhp.in-berlin.de>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <E19cPhx-0000W5-00@mail.tv-sign.ru>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Nesterov <oleg@tv-sign.ru>, linux-assembly@vger.kernel.org

Oleg Nesterov am Dienstag, 15. Juli 2003 14:19:
> Hello.
>
> I thought, that &GOT == $_GLOBAL_OFFSET_TABLE_ + .
						^^^^^^^^^^^^^^^^^^^^^
thus your GOT would be at a different place whenever fetched at a different 
address in your code - not very likely...

and, more in the ELF standard description, re links at
		http://www.lxhp.in-berlin.de/lhplinks.html#elf

>
> $ cat test.c
>
> void test(void)
> {
> 	asm volatile (
> 		"addl $_GLOBAL_OFFSET_TABLE_, %eax\n"
> 		"addl $_GLOBAL_OFFSET_TABLE_, %ecx\n"
> 	);
> }
>
> $ cc -c -fpic -fomit-frame-pointer test.c && ld -shared -o test.so test.o
> && objdump -d test.so
>
> test.so:     file format elf32-i386
>
> Disassembly of section .text:
>
> 0000018c <test>:
>  18c:	05 0d 10 00 00       	addl   $0x100d,%eax	==> &GOT = 0x18c + 0x100d =
> 0x1199 191:	81 c1 07 10 00 00    	addl   $0x1007,%ecx	==> &GOT = 0x191 +
> 0x1007 = 0x1198 197:	c3                   	ret
>
> How can it be?
>
> Oleg.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
	FAQ(s) + DOCs at http://linuxassembly.org
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>

