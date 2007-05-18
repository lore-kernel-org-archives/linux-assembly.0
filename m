From: Philipp Kohlbecher <pk031698@uni-greifswald.de>
Subject: Re: [PATCH 2.6.21.1] i386: save registers before intra-privilege
 syscall
Date: Fri, 18 May 2007 10:32:50 +0200
Message-ID: <464D64B2.6050104@uni-greifswald.de>
References: <20070517220638.GA6532@localhost.localdomain> <464CD44A.5000307@zytor.com> <464CE4CA.8000704@uni-greifswald.de> <464CE653.4020006@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <464CE653.4020006@zytor.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

H. Peter Anvin wrote:
> Philipp Kohlbecher wrote:
>> (This may be superfluous, but I don't think it hurts and it might
>> prevent future errors.)
> 
> ... and it may *cause* future errors by making it harder to find bugs, too.
> 
> In other words, your patch doesn't actually fix anything, it *masks*
> potential bugs which would also be triggered by interrupts in kernel
> mode.  This is bad.

I am not sure these potential bugs would also be triggered by interrupts
in kernel mode. After all, kernel_execve is a special case: It is the
only case (AFAIK) where a software interrupt is generated while in
kernel mode (intra-privilege interrupt), but (if all goes right) the
iret "returns" to user mode (inter-privilege return).

This iret will pop the ss and esp registers off the stack, so
start_thread (include/asm-i386/processor.h:444) needs to put the correct
values in these stack positions, which it does.

Now, my point is that, when start_thread gets called at the end of a
successful kernel_execve, these stack positions cannot contain what they
are supposed to contain and no space is allocated on the stack for these
register values, so that something else gets overwritten.

It would seem cleaner to handle this special case differently by making
sure that the stack is set up the way it would be for an inter-privilege
interrupt.

- Phil Kohlbecher
