From: Joshua Roys <TheReader06@comcast.net>
Subject: Re: sources of linux 'system call'
Date: Thu, 13 Sep 2007 14:47:37 -0400
Message-ID: <46E985C9.1020909@comcast.net>
References: <248508.35182.qm@web50302.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <248508.35182.qm@web50302.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lukas <blurrpp@yahoo.com>
Cc: linux-assembly@vger.kernel.org

Lukas wrote:
> Thank You for answer ... i'll read this sources ...
> but actualy i want to know what instructions processor
> recive after int. My goal is to understand better GDT,
> IDT, LDT in Linux, i want to know what's going on when
> i call for example 125 system call (sys_mprotect)
> whitch allow me change acces rights to given memory
> area. Theory i know ( almost everything is writen in
> Intel guides ) but i need practice. By the way if
> smoebody knoe how to change acces rigts to memory
> without system calls, please help :)
> 
> regards
> Lukas

Hello,

Take a look at (for i386): arch/i386/kernel/entry.S
Then find a line like: ENTRY(system_call)
That gets set in the IDT in: arch/i386/kernel/traps.c, near the end of
function trap_init()
Specifically: set_system_gate(SYSCALL_VECTOR, &systen_call), where
SYSCALL_VECTOR is defined to be 0x80
And: include/asm-i386/desc.h has some items that may be of interest to you.

Good luck,

Joshua Roys
