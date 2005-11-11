From: "John Rodriguez" <jr534@columbia.edu>
Subject: RE: Very newbie question...
Date: Fri, 11 Nov 2005 18:16:10 -0500
Message-ID: <000301c5e715$e7a90370$619f3b80@NMAPod505BTLR>
References: <437523A4.6080707@alice.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <437523A4.6080707@alice.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Lorenzo' <lollo_c@alice.it>, linux-assembly@vger.kernel.org

I am still newbie myself, but one thing that I noticed is that you pass some
parameters via registers and others via the stack pointer.

The write sys call takes 3 param (as you prob already know), the file
descriptor (1 = stdout), the pointer to the buffer, and its size.

The write sys call itself is syscall 4.

According to http://asm.sourceforge.net/articles/linasm.html
"For all syscalls, the syscall number goes in %eax. For syscalls that have
less than six args, the args go in %ebx,%ecx,%edx,%esi,%edi in order. The
return value of the syscall is stored in %eax."

Here is my own example that I wrote about a year ago.

section .data
hello   db  'Hello, World!', 0Ah
len     equ $-hello

section .text
global  _start
_start:
mov     edx, len
mov     ecx, hello
mov     ebx, 1
mov     eax, 4
int     80h
mov     ebx, 0
mov     eax, 1
int     80h

-----Original Message-----
From: linux-assembly-owner@vger.kernel.org
[mailto:linux-assembly-owner@vger.kernel.org] On Behalf Of Lorenzo
Sent: Friday, November 11, 2005 6:05 PM
To: linux-assembly@vger.kernel.org
Subject: Very newbie question...

Hi,

i have some problems with my first linux/nasm asm program.
This is a simple "hello world" program but i can't see the "hello world" 
on my screen and i don't find my error.
I work on 64bit amd system.
Someone can illuminate me? :)


Thx

-----------------------------------

section .text
    global   _start

msg   db   'hello, world!',0xa
len   equ   $ - msg

_start:
    push   ebp
    mov   ebp,esp

    push   len
    push   msg
    push   1
    mov   ebx,esp
    mov   eax,4
    int   0x80

    add   esp,12

    mov   ebx,0
    mov   eax,1
    int   0x80
-
To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

