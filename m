From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2.6.21.1] i386: save registers before intra-privilege
 syscall
Date: Fri, 18 May 2007 15:41:27 -0700
Message-ID: <464E2B97.9040205@zytor.com>
References: <20070517220638.GA6532@localhost.localdomain> <464CD44A.5000307@zytor.com> <464CE4CA.8000704@uni-greifswald.de> <464CE653.4020006@zytor.com> <464D64B2.6050104@uni-greifswald.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <464D64B2.6050104@uni-greifswald.de>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Philipp Kohlbecher <pk031698@uni-greifswald.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

Philipp Kohlbecher wrote:
>>
>> In other words, your patch doesn't actually fix anything, it *masks*
>> potential bugs which would also be triggered by interrupts in kernel
>> mode.  This is bad.
> 
> I am not sure these potential bugs would also be triggered by interrupts
> in kernel mode. After all, kernel_execve is a special case: It is the
> only case (AFAIK) where a software interrupt is generated while in
> kernel mode (intra-privilege interrupt), but (if all goes right) the
> iret "returns" to user mode (inter-privilege return).
> 
> This iret will pop the ss and esp registers off the stack, so
> start_thread (include/asm-i386/processor.h:444) needs to put the correct
> values in these stack positions, which it does.

Yes, and it *BETTER*, because those are user-mode values which refer to
the newly created task.

Sticking kernel mode values in those fields would add no value, except
as a poison (since %ss == KERNEL_DS and would cause a #GP(0) if it ever
reached IRET.)  If anything, those fields should be pushed as zero or
some other poison bits.  That would be slightly better than what's there
now, which is whatever garbage happens to be on the stack.  Pushing the
kernel SS:ESP is just plain wrong (not to mention that the way you do it
doesn't even produce the right value for ESP -- you'd have to save away
ESP before you push SS.)

	-hpa

