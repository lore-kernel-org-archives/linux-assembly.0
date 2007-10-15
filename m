From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: Unable to use a variable in instruction
Date: Sun, 14 Oct 2007 21:45:17 -0400
Message-ID: <4712C62D.70604@verizon.net>
References: <BAY133-W25307FEE9AA1A457394586F5A20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <BAY133-W25307FEE9AA1A457394586F5A20@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: A D <a_d_249@hotmail.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

A D wrote:
> I'm having strange problem accessing a variable in a gnu assembly language program.
> When i write a code:
> 
> .section .data
>    x = 4
> mm:
>    .int 1, 2
> 
> .section .text
> .globl _start
> _start:
>    nop
>    movl x, %ecx   #can't do this 

You're trying to access memory at address 4, not move the immediate 
value 4. Try "movl $x, %ecx".

Best,
Frank

