From: "Jason Roberts" <v3ct0r99@hotmail.com>
Subject: appending \n using registers
Date: Sun, 02 Nov 2003 02:12:39 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law9-F53io7W2bLeb1X0000f7f4@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi all---
I have this problem where I want to append a newline to  a string.
I implemented a stack version and it works fine-- just push the \n 
sequence,push the string
and pass off to kernel write function. Now I want to do the same thing but 
through regs--
not working.
Also a concern of mine is the need to specify a 16 bit reg destination 
operand for a 2 byte move.
Obviously, using mov eax,src implies a 4 byte move -- is there any way to 
'force' a 1 or 2 byte move
into a 32-bit reg. I just want my code to look cleaner and avoid mixing 
32-bit and 16-bit regs.
Thanks for any help.
later ,
Paul






section .data

tr         db "96"

section .text

global _start

_start:
         ;output '69' with a \n

         ;stack method  -- works
         mov dx,[tr]
         xchg dh,dl      ; swap
         mov edi,0x0a0d00
         push edi            ;
         push dx
         mov  ecx,esp     ;buffer
         mov  edx,5       ;length of buffer
         mov  eax,4        ;sys_write
         mov  ebx,1        ;file descriptor
         int  0x80



  ;register method -- fails
         mov  dx,[tr]
         xchg dh,dl      ; swap
         mov  ecx,edx      ;buffer
         mov  edx,2        ;length of buffer
    mov  eax,4        ;sys_write
         mov  ebx,1        ;file descriptor
         int  0x80

         mov  edi,0x0a0d00
         mov  ecx,edx      ;buffer
         mov  edx,2        ;length of buffer
    mov  eax,4        ;sys_write
         mov  ebx,1        ;file descriptor
         int  0x80

exit:

  mov ebx,eax
  mov eax,1
  int 0x80

_________________________________________________________________
Concerned that messages may bounce because your Hotmail account has exceeded 
its 2MB storage limit? Get Hotmail Extra Storage!         
http://join.msn.com/?PAGE=features/es

