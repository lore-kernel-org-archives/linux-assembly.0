From: "Jason Roberts" <v3ct0r99@hotmail.com>
Subject: Re: self modifying code---nemesis strikes!
Date: Mon, 03 Nov 2003 17:57:21 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law9-F6057qu9gWGE5N00021482@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: v3ct0r99@hotmail.com, linux-assembly@vger.kernel.org

I spoke too soon-- I forgot the jmp to test
so it segfaults :(
What do I do???


>From: "Jason Roberts" <v3ct0r99@hotmail.com>
>To: v3ct0r99@hotmail.com, linux-assembly@vger.kernel.org
>Subject: Re: self modifying code---I got it!!!! Yeah baby,haha
>Date: Mon, 03 Nov 2003 17:49:03 +0000
>
>I figured it out, here's my code:
>
>
>section .data
>
>string     db "normal execution",10,13,0
>hstring    db "I am modified!",10,13,0
>
>
>section .text
>
>global _start
>
>_start:
>
>
>
>hacked:
>
>
>
>mov  edx,17     ;length of buffer
>mov  eax,4       ;sys_write
>mov  ebx,1       ;file descriptor
>mov  ecx,hstring  ;buffer
>
>int  0x80
>jmp exit
>
>
>
>_test:
>
>    call modify
>    xor eax,eax     ;this will be performed but ignored
>hack_me:
>
>
>                   mov  edx,19     ;length of buffer
>                   mov  eax,4       ;sys_write
>                   mov  ebx,1       ;file descriptor
>                   mov  ecx,string  ;buffer
>                   int  0x80
>
>          modify:
>           mov edi, to_write      ;load address of code-to-write in EDI
>           mov  [hack_me], edi    ;write code to location 'hack_me:'
>           ret                           ;return from call
>to_write:
>           jmp hacked
>
>
>
>exit:
>
>mov ebx,eax
>mov eax,1
>int 0x80
>
>
>
> >From: "Jason Roberts" <v3ct0r99@hotmail.com>
> >To: linux-assembly@vger.kernel.org
> >Subject: self modifying code
> >Date: Mon, 03 Nov 2003 17:14:57 +0000
> >
> >Hi all--
> >I'd like to be able to implement this cool trick called smc.
> >It's used mostly by crackers and virus coders, but has also
> >been used in JIT compilers.
> >
> >I know the *basic* steps:
> >1) mov reg1, code-to-write
> >2)  mov [addr-to-write-to], reg1
> >
> >how can I do this in nasm?
> >Thanks
> >pb
> >
> >_________________________________________________________________
> >See when your friends are online with MSN Messenger 6.0. Download it now 
>FREE! http://msnmessenger-download.com
> >
> >-
> >To unsubscribe from this list: send the line "unsubscribe linux-assembly" 
>in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

_________________________________________________________________
Cheer a special someone with a fun Halloween eCard from American Greetings! 
Go to  http://www.msn.americangreetings.com/index_msn.pd?source=msne134

