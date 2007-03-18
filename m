From: Henio Paszczak <blurrpp@yahoo.com>
Subject: self modyfing code and GDT
Date: Sun, 18 Mar 2007 10:48:48 -0700 (PDT)
Message-ID: <186179.43467.qm@web50310.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org


> Hi.
> 1) I want to write self modyfing code. I'm using 125
> finction (sys_mprotect )
> 
> .section .text
>     
> .global _start
> _start:
> 	nop
> 	movl $125,%eax
> 	movl $smc_address,%ebx
> 	movl $4096,%ecx
> 	movl $7,%edx
> 	int $0x80
> 
> 	orl  %eax, %eax
> 	jnz .error	# if something wrong
> 
> 	movl $0xaabbccdd,smc_address
> 
> 	movl $0x0000000000,%eax
> .equ smc_address, .-4
> 
> 	# eax==0xaabbccdd
> 
>  .error:
> 	movl $1,%eax
> 	movl $0,%ebx
> 	int $0x80
> 
> but it doesn't work ( %eax=0 ). 
> Is there any other way by changing segment
> descriptor
> in GDT ?, and how to do this ( i have no rights to
> write it ).
> 
> 2) How to read 8-bytes of segment descriptor, how to
> get current segment selector and the same question
> about task-state segment ( selector is easy to
> obtain
> by 'str' instruction )
> Thank You in advice for help
> Lukas



 
____________________________________________________________________________________
Expecting? Get great news right away with email Auto-Check. 
Try the Yahoo! Mail Beta.
http://advision.webevents.yahoo.com/mailbeta/newmail_tools.html 
