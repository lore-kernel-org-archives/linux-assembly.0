From: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Subject: Re: Mixing C and assembly
Date: Thu, 6 Mar 2003 21:05:58 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200303062105.58355.davidkedrosky@rogers.com>
References: <200303052350.00680.davidkedrosky@rogers.com> <15974.54476.436663.588809@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <15974.54476.436663.588809@eidolon.muppetlabs.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

I fixed up the assembly code by taking out the underscores before asm_func but 
I still get a linking error "main.c: undefined reference to asm_func"

Does anybody know why this could be occuring?

Thanks again, 

Dave

On March 5, 2003 11:55 pm, Brian Raiter wrote:
> > The error I am getting when I try to run the program in KDevelop (which
> > uses gcc) is:
> > main.c: undefined reference to `asm_func'
>
> That's right. There is no asm_func symbol.
>
> > section         .text
> >
> > global _asm_func
> >
> > _asm_func:
>
> The practice of silently appending an underscore to exported C symbols
> is not done in the Unix world, in general. Export the same symbol you
> import.
>
> b
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

