From: sandeep <sandeep@codito.com>
Subject: Re: extended asm+pointers
Date: Wed, 11 Aug 2004 18:34:02 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <411A1942.8060308@codito.com>
References: <20040811112319.87376.qmail@web52908.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090607050209030704010202"
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040811112319.87376.qmail@web52908.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.
--------------090607050209030704010202
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Yeah, on closer look, your code should achieve what you intended. May be 
something more has to be done in "asm ...." to get the correct code generated or 
  may be gcc (v 3.2.3 on i386) is not generating correct code.

I tried slightly modified version of your code (attached file 1.c)
also attaching the output of "gcc -S 1.c" (file 1.s - modified)

original assembly code generated for the "asm(...)" in the code was

#APP
     movq (%eax), %mm0
movq %mm0, (%eax)

#NO_APP

this code is not going to change things, as it is doing like "x=x".

On modifying the code to below (based on how variables were allocated for the test)

#APP
     movq (%eax), %mm0
     leal    -16(%ebp), %eax
movq %mm0, (%eax)

#NO_APP

"gcc 1.s" generates a.out that works the you expect.

Ankit Jain wrote:
> thanks. well i know it is effectively working for
> m1[i] but my question was why it is not working for
> b[i] when pointer points to that location or the
> reality could be pointer dont points to that
> location...but if so then why?
> 
> ankit 
> --- sandeep <sandeep@codito.com> wrote: 
> 
>>Ankit Jain wrote:
>>
>>>      4 int main()
>>>      5 {
>>>      6   uint8_t
>>>a[8]={1,2,3,4,5,6,7,8},b[8]={0,0,0,0,0,0},i;
>>>      7   uint8_t *m,*m1;
>>>      8 
>>>      9   m=a;
>>>     10   m1=b;         //i have pointed m1 to b
>>>     11   for(i=0;i<8;i++)
>>>     12      printf("%d ",a[i]);
>>>     13   printf("\n");
>>
>>>     14   asm("movq (%1), %%mm0 \n"
>>>     15       "movq %%mm0, (%0) \n"
>>>     16       :"=r"(m1)
>>>     17       :"r"(m)
>>>     18       );
>>
>>this asm(...) is effectively achieving "m1=m;" you
>>can verify this by printing 
>>m1[i] instead of a[i] and b[i]
>>
>>>     19 
>>>     20   for(i=0;i<8;i++)
>>>     21      printf("%d ",b[i]);
>>>     22   return 0;
>>>     23 }
>>>well this problem is not solved yet. because when i
>>>display b array then it prints all 0's. according to
>>>me since i have initialised this m1 pointer then by b
>>>then b whould have all the values which i have moved
>>>some have advised me to use arrays here as constraint
>>>but i want to use pointers. i am using r constraint
>>>and it says it says that m1 will use a register (i
>>>guess there is no problem in that)

-- 
regards
sandeep
--------------------------------------------------------------------------
A lack of leadership is no substitute for inaction.
--------------------------------------------------------------------------

--------------090607050209030704010202
Content-Type: text/plain;
 name="1.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="1.c"

#include <inttypes.h>

int main()
{
	uint32_t a[2]={0x01020304,0x05060708},b[2]={0x0,0x0},i;
	uint32_t *m,*m1;

	m=a;
	m1=b;         //i have pointed m1 to b

	asm volatile ("movq (%1), %%mm0 \n"
		"movq %%mm0, (%0) \n"
		:"=r"(m1)
		:"r"(m)
	);

	for (i=0;i<2;i++)
		printf ("m[%d]=%d, m1[%d]=%d, b[%d]=%d\n", i, m[i], i, m1[i], i, b[i]);
	return 0;
}

--------------090607050209030704010202
Content-Type: text/plain;
 name="1.s"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="1.s"

	.file	"1.c"
	.section	.rodata
	.align 32
.LC0:
	.string	"m[%d]=%d, m1[%d]=%d, b[%d]=%d\n"
	.text
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	andl	$-16, %esp
	movl	$0, %eax
	subl	%eax, %esp
	movl	$16909060, -8(%ebp)
	movl	$84281096, -4(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	leal	-8(%ebp), %eax
	movl	%eax, -24(%ebp)
	leal	-16(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	-24(%ebp), %eax
#APP
	movq (%eax), %mm0 
	leal	-16(%ebp), %eax
movq %mm0, (%eax) 

#NO_APP
	movl	%eax, -28(%ebp)
	movl	$0, -20(%ebp)
.L2:
	cmpl	$1, -20(%ebp)
	jbe	.L5
	jmp	.L3
.L5:
	subl	$4, %esp
	movl	-20(%ebp), %eax
	pushl	-16(%ebp,%eax,4)
	pushl	-20(%ebp)
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-28(%ebp), %eax
	pushl	(%eax,%edx)
	pushl	-20(%ebp)
	movl	-20(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	pushl	(%eax,%edx)
	pushl	-20(%ebp)
	pushl	$.LC0
	call	printf
	addl	$32, %esp
	leal	-20(%ebp), %eax
	incl	(%eax)
	jmp	.L2
.L3:
	movl	$0, %eax
	leave
	ret
.Lfe1:
	.size	main,.Lfe1-main
	.ident	"GCC: (GNU) 3.2.3"

--------------090607050209030704010202--

