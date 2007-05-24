From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Segmented or Flat model
Date: Wed, 23 May 2007 19:12:29 -0700
Message-ID: <18004.62605.733392.766670@eidolon.muppetlabs.com>
References: <BAY133-F19ABEF1EEAD079FAD786D8F5350@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-F19ABEF1EEAD079FAD786D8F5350@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> I need clarification to a particular gnu assembly question. When i
> write a code:
> 
> .section .data
> output:
>    .int 1
> 
> .section .text
> .globl _start
> _start:
>    movl $output, %ebx
>    ....
> 
> here what type of memory model is used for movl statement(flat or
> segmented)?

I suppose that depends on your target platform. Since you sent this to
linux-assembly, I'm going to assume that the answer is "flat". For all
practical purposes, there is no "segmented" memory model on 32-bit
x86 linux.

> Also how does movl knows which logical address to use? I mean how do
> variables get their logical address?

The linker is generally responsible for assigning actual addresses.
(The assembler can't do this because it doesn't know what other object
files will go into the final executable.)

b
