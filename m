From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: Newbie Question
Date: Fri, 28 Feb 2003 00:26:21 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <33887.165253009$1046388490@news.gmane.org>
References: <200302271757.42990.davidkedrosky@rogers.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302271757.42990.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: Linux Assembly Programming List <linux-assembly@vger.kernel.org>



> 
> The following program gives me a seg fault.  But I don't understand why.
> 
> 1.	mov	ebx, dword 1234
> 2.	mov	ax, [ebx]
> 
> To me the code would mean 1) move the integer 1234 into ebx and then 

its OK


2) move the value of ebx into ax.  But of course my reasoning is incorrect.

BAD 1) you cant use opernads of different sizes.

on one side must be 32 on another 32 tooo 

2) operator [ ] is used for referencing into memory,
so you were accessing a memory and thats why the segfault 
(adress 0x1234 of process is onexistent)

if you want to "shorter" 32 bit value to 16 bit then use

mov eax,0  ;xor eax,eax works too
mov ax,bx  ;copy value from BX to AX


Ah dragan you were faster....

Regards

Rudolf



 


> 
> Feedback would be great.
> 
> Dave
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
