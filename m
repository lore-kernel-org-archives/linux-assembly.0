From: dante@virtualblueness.net
Subject: How to set up struct pt_regs in assembly?
Date: Thu, 21 Aug 2003 20:24:56 -0400 (EDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0308212010480.6588-100000@reddevil.virtualblueness.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Hi everyone,

I'm having some problems writing the assembly code to set up the eax, 
ebx, ecx and edx registers for a int 0x80 call to sys_execve on 2.4 
kernels.  In C, the function is defined as int sys_execve(struct pt_regs 
regs) where struct pt_regs is defined in <asm/ptrace.h>.  I don't know 
what to put into eax-edx to get (struct pt_regs regs) right.

In 2.2 it was easy, you just did (in nasm):


; int sys_execve(const char *filename, char const argv[], char const envp[]
%macro execve 3     
        mov ebx,%1  ; ptr to null terminated string containing program
        mov ecx,%2  ; ptr to null terminated string of arguments
        mov edx,%3  ; ptr to null terminated string of environment
        mov eax,11
        int 0x80
%endmacro

global _start
section .data
        shell   db "/bin/sh",0
        nothing db 0

section .text
_start: execve shell, nothing, nothing



What is the equivalent for 2.4 kernels?

-------------------------------------------------------------------

Anthony G. Basile, Ph.D.
Director of Information Technology,
D'Youville College,
320 Porter Ave.
Buffalo NY, 14201

Work: (716) 881-8197 (voicemail)


