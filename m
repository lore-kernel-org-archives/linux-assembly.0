From: "Maik Beckmann" <baegsch@linuxmail.org>
Subject: Re: ld unresolved symbols
Date: Fri, 07 Nov 2003 09:02:59 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20031107080300.10442.qmail@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi, sorry i send the first mail only to you but not to this list.

Why do you call mprotect not by int $0x80? 

----- Original Message -----
From: "Jason Roberts" <v3ct0r99@hotmail.com>
Date: 	Thu, 06 Nov 2003 19:21:44 +0000
To: linux-assembly@vger.kernel.org
Subject: ld unresolved symbols

> 
> Hi all,
> I was trying to implement some smc--- someone Maik ? suggested using 
> mprotect
> to get write acces to code seg. Anyways, nasm will assemble but linker
> complains:
> 
> smc.o(.text+0x64): In function `protect':
> : undefined reference to `_mprotect'
> 
> I compiled like this:
> nasm -f elf -i/usr/include/sys smc.asm
> ld -s smc.o
> 
> any help would be appreciated...
> I dont want to wade through 85+ pages of dense reading to find the right
> 'switch' -- I do have a life besides code bashing:)
> Thanks
> JR
> 
> 
> 
> 
> section .data
> 
> string     db "normal execution",10,13,0
> hstring    db "I am modified!",10,13,0
> 
> 
> section .text
> 
> global _start
> extern _mprotect
> 
> _start:
> 
> jmp _test
> 
> hacked:
> 
> 
> 
> mov  edx,17     ;length of buffer
> mov  eax,4       ;sys_write
> mov  ebx,1       ;file descriptor
> mov  ecx,hstring  ;buffer
> 
> int  0x80
> jmp exit
> 
> 
> 
> 	_test:
> 
> 		  call modify
> 		  xor eax,eax     ;this will be performed but ignored
> 	hack_me:
> 
> 
>                   mov  edx,19     ;length of buffer
>                   mov  eax,4       ;sys_write
>                   mov  ebx,1       ;file descriptor
>                   mov  ecx,string  ;buffer
>                   int  0x80
> 
>          modify:
> 	          mov edi, to_write      ;load address of code-to-write in EDI
> 		  push hack_me           ;save address to write for mprotect
> 		  call protect
> 	          mov [hack_me], edi    ;write code to location 'hack_me:'
> 	          ret                           ;return from call
> 	to_write:
> 
> 
> 
> 		  jmp hacked
> 
> 
> 
> protect:
>              pop edi
>              mov ecx,0x2 ;PROT_WRITE
> 	     push ecx
> 	     mov ecx,2048
> 	     push ecx
> 	     push edi
> 	     call _mprotect
>              ret
> 
> 
> 
> exit:
> 
> mov ebx,eax
> mov eax,1
> int 0x80
> 
> _________________________________________________________________
> Send a QuickGreet with MSN Messenger 
> http://www.msnmessenger-download.com/tracking/cdp_games
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
______________________________________________
Check out the latest SMS services @ http://www.linuxmail.org 
This allows you to send and receive SMS through your mailbox.


Powered by Outblaze
