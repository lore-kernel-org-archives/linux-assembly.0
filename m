From: Kircsi Tibor <tkircsi@gmail.com>
Subject: Current break round up
Date: Tue, 30 Sep 2008 21:26:24 +0200
Message-ID: <1222802784.8421.10.camel@kirilla-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:content-type
         :date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=kvwFAsKni2KZF2dY7lOzCvjB2J7+KJJzdeR2yNSiENc=;
        b=ufjXoBfUFpc4wk01Plc+sRWjrfokAWUUvstNDSmPYmQdfWCU5JLu+gy9HrHk6LdV+K
         4o7VmIluIj3wCEF60z6zzrUkd6WnfHtL0rrCoMQX9J4Qjhmw9a4OgaO5lmujL/q7qcMV
         EXpAI6L1Ss5/UNf59OKcQYzK0M8T31CodyQFs=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,

Sorry for my english. I started learn assembly again after 15 years.
Now, I'm learning about memory management and sys_brk system call. I've
created a really simple program, which try to extend the heap size. I've
read, when sys_brk is called with the new break address(last usable
address of the heap or data segment), it will be rounded up to the next
nearest page, but it didn't. Am I misundestand somthing?

# meminf.s
# 2008.09.25.
# PURPOSE: Test current_break address round up at sys_brk call

.include "../sharedlibs/linux.s"

.section .text
        .globl  _start
_start:
        movl    %esp, %ebp

        movl    $0, %ebx                # %ebx = 0, get the current
curret_break
        movl    $SYS_BRK, %eax
        int     $INT                    # %eax = address of
current_break

        addl    $0x1002, %eax           # add 4098 to current
current_break
        movl    %eax, %ebx              # %ebx = the address of the new
current_break
        movl    $SYS_BRK, %eax
        int     $INT

        movl    $0, %ebx                # set the return value of the
program
        movl    $SYS_EXIT, %eax
        int     $INT

regards,
Kiri


