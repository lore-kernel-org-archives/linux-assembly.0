From: "Robert G. Plantz" <plantz@SONOMA.EDU>
Subject: Re: Newbie Question
Date: Thu, 27 Feb 2003 15:42:23 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1EAF5F87-4AAD-11D7-BC68-0030657C1952@sonoma.edu>
References: <200302271757.42990.davidkedrosky@rogers.com>
Mime-Version: 1.0 (Apple Message framework v551)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <200302271757.42990.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; delsp="yes"; charset="us-ascii"; format="flowed"
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: Linux Assembly Programming List <linux-assembly@vger.kernel.org>


On Thursday, February 27, 2003, at 02:57 PM, dAvId KeDrOsKy wrote:

> The following program gives me a seg fault.  But I don't understand  
> why.
>
> 1.	mov	ebx, dword 1234
> 2.	mov	ax, [ebx]
>
> To me the code would mean 1) move the integer 1234 into ebx and then  
> 2) move
> the value of ebx into ax.  But of course my reasoning is incorrect.

Assuming that you want the (16-bit) word at address 1234 to be loaded
into ax, I see two problems:
a. address 1234 probably cannot be accessed by your program, and
b. linux is unhappy if you change ebx. (Your program needs to
    save/restore ebx.)

Bob

------------------------------------------------------------------------ 
---------------
Robert G. Plantz, PhD		| http://www.cs.sonoma.edu/~bob
Sonoma State University		| ph: (707) 664-2806
CS Department			| fax: (707) 664-3012
1801 E. Cotati Avenue		| email: plantz@sonoma.edu
Rohnert Park, CA 94928

