From: Stephen Ray <steve@mrmighty.net>
Subject: Re: Using C Libraries From Assembly
Date: Mon, 29 Aug 2005 17:37:08 -0300
Message-ID: <431371F4.2000604@mrmighty.net>
References: <0D544207876CDA428F17DD7EA448C192088AC0@bailey.DOMAIN.KSNINC.PVT> <431362BE.2080902@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <431362BE.2080902@yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Hoolihan <thoolihan@yahoo.com>
Cc: Landon Blake <lblake@ksninc.com>, linux-assembly@vger.kernel.org

If you can find a copy of Jeff Duntemann's "Assembly Language 
Step-by-Step, 2nd Ed.", the second section deals with using assembly and 
C together.  A lot of this stuff is covered in G. Adam Stanislav's 
tutorial on using assembly and FreeBSD, available at 
http://www.int80h.org/bsdasm/
Pay careful attention to the bit on the calling convention, what 
registers you have to save, setting up a stack frame, etc.  That's the 
bulk of what you'll need to know.  The trickiest part seems to be 
getting your assembler to produce an object file in the correct format. 
  After you have an object file, you can link it all together with gcc.

A short example exerpted from Duntemann follows:

; Build using these commands:
;    nasm -f elf eatlinux.asm
;    gcc eatlinux.o -o eatlinux

[SECTION .txt]

extern puts
global main          ;required so linker can find entry point

main:
     push ebp         ;Set up stack frame for debugger
     mov ebp, esp
     push ebx         ; Program must preserve ebp, ebx, esi, & edi
     push esi
     push edi
     ;;; everything before this is boilerplate; use it for all ordinary 
apps!

     push dword eatmsg ; push a 32-bit pointer to the message on the stack
     call puts         ; call the clib function for displaying strings
     add esp, 4        ; clean stack by adjusting esp back 4 bytes

     ;;; everything after this is boilerplate; use it for all ordinary apps!
     pop edi          ; restore saved registers
     pop esi
     pop ebx
     mov esp, ebp     ; destroy stack frame before returning
     pop ebp
     ret

[SECTION .data]      ; section containing initialized data

eatmsg:  db "Eat at Joe's!",10,0

[SECTION .bss]       ; section containing uninitialized data

If I recall correctly, underscores may have to be placed before function 
names when coding for Windows.

A few points to remember (from Duntemann):
  - Functions have to preserve the contents of EBX, ESP, EBP, ESI and 
EDI.  You usually do this by not using them, or saving them on the stack 
and restoring them when done.
  - C functions return their values in EAX if they're 32-bit, or EAX and 
EDX, with the low bits in EAX and the high bits in EDX.  Anything else 
is returned via a pointer in EAX
  - you pass parameters to a c function by pushing them in reverse order 
(right to left) onto the stack.
  - C functions do not clean their parameters off the stack.  If you 
call a C function and pass parameters onto the stack, you are 
responsible for cleaning up afterwards.

If you want to call C code, or have C code call your function, just 
follow these rules.  With C code calling your functions, you will  have 
to follow these rules scrupulously, and may have to experiment with 
underscores preceding your function.  Once you get it figured out, 
though, it's not that hard.

Stephen

