From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: SMC article
Date: Fri, 06 Aug 2004 11:25:29 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <41134E89.6487ABC9@wp.pl>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linuxassembly@unusedino.de
Cc: linux-assembly@vger.kernel.org

Hi Karsten,

long time ago i had briefly looked at your SMC article placed at
linuxassembly.org but yesterday i opened it once again (by accident) and
read it more careful ;) The code is quite tricky i admire but i have one
small suggestion: you write only about .bss, placing the code in and
execute in it. It gives the illusion that SMC technique can only be used
in .bss. I think you should consider writing something about
un-mprotect-ing .text and doing SMC on it just to avoid this kind of
illusion. Let me illustrate what i mean:

.set PAGE_SZ, 4096
.set PROT_RD, 1
.set PROT_WR, 2
.set PROT_EX, 4

.text

.globl _start
_start:
        mov     $125,%eax         # change protection of code seg...
        mov     $_start,%ebx
        mov     $PAGE_SZ,%ecx
        and     $~(PAGE_SZ-1),%ebx
        mov     $(PROT_RD|PROT_WR|PROT_EX),%edx
        int     $0x80
hello:
        mov     $4,%eax           # write some text...
        mov     $1,%ebx
        mov     $msg,%ecx
        mov     $msglen,%edx
        int     $0x80

        mov     $exit,%esi        # change our "hello" a little bit...
        mov     $hello,%edi
        mov     $(end-exit),%ecx
        rep     movsb

        jmp     hello             # and print it again... ;)
exit:
        mov     $1,%eax
        xor     %ebx,%ebx
        int     $0x80
end:
        msg:    .ascii "hello :)\n"
        msglen  = .- msg
.end


Please consider my suggestion in your future update(s) of the
article. With regards,

-- 
Maciej Hrebien

