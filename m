From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: GCC Optimization?
Date: Mon, 22 Nov 2004 17:06:06 -0800
Message-ID: <16802.36094.728820.244374@eidolon.muppetlabs.com>
References: <2462.1101169594@www25.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <2462.1101169594@www25.gmx.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> But why do they use and .... I think and does only even %esp
> so that the last 4 Bits are set to Zero. 
> But if %esp was 0xcccccccc before it would now be 0xccccccc0
> what happens to the 4 Bits from 0xccccccc0 to 0xcccccccc?
> And what is this good for?

The x86 push and pop instructions are much, much less efficient if the
stack pointer is not dword-aligned. So if one function (say) pushes a
segment register onto the stack, it can affect the performance of
every function that is called from there.

> Second question:
> What does mov $0x0,%eax? Why dont they use xor %eax and what is it
> good for?

It zeros the accumulator, of course. As for why they don't use xor,
why should they? What would be the advantage?

> Third question: 
> What is sub %eax,%esp good for? We subtract 0 from
> esp... mmmhh... for what?

Did you try building the same code with gcc optimizations turned on?

b
