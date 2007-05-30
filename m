From: "A D" <a_d_249@hotmail.com>
Subject: Segment override and lldt instruction
Date: Wed, 30 May 2007 18:31:22 -0400
Message-ID: <BAY133-F19BE8DCF3804887322DF21F52E0@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi! I have couple of questions regarding gnu assembly. I've heard the word
segment override. Where segment register can be manually overriden. so how 
can i
override say ds register? can segment register be overriden to my preferred
memory address location?

mov $0xf800, %ax
mov %ax, %es
mov %ds, %bx

But I get segmentation fault error. How can i do it without error?

Also I was looking at the function of lldt instruction. The manual says 
that:
"The source operand (a general-purpose register or a memory location)
contains a segment selector that points to a local descriptor table (LDT)."

How can one make segment selector point to ldt?

Thanks for your time.

_________________________________________________________________
New Windows Live Hotmail is here. Upgrade for free and get a better look. 
www.newhotmail.ca?icid=WLHMENCA150

