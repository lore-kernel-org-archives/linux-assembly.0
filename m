From: Jack Dennon <jdennon@seasurf.net>
Subject: Re: int 16 ?
Date: Fri, 14 Feb 2003 12:10:50 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3E4D4D4A.9D5A139@seasurf.net>
References: <200302140023.23837.davidkedrosky@rogers.com>
Reply-To: jdennon@seasurf.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: linux-assembly@vger.kernel.org

When the PC boots up, the BIOS sets up an interrupt vector
table at 0000:0000 with int 0x16 pointing into the BIOS keyboard
driver. Linux uses this same vector table to access BIOS disk
routines that are used for booting the system. Linux then sets up
its own interrupt vector table and switches into protected mode.
None of the original BIOS interrupts are then available, nor
are they needed. There are several ways to read a single character
at a time. One of the easier ways is provided by the curses
library. Get on Amazon and look at the programming books
by Matthew & Stones, and maybe even by J. Dennon.


dAvId KeDrOsKy wrote:

> I was told there exists int 0x16, which can be used to read a single character
> at a time.  Does this interrupt exist in Linux and if so, where can I find
> some documentation on it?
>
> Thanks,
>
> Dave
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



