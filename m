From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: How to get allocate memory run time
Date: Wed, 11 Feb 2004 23:24:35 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <48370.5168976032$1076538352@news.gmane.org>
References: <20040211172713.07ca6282.vadiraj@mail.cyberneme.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040211172713.07ca6282.vadiraj@mail.cyberneme.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadiraj C S <vadiraj@mail.cyberneme.com>
Cc: linux-assembly@vger.kernel.org


You have to program you own Malloc function to manage blocks of memory.

You can use stack for variables if enough. 

You can alloate new heap adresses with brk function

Or you can use my memory manager called heap.asm which can be found in 
asmutils package.

Regards

Rudolf

On 
Wed, 11 Feb 2004, Vadiraj C S wrote:

> Date: Wed, 11 Feb 2004 17:27:13 +0530
> From: Vadiraj C S <vadiraj@mail.cyberneme.com>
> To: linux-assembly@vger.kernel.org
> Subject: How to get allocate memory run time
> 
> 
> Hello Everyone!!
> 
>   I was wondering how to allocate memory run time in assembly? till now I used to allocate from c  and
> pass it to the assembly function, and when I looked at the assembly code of small funtion which
> calls malloc, the asm calls malloc internally. 
> 
>   If any one know how to allocate memory in assembly other than calling the extern c funtion..
> 
> Thanks in Advance...
>   
> -- 
> Regards
> Vadiraj C S
> 	
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
