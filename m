From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: inside_SUB
Date: Thu, 19 Sep 2002 14:24:25 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D89C1F9.7D3DA7@wp.pl>
References: <web-50089505@m1.plasa.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

ssams wrote:
> 
> thanks for your replay
> this is make me learning more.
> But when i try to try, i found a new problem when i try to
> read
> the value from ecx after doing syscall read.
> mov $3,%eax
> mov $0,%ebx
> mov $6,%edx
> 
> how can i read input from this code and reprinting it...?
> for example output:
> Enter e number: 4       #we enter 4
> you have number: 4      #reprinting
> 
> help me please
> regard
> ssams

.data

char: .byte 0

.text

.globl _start
_start:
	mov $3,%eax
	xor %ebx,%ebx
	mov $char,%ecx
	mov $1,%edx
	int $0x80

	mov $4,%eax
	inc %ebx
	int $0x80

	mov $1,%eax
	int $0x80

Regards,

PS I recommend to read some tutorial(s) on how to write assembly code
useing Linux's calls.

-- 
Maciej Hrebien

