From: =?ISO-8859-9?Q?erg=FCn_koray?= <ergky@tnn.net>
Subject: programming bug
Date: Fri, 16 Jan 2004 15:21:15 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <4007E54B.7080306@tnn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

hi there,
i am new to assembly and i have written just this tiny code that turns 
lowercase characters to uppercase.
but unfortunately after the first characters have been converted the 
program exits, and i can't find why ?
can anybody help me ? thanks

.data
        chr:    .byte
.text
        .global _start
_start:
read:
        movl $3, %eax   /* read */
        movl $1, %ebx   /* from stdin */
        movl $chr, %ecx /* to chr */
        movl $1, %edx   /* 1 char */
        int $0x80       /* using int 0x80 */

        xorl %eax, %eax /*eax = 0 */
        xorl %ebx, %ebx /*eax = 0 */
        xorl %edx, %edx
        xorl %ecx, %ecx
check:
        movb chr, %al
        cmpb $'a', %al
        jl endprog
        cmpb $'z', %al
        jg endprog

        xorl %eax,%eax


convert:
        movb chr, %al   /* al <- chr */
        subb $'a' , %al /* Convert small letter */
        addb $'A', %al  /* to capital */
        movb %al, chr   /* write converted char to memory */

write:
        movl $4, %eax   /* write */
        movl $1, %ebx   /* to screen */
        movl $chr, %ecx /* from chr */
        movl $1, %edx   /* 1 char */
        int $0x80       /* using int 0x80 */
        xorl %eax, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        jmp read

endprog:


        movl $1, %eax   /* exit sys call */
        movl $0, %ebx   /* exit value   */
        int $0x80       /* call int */

