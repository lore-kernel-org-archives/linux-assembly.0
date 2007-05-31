From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: Segment override and lldt instruction
Date: Wed, 30 May 2007 20:45:58 -0400
Message-ID: <465E1AC6.2020906@verizon.net>
References: <BAY133-F19BE8DCF3804887322DF21F52E0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <BAY133-F19BE8DCF3804887322DF21F52E0@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: A D <a_d_249@hotmail.com>
Cc: linux-assembly@vger.kernel.org

A D wrote:
> Hi! I have couple of questions regarding gnu assembly. I've heard the word
> segment override. Where segment register can be manually overriden. so 
> how can i
> override say ds register? can segment register be overriden to my preferred
> memory address location?
> 
> mov $0xf800, %ax
> mov %ax, %es
> mov %ds, %bx
> 
> But I get segmentation fault error. How can i do it without error?

Use a valid selector. You appear to have "heard about" some 16=bit real 
mode stuff that is not true in protected mode. Take a look here:

http://my.execpc.com/~geezer/johnfine/segments.htm

In "Linux assembly", there is no reason you'd *want* to use a segment 
override, or alter a segment register.

> 
> Also I was looking at the function of lldt instruction. The manual says 
> that:
> "The source operand (a general-purpose register or a memory location)
> contains a segment selector that points to a local descriptor table (LDT)."
> 
> How can one make segment selector point to ldt?

"lldt ax" or "lldt [mem]" (16-bits)... I guess. But why? The limit is 
0xffffffff and the base is 0. (Windows uses fs in a way that might be 
"interesting"..._

If you're developing your own OS (using Linux), starting from a 
bootsector - or GRUB - these instructions might be useful, but for 
"Linux assembly", forget that segment registers exist! (and be glad! :)

Best,
Frank

