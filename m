From: lx <lx@lxhp.in-berlin.de>
Subject: Re: code_for_integer_printing
Date: Thu, 19 Sep 2002 20:07:16 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020919200716.530f53e9.lx@lxhp.in-berlin.de>
References: <20020906185041.1f61cee6.lx@lxhp.in-berlin.de>
	<web-49325170@m1.plasa.com>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-49325170@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ssams <ssams@telkom.net>
Cc: linux-assembly <linux-assembly@vger.kernel.org>

On Mon, 16 Sep 2002 12:31:26 +0700
"ssams" <ssams@telkom.net> wrote:

i do not re-write the code for you:) but, i hope that my annotations 
will help. i'd suggest you try getting through my syscalls intro at
	http://www.lxhp.in-berlin.de/lhpsyscal.html
but, those syscalls aren't all that simple; try verifying what happens 
by following the rsp. source files. could aid a lot to understanding. 
if you find it difficult to connect to the syscalls pages i could send 
you the complete colletion as an archive, by email or, you might get 
it yourself by
	http://www.lxhp.in-berlin.de/lhpsysc-html.tar.bz2

best,
	hp

> .macro cetak # macro for printing
>  xor %eax,%eax
>  mov $1,%ebx
>  mov $4,%eax
>  int $0x80
>  .endm

essential: syscalls read/write (and many others) always use 
an address of where the data are which you want to operate on
and a count of bytes of the length of that sequence of data.
which for 'read' and 'write' means that with ECX you pass the 
#address# of your text and, with EDX the number of bytes to 
receive or send.

so, for instance, you could modify the macro to
.macro cetak		# all regs but EAX, EBX preserved
	pushl %ecx	# print the register value itself, 
	movl %esp,%ecx	# this is your temporary buffer address
	movl $1,%ebx	# Linux "stdout"
	movl $4,%eax	# sys_write
	int $0x80	# execute...
	cmpl $0xffff0001,%eax # optional: NC in EFLAGS if EAX error code
	popl %ecx	# remove temp buffer = restore stack, and restore ECX
.endm
# or, restore stack, e.g. w.  "addl $4,%esp" which modifies EFLAGS
# or, preserve error flags w. "leal 4(%esp),%esp"
# note that the above error test is valid for #all# syscalls.

btw, you could save typing those "%"s (they are often required if AS used 
for the GCC backend, though) with:
	.att_syntax no_prefix
at top of your assembly text.

>  .data
>  promt1:
>  .byte 65
>  .text
>  .globl _start
>  _start:
>  	mov $promt1,%eax #eax will divided
>  	mov $10,%ebx #ebx is divident
>  	xor %ecx,%ecx
> 
>  ulangi:
>  	xor %edx,%edx
>  	div %ebx #eax : ebx
>  	push %edx # save remainder
>  	inc %ecx
>  	cmp $0 ,%eax
>  	jne ulangi
>  
> 	mov $3,%ecx
> 	 ulang_cetak:
>  	push %ecx
>  	pop %edx #take point
>  	add $48 ,%dl 	#convert to ascii i've try add with $'0' to
> 			#but it same no output with it
>  	mov %edx,%ecx #for printing
>  	mov $1,%edx
>  	cetak #print
>  	pop %ecx
>  	dec %ecx
>  	jnz ulang_cetak
>  
> 	movl $1,%eax #exit
> 	 movl $0,%ebx
> 	int $0x80
> 
>  regards,
>  ssams
>  
> =========================================================================
> Khusus Pelanggan Telepon DIVRE 2, Tekan 166 untuk mendengarkan pesan Anda.
> =========================================================================


-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
