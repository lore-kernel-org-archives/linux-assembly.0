From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Win32 function call using GNU assembler
Date: Wed, 02 Sep 2009 09:16:14 -0700
Message-ID: <1251908175.3233.31.camel@bob-desktop.lucy.palace>
References: <20090902081109.40BBA300022A@bmail00.one.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20090902081109.40BBA300022A@bmail00.one.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: uglyhunK <mail@uglyhunk.in>
Cc: linux-assembly@vger.kernel.org

What do you mean by "not working"? What is the behavior?

I do note that the
          add $48, %esp
instruction is irrelevant since it is immediately followed by
          movl %ebp, %esp

BTW, I'm not a Win32 programmer, so I don't know if I can add any
further insight.

-- Bob

On Wed, 2009-09-02 at 13:41 +0530, uglyhunK wrote:
> Hi,
> 
> The following assembly source is not working. Really not sure where I'm going wrong.
> Any guidance will be appreciated.
> 
> .section .data
> 	CLASS_NAME:
> 		.ascii "M\0a\0i\0n\0\0\0" # Main
> 	WINDOW_NAME:
> 		.ascii "A\0S\0M\0 \0W\0i\0n\0d\0o\0w\0\0\0" # ASM Window
> 		
> .section .text
> 	.globl _WinMain@16
> 	_WinMain@16:
> 		# function prologue
> 		pushl	%ebp
> 		movl	%esp, %ebp
> 		
> 		pushl	$0				# LPVOID lpParam
> 		movl	8(%ebp), %eax
> 		pushl	%eax			# HINSTANCE hInstance
> 		pushl	$0				# HMENU hMenu
> 		pushl	$0				# HWND hWndParent
> 		pushl	$120			# nHeight
> 		pushl	$240			# nWidth
> 		pushl	$-2147483648	# y
> 		pushl	$-2147483648	# x
> 		pushl	$13565952		# dwStyle
> 		pushl	$WINDOW_NAME	# lpWindowName
> 		pushl	$CLASS_NAME		# lpClassName
> 		pushl	$512			# dwExStyle
> 		call	_CreateWindowExA@48
> 		add		$48, %esp
> 		
> 		# function epilogue
> 		movl	%ebp, %esp
> 		popl	%ebp
> 		ret
> 
> Thank you--
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

