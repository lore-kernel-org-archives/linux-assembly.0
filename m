From: "Jason Roberts" <v3ct0r99@hotmail.com>
Subject: ld unresolved symbols
Date: Thu, 06 Nov 2003 19:21:44 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law9-F80KiupllcUPl4000104d2@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Hi all,
I was trying to implement some smc--- someone Maik ? suggested using 
mprotect
to get write acces to code seg. Anyways, nasm will assemble but linker
complains:

smc.o(.text+0x64): In function `protect':
: undefined reference to `_mprotect'

I compiled like this:
nasm -f elf -i/usr/include/sys smc.asm
ld -s smc.o

any help would be appreciated...
I dont want to wade through 85+ pages of dense reading to find the right
'switch' -- I do have a life besides code bashing:)
Thanks
JR




section .data

string     db "normal execution",10,13,0
hstring    db "I am modified!",10,13,0


section .text

global _start
extern _mprotect

_start:

jmp _test

hacked:



mov  edx,17     ;length of buffer
mov  eax,4       ;sys_write
mov  ebx,1       ;file descriptor
mov  ecx,hstring  ;buffer

int  0x80
jmp exit



	_test:

		  call modify
		  xor eax,eax     ;this will be performed but ignored
	hack_me:


                  mov  edx,19     ;length of buffer
                  mov  eax,4       ;sys_write
                  mov  ebx,1       ;file descriptor
                  mov  ecx,string  ;buffer
                  int  0x80

         modify:
	          mov edi, to_write      ;load address of code-to-write in EDI
		  push hack_me           ;save address to write for mprotect
		  call protect
	          mov [hack_me], edi    ;write code to location 'hack_me:'
	          ret                           ;return from call
	to_write:



		  jmp hacked



protect:
             pop edi
             mov ecx,0x2 ;PROT_WRITE
	     push ecx
	     mov ecx,2048
	     push ecx
	     push edi
	     call _mprotect
             ret



exit:

mov ebx,eax
mov eax,1
int 0x80

_________________________________________________________________
Send a QuickGreet with MSN Messenger 
http://www.msnmessenger-download.com/tracking/cdp_games

