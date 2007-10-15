From: A D <a_d_249@hotmail.com>
Subject: RE: Unable to use a variable in instruction
Date: Mon, 15 Oct 2007 09:31:15 -0400
Message-ID: <BAY133-W14EA2427AD0504DAF767F5F5A30@phx.gbl>
References: <BAY133-W25307FEE9AA1A457394586F5A20@phx.gbl>
 <1192413717.5651.4.camel@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1192413717.5651.4.camel@ubuntu>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>


>A D wrote:
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
>
>
>
>


Kotler wrote: 
>>You're trying to access memory at address 4, not move the immediate 
>>value 4. Try "movl $x, %ecx".
>>
>>
>>


Plantz wrote:
>>So this instruction:
>>    movl x, %ecx   #can't do this 
>> 
>>is trying to move the 4 bytes stored at memory location 4 into the ecx
>>register. As the OS told you, you cannot do that.
>> 
>>The way to allocate an initialized 32-bit int in the .data section is:
>> 
>>x:     .long  4
 

This problem is resolved now. Thanks for clarifying this.

--DC

_________________________________________________________________
Send a smile, make someone laugh, have some fun! Start now!
http://www.freemessengeremoticons.ca/?icid=EMENCA122