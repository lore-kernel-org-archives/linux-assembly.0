From: Peter Barada <pbarada@mail.wm.sps.mot.com>
Subject: Re: wrong opcode?
Date: Fri, 14 Jun 2002 15:06:00 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <aedet0$25f$2@main.gmane.org>
References: <004E42C8.C21188@si.com>
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <004E42C8.C21188@si.com> (kieft_brian@si.com)
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kieft_brian@si.com
Cc: linux-assembly@vger.kernel.org, binutils@sources.redhat.com


>I curious as to why the code generated for these two move.w commands
>is completely different. In the first assembly I used two variables
>(one equal to 0 and the other equal to 8). I tried doing a move using
>the variables added together as my offset to register A1 and managed
>to get 33B9 0000 0000 0170 0000 0008. When I simply put an 8 in
>instead of the variables, I got the correct code. 3379 0000 0000
>0008. Any ideas?????? 
>
>I'm using gnu as on a pc-cygwin system with a m68k target. 
>
>
>3901 034a 0000 0008         .DC.L   C_WCP1_MSG_PARM
> 3902 034e 0000 0000        .DC.L   HWPN_PARM_OFS
> 3903 0352 33B9 0000 MOVE.W SYS_SYS_VERS_W,C_WCP_MSG_PARM+HWPN_PARM_OFS(%A1)
> 3903      0000 0170 
> 3903      0000 0008 
>  
>  
> 
> 3901 034a 0000 0008        .DC.L   C_WCP1_MSG_PARM
> 3902 034e 0000 0000        .DC.L   HWPN_PARM_OFS
> 3904                       
> 3905 0352 3379 0000        MOVE.W  M_SYS_SYS_VERS_W,8(%A1)
> 3905      0000 0008 
> 3906      

From what I see, in the case of 0x33b9, its using mode 6 for the
destination which with the extension word of 0x0170 that
decodes(look at page 2-2 of the MC68000 Family Programmer's Reference
Manual) into a full extension word format where:

D/A = 0
REG = 0
W/L = 0
SCALE = 0
BS = 0
IS = 1
BDSIZE = 3
I/IS = 0

Which means that the index register is suppressed, the base register
is not suppressed, the base displacement size is 32 bits, I/S
indicates that no memory indirection is done(so its not pre-indexed or
post-indexed), so this is equivilent to addressing mode 5 but with a
32 bit displacement instead of the 16 bits that mode 5 supports.

I think that this addressing mode is being picked since the assembler
sees the expression C_WCP_MSG_PARM+HWPN_PARM_OFS and determines that
the resulting expression contains 32 bits of significance(including
all possible relocation) and hence can't stuff it into addressing mode 5.

Check how C_WCP_MSG_PARM and HWPN_PARM_OFS are being declared.  is it
with .equ, or is one of them a label(which requires 32 bits of
significance to allow its relocation anywhere in the 4GB address space)?

Hope this helps...

-- 
Peter Barada                                   Peter.Barada@motorola.com
Wizard                                         781-852-2768 (direct)
WaveMark Solutions(wholly owned by Motorola)   781-270-0193 (fax)
