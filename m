From: Dragan Stancevic <visitor@xalien.org>
Subject: Re: Newbie Question
Date: Thu, 27 Feb 2003 15:19:52 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302271519.52122.visitor@xalien.org>
References: <200302271757.42990.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302271757.42990.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>, Linux Assembly Programming List <linux-assembly@vger.kernel.org>

On Thursday 27 February 2003 14:57, dAvId KeDrOsKy wrote:
> The following program gives me a seg fault.  But I don't understand why.
>
> 1.	mov	ebx, dword 1234
> 2.	mov	ax, [ebx]
>
> To me the code would mean 1) move the integer 1234 into ebx and then 2)
> move the value of ebx into ax.  But of course my reasoning is incorrect.

You are trying to apply indirection to ebx, failing while trying to read from 
a memory location that is not accessible to your process.

Drop the brackets, and also you probably want eax, right?

-- 
Peace can only come as a natural consequence
of universal enlightenment. -Dr. Nikola Tesla
