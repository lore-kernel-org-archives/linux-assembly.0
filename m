From: wklux@yahoo.co.uk
Subject: Re: appending \n using registers
Date: Mon, 3 Nov 2003 19:55:51 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311031955.51859.wklux@yahoo.co.uk>
References: <Law9-F57R88vo2O66rD0001ae77@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law9-F57R88vo2O66rD0001ae77@hotmail.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Roberts <v3ct0r99@hotmail.com>, bdavids1@gmu.edu, linux-assembly@vger.kernel.org

Jason Roberts am Monday 03 November 2003 14:31:
> hehe,
> I gathered what you meant there...but I guess if youre an at&t geek it

I don't like the hybrid att 'syntax', at all, but I prefer AS, because of 
compiling speed, reliability, availability...

> would not be trivial!
> now look here again and tell me I'm whacked: I just want to display a 2
> byte string with a \n!
> *note* I do not want to 'embed' a newline.
> Thanks for help
> pb


> section .data
>
> str         db "96"
>
> section .text
>
> global _start
>
> jmp _start
>
> _start:
> pusha
> call  _test
> popa
> jmp exit
>
>
>
> _test: could this line be culprit?  str is 2 bytes but I'm trying to mov 4
> using edx,no?
>
>          mov  edx,[str]     <-------		==> eax := dword at 'str'

this copies the _content_ at 'str' to edx,
i.e. l.s.bytes in memory copied to l.s.ytes in register, thus whether 2 or 4 
bytes buffer size won't matter while just reading; exactly matching access 
required only to preventing a 'segfault' (linux) when accessing memory just 
'below' top bound of reserved space.

I should think that you missed the meaning of the used operation - which seems  
a common error when migrating from 'masm'-like assemblers to the linux progs.

nasm expects either,
		lea edx,[str]
or,
		mov edx,str
to loading an effective address (hence 'LEA').

>          mov  ecx,edx				; ecx := edx = @str
not necessary. just copies the regs' content.

try 'mov edx,str' or 'lea edx,[str]' instead (I prefer LEA for clarity).

> ----------------------------------------------- <
            lea ecx,[str]	; buffer, i.e. string source
> ;;; mov  edx,[str]
> ;;; mov  ecx,edx
>          mov  edx,2
>          mov  eax,4
>          mov  ebx,1
>          int  0x80
> ------------------------------------------------ <

verify:
where is your buffer :)
how is the buffer related to your data?
what about EDI ?

> ------------------------------------------------ <
		push dword 0x0a0d	; push immediate data, lsb at addr ESP
		mov ecx,esp			; buffer is top dword of r-stack
> ;;; mov  edi,0x0a0d00
> ;;; mov  ecx,edx
>          mov  edx,2
>          mov  eax,4
>          mov  ebx,1
>          int  0x80
		lea esp,[esp+4]		; discard temp. buffer
>          ret
>
> exit:
>
>          mov ebx,eax
>          mov eax,1
>          int 0x80
> ------------------------------------------------ <

best,
	hp
-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de

