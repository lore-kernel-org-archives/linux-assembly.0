From: Rob <robpilling@gmail.com>
Subject: Re: Need help doing a jmp rather than a call
Date: Sat, 9 Nov 2013 14:42:46 +0000
Message-ID: <20131109144246.GD5152@jeffraw>
References: <l5k8kk$9kd$1@ger.gmane.org>
 <CAN0_x-KsbCkp7EEasjN7UFvKR5itJ65+7RCDK2x9vxr0ji0H0g@mail.gmail.com>
 <l5kra0$aj2$1@ger.gmane.org>
 <CAN0_x-KEFpmEKzAsAUKAYhGTP4QbMpBCQvwXCq9Hhit95TnwnA@mail.gmail.com>
 <CAN0_x-Jt-PJQeNHTbYACafxOHjSJN_3_BAZj5UbLo2dcns27aw@mail.gmail.com>
 <l5lftf$c89$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=qmgWQ11n85TN7NviA9YTFPJqzsjri2R8li5GMg1oWZo=;
        b=X+lMJk1mNljcgJXtR09lfWtIn2ZwNjBT0TQSsiO0mbpvogz8r49282Oq2nCJFp+G8x
         4blV6j5dzZMoCQeVeH7VfcaIA9vT8ZdYKxEKjQZwIWieN/2tkfRnxtzdB3+NWCHsXh3f
         1uNA/an0uFiYEwvWpNdxWk9R18+d3VVo7vGcIDHwt9vtS2ArxaxNb1USjO0f4Ln+xBg8
         TBHym3lTpF1XNR3nZZvFu6mO9O79+zTqOnl3oxXdfdSevYGgub93J5zHBu6ihZsssjmI
         paL7rXteATntHaeEZRIbLrX/aCSyXfLnNlGmXvrn+8c5CX4zuFSLTb1clqF3qDKg2Zbn
         y6iA==
Content-Disposition: inline
In-Reply-To: <l5lftf$c89$1@ger.gmane.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Blake McBride <blake@arahant.com>
Cc: linux-assembly@vger.kernel.org

On Sat, Nov 09, 2013 at 08:13:13AM -0600, Blake McBride wrote:
> I spent a few hours on the 64 bit stuff with no success.  I checked
> on the Internet and found that the parameter passing style for x64
> is to pass the first 6 arguments in registers.  Argumens are passed
> in order:
>
> ...
>
> This means you can't simply adjust the stack pointer.  When I ran it
> through a debugger I saw that, in fact, the aruments have shifted
> the registers they use becasue of the additional function layer.
>
> ...
>
> I can't disassemble fun4 becasue fun4 is often a different function
> with vastly different arguments and different return types.
> Remember in C you can pass around a pointer to a function all you
> want and execute it with different arguments at different times (so
> long as it is typecast and the cast matches the function signature).
> C does it without knowing the specifics becasue it does know the
> standard agreement between caller and callee.
>
> This has got to be the most trivial piece of code possible.  I am
> just not an assembler programmer, and I already know more about this
> than I want to.

You need to move the parameters around. So from C, an example would look
like this:

void land(int a, int b)
{
	/* ... */
}

void forward(void (*f)(int, int), int a, int b)
{
	f(a, b); /* rsi -> rdi, rdx -> rsi */
}

So there's a few ways to do this. You could use __attribute__((naked)),
except I don't think it's valid on x86_64 (I'm using gcc 4.7.2).

So forget that, the other approach is to manually forward the registers.
This is roughly what optimised disassembly of the above forward function
would look like, if you got gcc to tail-call and not do any frame setup.

.globl forward
forward:
	// any free register that's not preserved across calls
	movq %rdi, %r10

	// forward call registers
	movq %rsi, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	movq %r8, %rdx
	movq %r9, %r8

	// return address is at (%rsp), so we can just jump
	jmp *%r10


HTH,
Rob
