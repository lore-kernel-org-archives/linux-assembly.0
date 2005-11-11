From: Lorenzo <lollo_c@alice.it>
Subject: Very newbie question...
Date: Sat, 12 Nov 2005 00:05:08 +0100
Message-ID: <437523A4.6080707@alice.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

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
