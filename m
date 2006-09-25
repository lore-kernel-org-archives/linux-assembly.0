From: Ed Reed <ed.reed@aesec.com>
Subject: Question about entry.S RESTORE_REGS macro
Date: Mon, 25 Sep 2006 12:26:38 -0400
Message-ID: <4518033E.7080903@aesec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

I'm looking at the entry / exit routines to the kernel in 
arch/i386/kernel/entry.S, and at the entry conditions for 
ret_from_fork() that is also defined there....

And looking at the assembler macro defined at the top of the file, 
RESTORE_REGS, I'm trying to figure out what the ELF section stuff is 
doing there - have you a clue, or a pointer you give me as to whom to 
ask?  I don't THINK it's relevant to my current efforts, but I'd like to 
understand what's going on.

code:

#define SAVE_ALL \
       cld; \
       pushl %es; \
       pushl %ds; \
       pushl %eax; \
       pushl %ebp; \
       pushl %edi; \
       pushl %esi; \
       pushl %edx; \
       pushl %ecx; \
       pushl %ebx; \
       movl $(__USER_DS), %edx; \
       movl %edx, %ds; \
       movl %edx, %es;

#define RESTORE_INT_REGS \
       popl %ebx;      \
       popl %ecx;      \
       popl %edx;      \
       popl %esi;      \
       popl %edi;      \
       popl %ebp;      \
       popl %eax

#define RESTORE_REGS    \
       RESTORE_INT_REGS; \
1:      popl %ds;       \
2:      popl %es;       \
.section .fixup,"ax";   \
3:      movl $0,(%esp); \
       jmp 1b;         \
4:      movl $0,(%esp); \
       jmp 2b;         \
.previous;              \
.section __ex_table,"a";\
       .align 4;       \
       .long 1b,3b;    \
       .long 2b,4b;    \
.previous


The SAVE_ALL and RESTORE_INT_REGS seem pretty straight forward, but in 
RESTORE_REGS, are the two section entries and labels creating relocation 
entries for the popl %ds and %es instructions?

Newbie question, I suppose, but that's the only think I can see that 
would make sense, and don't know who else to ask.


