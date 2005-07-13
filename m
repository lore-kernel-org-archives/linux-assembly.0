From: Paul Irofti <bulibuta@gmail.com>
Subject: prime numbers
Date: Thu, 14 Jul 2005 01:40:24 +0300
Message-ID: <42D59858.8060404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

this is an exercies i set out to do in order to familiarise my self with 
linux and AT&T
assembly syntax.

i worked a lot and read a lot before figureing out how each operator 
gets its paramaters and such...

the code doesn't compile with the following errors:

# as -gstabs sieve.s -o sieve.o
# gcc sieve.o -o sieve
sieve.o(.text+0x1):sieve.s:20: relocation truncated to fit: R_386_8 .data
sieve.o(.text+0xc):sieve.s:24: relocation truncated to fit: R_386_16 .data
sieve.o(.text+0x19):sieve.s:32: relocation truncated to fit: R_386_8 .data
sieve.o(.text+0x1b):sieve.s:33: relocation truncated to fit: R_386_8 .data
sieve.o(.text+0x2d):sieve.s:43: relocation truncated to fit: R_386_8 .data
sieve.o(.text+0x39):sieve.s:50: relocation truncated to fit: R_386_8 .data
collect2: ld returned 1 exit status

the source code is:

# assembly code for the calculation of the primes numbers in the range of [2-100]
# the code brute forces the numbers out, no formulas are taken in consideration

*.include* "defines.h"		#system call numbers are stored here (i.e. __NR_<oper> = number)

*.global* main

*.data*

sieve:	
	*.byte* 4
test:
	*.byte* 1

*.text*

main:
	
loop:	
	movb $test, %dl
	incb %dl		#increase test
	movb %dl, (test)
	
	movw $sieve, %ax	#prepare for divb: move sieve in ax
	divb %dl		#div ax by dl
	
	xor %cx, %cx		#clear cx
	movb %ah, %cl		#move rest in cx
	
	jcxz next		#test if rest is 0 and increase if so
	
	movb $sieve, %al
	movb $test, %bl
	cmpb %al, %bl		#else test if "test" has reached sieve
	
	jnz loop		#if not go back and div by new test value
	
				
print:	movl $__NR_write, %eax  #else print the prime
	movl $1, %ebx		#STDOUT is $1
	xor %ecx, %ecx
	
	movb $sieve, %cl
	addb $30, %cl		#make ascii out of int
	
	movl $16,%edx		#buffer size
	int $0x80
	
next:	
	movb $sieve, %cl
	incb %cl		#increase sieve
	movb %cl, (sieve)
	
	movb $100, %al
	cmpb %al, %cl		#test if limit is reached
	jz exit
			
	movb $1, %al		#if not start again with a new sieve and test = 1
	movb %al, (test)
	
	jmp loop
	
exit:	movl $0, %eax
	ret
	

please send me any critique and advices you can, i really want to make 
the complete switch from MASM to GAS as soon as possible....

cheers!
