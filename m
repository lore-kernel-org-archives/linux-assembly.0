From: Allan Wooley <awooley@exeter.edu>
Subject: chdir command
Date: Fri, 03 May 2002 15:55:00 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3CD2EB13.31635C91@exeter.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly <linux-assembly@vger.kernel.org>

I can not get system call #12 to work as advertised.  In Read Hat Linux
7.2 under bash using nasm with elf I write:

section .text
    global _start

path    db '/root',0

_start:

    mov ebx, path
    mov eax,12
    int 80h

    mov eax, 1
    int 80h        ;; int 0x80

Although I have gotten system calls 1, 3-6 & 11 to work fine in assembly
programs, I can not get the change-working-directory call to work.

Thanks, Al (awooley@exeter.edu)

