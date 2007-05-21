From: Philipp Kohlbecher <pk031698@uni-greifswald.de>
Subject: Re: [PATCH 2.6.21.1] i386: save registers before intra-privilege
 syscall
Date: Mon, 21 May 2007 12:48:42 +0200
Message-ID: <4651790A.2050703@uni-greifswald.de>
References: <20070517220638.GA6532@localhost.localdomain> <464CD44A.5000307@zytor.com> <464CE4CA.8000704@uni-greifswald.de> <464CE653.4020006@zytor.com> <464D64B2.6050104@uni-greifswald.de> <464E2B97.9040205@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <464E2B97.9040205@zytor.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

H. Peter Anvin wrote:
> Sticking kernel mode values in those fields would add no value, except
> as a poison (since %ss == KERNEL_DS and would cause a #GP(0) if it ever
> reached IRET.)  If anything, those fields should be pushed as zero or
> some other poison bits.  That would be slightly better than what's there
> now, which is whatever garbage happens to be on the stack.  Pushing the
> kernel SS:ESP is just plain wrong (not to mention that the way you do it
> doesn't even produce the right value for ESP -- you'd have to save away
> ESP before you push SS.)

That's true. The xss and esp fields of the pt_regs struct always contain
either garbage (for interrupts occuring while in kernel mode) or
user-mode values (for interrupts occuring while in user mode).
So, filling these fields with kernel-mode values indeed doesn't make
much sense.

Allocating space on the stack and poisoning those values would make
sense, though, so I will modify the patch accordingly and resend it.

Thank you for your feedback!

- Philipp Kohlbecher
