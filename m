From: Noprianto <opennopri@yahoo.com>
Subject: chdir on linux does not work
Date: Tue, 23 May 2006 19:49:29 -0700 (PDT)
Message-ID: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Dear All,

Anyone can tell me why this chdir code doesnot work on
linux ?

-> from what i read, chdir is system call number 12


section .text
        global _start

_start:
        mov eax, 12
        mov ebx, dir
        int 80h


        mov eax, 1
        mov ebx, 0
        int 80h



section .data
dir:    db      '/bin'



Thanks,
Pri

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
