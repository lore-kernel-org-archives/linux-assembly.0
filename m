From: "A D" <a_d_249@hotmail.com>
Subject: Re: Segmented or Flat model
Date: Wed, 23 May 2007 23:01:09 -0400
Message-ID: <BAY133-F13206F74E0BF11906D203CF5340@phx.gbl>
References: <18004.62605.733392.766670@eidolon.muppetlabs.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <18004.62605.733392.766670@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: breadbox@muppetlabs.com, linux-assembly@vger.kernel.org

First of all thanks for your reply.

>I need clarification to a particular gnu assembly question. When i
>write a code:
>
>.section .data
>output:
>    .int 1
>
>.section .text
>.globl _start
>_start:
>    movl $output, %ebx
>    ....
>
>here what type of memory model is used for movl statement(flat or
>segmented)?
>
>
>>Brian Raiter wrote:
>>I suppose that depends on your target platform. Since you sent this to
>>linux-assembly, I'm going to assume that the answer is "flat". For all
>>practical purposes, there is no "segmented" memory model on 32-bit
>>x86 linux.

correct me if i'm wrong. But what I understand are you saying that x86 linux
doesn't use segmented memory model. Are you sure?(i could be wrong in
understanding sorry) Because I'm reading the book "Understanding Linux 
Kernel"
and the author is saying that linux uses segmented memory model. I wasn't 
sure
whether linux uses seg model by default so i asked the question.

Again thanks.

_________________________________________________________________
Windows Live Hotmail. Now with better security, storage and features.  
www.newhotmail.ca?icid=WLHMENCA149

