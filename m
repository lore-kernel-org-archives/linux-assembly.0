From: Blake McBride <blake@arahant.com>
Subject: Re: Need help doing a jmp rather than a call
Date: Sat, 9 Nov 2013 10:19:52 -0600
Message-ID: <l5lnau$mpa$1@ger.gmane.org>
References: <l5k8kk$9kd$1@ger.gmane.org> <CAN0_x-KsbCkp7EEasjN7UFvKR5itJ65+7RCDK2x9vxr0ji0H0g@mail.gmail.com> <l5kra0$aj2$1@ger.gmane.org> <CAN0_x-KEFpmEKzAsAUKAYhGTP4QbMpBCQvwXCq9Hhit95TnwnA@mail.gmail.com> <CAN0_x-Jt-PJQeNHTbYACafxOHjSJN_3_BAZj5UbLo2dcns27aw@mail.gmail.com> <l5lftf$c89$1@ger.gmane.org> <20131109144246.GD5152@jeffraw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

On 2013-11-09 08:42:46 -0600, Rob said:

> On Sat, Nov 09, 2013 at 08:13:13AM -0600, Blake McBride wrote:
> 
> So forget that, the other approach is to manually forward the registers.
> This is roughly what optimised disassembly of the above forward function
> would look like, if you got gcc to tail-call and not do any frame setup.
> 
> .globl forward
> forward:
> 	// any free register that's not preserved across calls
> 	movq %rdi, %r10
> 
> 	// forward call registers
> 	movq %rsi, %rdi
> 	movq %rdx, %rsi
> 	movq %rcx, %rdx
> 	movq %r8, %rdx
> 	movq %r9, %r8
> 
> 	// return address is at (%rsp), so we can just jump
> 	jmp *%r10
> 
> 
> HTH,
> Rob


I corrected your small %rdx typo above and tried the following.  It 
doesn't work either though.  Knowing what I know now though, you must 
be close.

.globl __jumpToMethod
__jumpToMethod:
LFB2:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	movl	$0, %eax
//	call	*%rdi
//	leave
//	ret
	// any free register that's not preserved across calls
	movq %rdi, %r10

	// forward call registers
	movq %rsi, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	movq %r8, %rcx
	movq %r9, %r8

	// return address is at (%rsp), so we can just jump
	jmp *%r10



