From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Unable to use a variable in instruction
Date: Sun, 14 Oct 2007 19:01:57 -0700
Message-ID: <1192413717.5651.4.camel@ubuntu>
References: <BAY133-W25307FEE9AA1A457394586F5A20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-W25307FEE9AA1A457394586F5A20@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A D <a_d_249@hotmail.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>


On Sun, 2007-10-14 at 19:37 -0400, A D wrote:
> I'm having strange problem accessing a variable in a gnu assembly language program.
> When i write a code:
> 
> .section .data
>    x = 4

This is equivalent to writing
        .equ  x,4

> mm:
>    .int 1, 2
> 
> .section .text
> .globl _start
> _start:
>    nop

So this instruction:
>    movl x, %ecx   #can't do this 

is trying to move the 4 bytes stored at memory location 4 into the ecx
register. As the OS told you, you cannot do that.

The way to allocate an initialized 32-bit int in the .data section is:

x:     .long  4


