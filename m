From: "ssams" <ssams@telkom.net>
Subject: code_for_integer_printing
Date: Sat, 07 Sep 2002 00:06:03 +0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <web-46557921@m1.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

i want to ask about a little code bellow...
i build this code for print some integer value..
i think is easy for doing but after i do some fungtion
below
i did not find ionteger output.
so how is function to do it..?

this is my code, i hope you help me..?
thank's before..

.macro cetak		# macro for printing
	xor %eax,%eax
	mov $1,%ebx
	mov $4,%eax
	int $0x80
.endm
.data
promt1:
	.byte 65
.text
.globl _start
_start:
	mov $promt1,%eax 	#eax will divided
	mov $10,%ebx		#ebx is divident
	xor %ecx,%ecx
ulangi:
	xor %edx,%edx
	div %ebx		#eax : ebx
	push %edx		# save remainder
	inc %ecx
	cmp $0 ,%eax
	jne ulangi

	mov $3,%ecx
ulang_cetak:
	push %ecx
	pop %edx		#take point
	add $0 ,%dl		#convert to ascii
	mov %edx,%ecx		#for printing
	mov $1,%edx
	cetak			#print
	pop %ecx
	dec %ecx
	jnz ulang_cetak

	movl $1,%eax	#exit
	movl $0,%ebx
	int  $0x80
---------------------  Yang Mudah dan Menghibur ----------------------------

 

Hosting menjadi mudah dan murah hanya di PlasaCom. Klik http://idc.plasa.com

F1 Mania!! Ikuti F1 Game di Obelix Game Corner di http://www.plasa.com/infotel/f1.html

 

---------------------------------------------------------------------------------------

