From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: How to get allocate memory run time
Date: Thu, 12 Feb 2004 06:00:43 +0000 (GMT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040212060043.13155.qmail@web41115.mail.yahoo.com>
References: <20040212093930.39dcba89.vadiraj@mail.cyberneme.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040212093930.39dcba89.vadiraj@mail.cyberneme.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>, Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

Hi !

  brk and sbrk are system calls are just interfaces 
to the kernel implementation . 

  To invoke system calls through assembly ,
look at 

http://world.std.com/~slanning/asm/syscall_list.html

SNo. 45

  Google / check the mailing list archives for 
sample examples of invoking system calls from 
assembly .

Cheers !

 --- Vadiraj C S <vadiraj@mail.cyberneme.com> wrote: >

> Mr Brian,
> 
> > libc's malloc et al work by using the brk system
> call (#45 in Linux).
> 
>   I know the implementation of malloc, using brk
> this is again a C implementation, What is the
> procedure
> behind it, I mean how can this be done in assembly
> language. I dont want to call the extern functions
> from
> asm. There would be some kind of asm implementation
> which does exactly what brk and sbrk does. I just
> want 
> to know them.
> 
>   Thanks
>   
> -- 
>                        With knowledge comes power,
> and with power comes responsability.  
> 
> 
> With Best Regards
> Vadiraj C S
> 
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
http://vger.kernel.org/majordomo-info.html 

________________________________________________________________________
Yahoo! India Education Special: Study in the UK now.
Go to http://in.specials.yahoo.com/index1.html
