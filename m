From: Justinas <justinas@patikimi.lt>
Subject: Re: Access to Program Counter in C
Date: Fri, 19 Nov 2004 10:03:00 +0200
Message-ID: <20041119100300.731ff5ed@biesas.adminas.net>
References: <90db62064205.419d30cd@usc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <90db62064205.419d30cd@usc.edu>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: siddharth vora <sjv@usc.edu>
Cc: sandeep <sandeep@codito.com>, A M <alim1993@yahoo.com>, linux-c-programming@vger.kernel.org, linux-assembly@vger.kernel.org

On Thu, 18 Nov 2004 23:31:25 -0800
siddharth vora <sjv@usc.edu> wrote:

> 
> Try :
> 
>  Call ($+5)
>   pop ebp

yes, something like that.
In x86(DOS) when u do a call to near function(near, that means program don't change a code segment(CS) register) processot does something like this:
	mov	sp,sp-2
	mov	[sp],ip (next executable ip)

when call'e ret executed processor does:
	mov	ip,[sp]
	mov	sp,sp+2

so, you inscruction after call should be
	call <some function>
	mov  [ipdrr], sp-2
you'll get the IP if this instuction;]
I think u got the idea, look for call inctruction execution inside cpu for more details. I whote here with intension that cpu's word is 2B;]

_
Justinas Gulbinas
justinas@patikimi.lt
