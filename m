From: "uglyhunK" <mail@uglyhunk.in>
Subject: Win32 function call using GNU assembler
Date: Wed, 02 Sep 2009 13:41:08 +0530
Message-ID: <20090902081109.40BBA300022A@bmail00.one.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org


Hi,

The following assembly source is not working. Really not sure where I'm going wrong.
Any guidance will be appreciated.

.section .data
	CLASS_NAME:
		.ascii "M\0a\0i\0n\0\0\0" # Main
	WINDOW_NAME:
		.ascii "A\0S\0M\0 \0W\0i\0n\0d\0o\0w\0\0\0" # ASM Window
		
.section .text
	.globl _WinMain@16
	_WinMain@16:
		# function prologue
		pushl	%ebp
		movl	%esp, %ebp
		
		pushl	$0				# LPVOID lpParam
		movl	8(%ebp), %eax
		pushl	%eax			# HINSTANCE hInstance
		pushl	$0				# HMENU hMenu
		pushl	$0				# HWND hWndParent
		pushl	$120			# nHeight
		pushl	$240			# nWidth
		pushl	$-2147483648	# y
		pushl	$-2147483648	# x
		pushl	$13565952		# dwStyle
		pushl	$WINDOW_NAME	# lpWindowName
		pushl	$CLASS_NAME		# lpClassName
		pushl	$512			# dwExStyle
		call	_CreateWindowExA@48
		add		$48, %esp
		
		# function epilogue
		movl	%ebp, %esp
		popl	%ebp
		ret

Thank you