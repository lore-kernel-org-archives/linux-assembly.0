From: "ssams" <ssams@telkom.net>
Subject: code-need-to-correct
Date: Thu, 19 Sep 2002 21:40:09 +0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <web-50448669@m1.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org


 .macro sys_write
	mov $4,%eax
	mov $1,%ebx
	int $0x80
.endm
.macro sys_read
	mov $3,%eax
	mov $2,%edx
	mov $0,%ebx
	int $0x80
.endm
.data
msg1: .ascii "Masukkan Angka: "
jum_masuk: 
	.byte .- msg1
satu: .ascii "Satu Lagi: "
jum_satu: 
	.byte .- satu
spasi: .byte 10
.bss
.lcomm input1,0
.lcomm input2,0
angka: .byte 0
.text 
.globl _start
_start:
	mov $msg1,%ecx
	mov $16,%edx
	sys_write
	sys_read
	mov %eax,input1

	
	mov $satu,%ecx
	mov $11,%edx
	sys_write
	sys_read
	mov %eax,input2


tambah:
	mov (input2),%eax
	add (input1),%eax
	mov $10,%bx
	xor %ecx,%ecx
ulang:
	div %bx
	push %edx
	inc %ecx
	cmp $0,%al
	jne ulang
cetak:
	pop %edx
	add $0x30,%dx
	mov %dx,angka
	push %ecx
	mov $angka,%ecx
	mov $1,%edx
	sys_write
	pop %ecx
	loop cetak	

	mov $spasi,%ecx
	mov $1,%edx
	sys_write

	movl $1,%eax	#exit
	movl $1,%eax	#exit
	movl $0,%ebx
	int  $0x80

output:

Masukkan angka: 4
Satu lagi: 5
2478030160157010470915781817.....

How to read input...?
=========================================================================
Khusus Pelanggan Telepon DIVRE 2, Tekan 166 untuk mendengarkan pesan Anda.
=========================================================================
