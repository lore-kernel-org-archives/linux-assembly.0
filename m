From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Segfault on ioperm
Date: Thu, 20 Jan 2005 19:22:39 +0530
Message-ID: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,

I had been here before, I can't figure out why the code isnt working.

global _start

port equ 378h
stat equ port+1
ctrl equ port+2

section .text
_start:
    
    mov eax,101
    mov ebx,port
    mov ecx,3
    mov edx,port
    int 80h
    mov dx,port
    mov al,0xff
    out 378h,al  <----- segfault here
    mov eax,1
    int 0x80

Any help/ pointers?

Thanks,

Joy.M.Monteiro
-- 
people always turn away,
from the eyes of a stranger...
Afraid to know
what lies behind the stare.......
    --QueensRyche
