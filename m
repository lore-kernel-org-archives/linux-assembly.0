From: "ssams" <ssams@telkom.net>
Subject: inside_SUB
Date: Mon, 16 Sep 2002 12:15:26 +0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <web-49320142@m1.plasa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

by this code bellow i want print new line with the simple
way
i sub first char "49" with 39. but i did not get output
like what i want
output from this code is
1>>
when i look at ascii code this second char value is 187.
would some body expalin me...?

regard

.data
 msg: .byte 49
.text
.globl _start
_start:
   	mov $msg,%ecx
   	mov $1,%ebx
   	mov $1,%edx
   	mov $4,%eax
	int $0x80

   	mov %ecx,%eax
   	sub $39,%eax
	#ul %ebx
	mov %eax,%ecx
	mov $4,%eax
	int $0x80
	
	mov $1,%eax
   	int $0x80

=========================================================================
Khusus Pelanggan Telepon DIVRE 2, Tekan 166 untuk mendengarkan pesan Anda.
=========================================================================
