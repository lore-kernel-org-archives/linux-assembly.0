From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: entering char from keyboard
Date: Mon, 29 Apr 2002 12:04:28 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <aaj62j$13o$2@main.gmane.org>
References: <web-7206429@m1.plasa.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-7206429@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ssams <ssams@telkom.net>
Cc: linux-assembly@vger.kernel.org


Hello,  (its more neutral I guess)

Any program in unix while running has open the file descriptor (handle) 
for STDIN STDOUT and STDERR (0,1,2).
If you want to read from keyboard you just read(stdin)
via a syscall. But may happen that the syscall returns after
pressing ENTER. If you want just read one ahar without (ENTER) confirming 
it, you should change terminal IOCTL.

look in sh.asm in asmutils


        mov     edx,termattrs
        sys_ioctl STDIN,TCGETS
        mov    eax,[termattrs.c_lflag]
        push    eax
        and     eax,~(ICANON|ECHO)  ; this turns OFF echo also
        mov     [termattrs.c_lflag],eax
        sys_ioctl STDIN, TCSETS

this should work under linux, this under *NIX (maybe)

        sys_fcntl STDIN,F_GETFL
        and     eax,~(O_NONBLOCK)       
        sys_fcntl STDIN,F_SETFL,eax

and the rest is smth like read 1 byte from STDIN

Regards

		Rudolf




