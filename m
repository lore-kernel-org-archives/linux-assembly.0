From: =?iso-8859-1?Q?=A3ukasz?= <blurrpp@yahoo.com>
Subject: multithreating HOWTO ? :)
Date: Sat, 22 Aug 2009 09:48:08 -0700 (PDT)
Message-ID: <779223.59642.qm@web50307.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1250959688; bh=74pmJVpjb8Sn8TEW4xEbAzW37Mtlgtk04B6waaz55uE=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=UYWIVr7SrVnKwrgf/kzQQJWQbHBCsaahlh4aIGdv8vmxEbjPeRF7wo880fhTTXuSNxH5JpjM/U2DaabcbnesFMcZT1vEbYmo47ZFzGfGUm2W7eCt1geDFLcqpiwfG090GTKdn2kBEFJri/gohJmsX/9LGRzdvXXbNnBOiGxPu/w=
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi All.
I'm trying to start writing multithread programs with assembler (no pthreads), i want to just ask what is wrong in folowing simple code:


.section .data

signal1:
.quad	1

signal2:
.quad	1

x:
.quad	0

y:
.quad	0

.section .text
.globl _start
_start:
    nop
    movq	$2,%rax           # sys_fork
    xorq	%rbx,%rbx
    int		$0x80
    
    cmpq	$0,%rax
    jl		end
    
    cmpq	$0,%rax
    jg		parent            # jump if parent
    

child:
    movq	$100,x
    movq	$0,signal1

1:	
    cmpq	$0,signal2
    jnz		1b
    jmp 	end


parent:
    movq	$100,y
    movq	$0,signal2

1:	
    cmpq	$0,signal1
    jnz		1b            # INF. LOOP ?
    
end:
    movq        x,%rbx
    addq        y,%rby
    movq	$1,%rax
    int		$0x80

Program stacks at parent part in infinite loop waiting for "signal1" change to 0. Anybody knows how to write it properly with using two threads? Thanks in advance.

Lukas


      
