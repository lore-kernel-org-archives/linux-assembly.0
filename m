From: Jani Monoses <jani@iv.ro>
Subject: Re: BIOS interrupts
Date: Thu, 18 Apr 2002 11:06:21 +0300 (EEST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33L2.0204181104430.615-100000@cow>
References: <3CBE785D.6040408@zeta.org.au>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3CBE785D.6040408@zeta.org.au>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilson Fletcher <mgpl1@zeta.org.au>
Cc: linux-assembly@vger.kernel.org

Look at how XFree86 calls int10.I think sys_vm86 (or something named like
that)

On Thu, 18 Apr 2002, Wilson Fletcher wrote:

>
> Can someone point me to some references re: how to call BIOS interrupts
> in Linux ?
>
> I don't want 1000 messages telling me it can't be done. I know that
> Linux doesn't support the bios interrupts as it stands.
>
> Specifically 15h on a Toshiba laptop ( if your interested :-) )
>
> Thanks,
>
> Wilson Fletcher
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

