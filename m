From: Slack Traq <slacktraq@yahoo.com>
Subject: Re: Newbie Question
Date: Thu, 27 Feb 2003 16:27:09 -0800 (PST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030228002709.27101.qmail@web11404.mail.yahoo.com>
References: <200302271757.42990.davidkedrosky@rogers.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302271757.42990.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: Linux Assembly Mailing List <linux-assembly@vger.kernel.org>


--- dAvId KeDrOsKy <davidkedrosky@rogers.com> wrote:
> The following program gives me a seg fault.  But I
> don't understand why.
> 
> 1.	mov	ebx, dword 1234
> 2.	mov	ax, [ebx]
> 
> To me the code would mean 1) move the integer 1234
> into ebx and then 2) move 
> the value of ebx into ax.  But of course my
> reasoning is incorrect.

First of all, if you need to pass an integer to ebx
(32 bit register) you may wanna to do
1. mov     ebx, 1234
Second, if you put the brackets between a register,
its memory address is passed to ax, in this case.
Third, you can't move a 32 bit register into a 16 bit
one. Use eax, instead.
2. mov     eax, ebx
Advice: you can decompose a 32 bit register, ie eax,
in ax. Then you can decompose ax in ah and al (8 bit
registers).
If hope it will help you.
> 
> Feedback would be great.
> 
> Dave
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
http://vger.kernel.org/majordomo-info.html

Regards,

                                            Slack

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/
