From: Linux Dev <lnxdev@yahoo.com>
Subject: Porting Inline Assembly code to RHL 7.1
Date: Mon, 6 May 2002 03:03:49 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020506100349.99382.qmail@web14703.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Hi all:

I am trying to port some Win32 inline assembly code to Linux
platform and I am facing some difficulties here.

The objective the program to extract the Intel Processor Serial
Number (PSN) on a given box.

The code is as follows:

-------------------------------------------------B-E-G-I-N-----

#include <stdio.h>

int DetectSerialNumber()
{
    int found_sn;

	__asm__
	(
        /* "pushfd\n\t" */
        
        /* get EFLAGS into eax */
		"popl %eax\n\t"

        /* keep a copy */
		"movl %eax,%ebx\n\t"

        /* toggle CPUID bit */
		"xorl $0x200000,%eax\n\t"
        
		"pushl %eax\n\t"

        /* set new EFLAGS */
        /* "popfd\n\t" */

        /* "pushfd\n\t" */

        /* EFLAGS back into eax */
		"popl %eax\n\t"


		/* have we changed the ID bit? */
		"xorl %eax,%ebx\n\t"

		"je NO_SERIAL_NUM\n\t"

		/* we could toggle the bit so CPUID is present */
		"movl $1,%eax\n\t"

        /* get processor features */
		"cpuid\n\t"

		/* check the serial number bit */
		"test 1<<18,%edx\n\t"

		"jz NO_SERIAL_NUM\n\t"
		"movl $1,$found_sn\n\t"
		"jmp DONE\n\t"
		"NO_SERIAL_NUM:\n\t"
		"movl $0,$found_sn\n\t"
		"DONE:\n\t"

	);

	return found_sn;
}


void ReadSerialNumber(long* serial)
{
	long t,m,b;

	__asm__
	(
	"movl $1,%eax\n\t"
	"cpuid\n\t"

	/* top 32 bits are the processor signature bits */
	"movl %eax,$t\n\t"

	/* A new CPUID code for the Pentium III */
	"movl $3,%eax\n\t" 


	"cpuid\n\t"
	"movl %edx,$m\n\t"
	"movl %ecx,$b\n\t"

	);

	/* copy the locals into the pointer variables passed in */ 
	serial[0] = b;
	serial[1] = m;
	serial[2] = t;

}

int main(void)
{
	if(DetectSerialNumber())
	{
		long serial[3] = {0, 0, 0};
		ReadSerialNumber(serial);
		printf("Serial Number %8x\n", serial[2]);
		printf("Serial Number %8x\n", serial[1]);
		printf("Serial Number %8x\n", serial[0]);
	}
	else
	{
		printf("Could not detect %d.\n", DetectSerialNumber());
	}

	getchar();
	return 0;
}

-------------------------------------------------E-N-D---------

The difficulties that I am facing relate to lack of knowledge of
Linux equivalent op-code for PUSHD and POPFD. My code for Win32
inline assembly is working fine.

I will appreciate if somebody can provide me assistance here.

Thanks
Tom.



__________________________________________________
Do You Yahoo!?
Yahoo! Health - your guide to health and wellness
http://health.yahoo.com
