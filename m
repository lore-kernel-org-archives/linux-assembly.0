From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Subject: Re: grub thing
Date: Wed, 1 Mar 2006 10:34:11 -0300
Message-ID: <20060301103411.10ac083e.rnsanchez@terra.com.br>
References: <200602222126.57346.thiago.silva@kdemail.net>
	<20060301071033.0c9eb1d4.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060301071033.0c9eb1d4.amerei@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Quoting  Aleph One <amerei@gmail.com>
Sent on  Wed, 1 Mar 2006 07:10:33 +0000

> i'm looking at a disassembly of grub's stage 1. and i wanna know why it
> need's to CLI before setting up the environment?? i tried to interpret it
> line by line and this is what i have so far

I'm not an expert, but interruptions must be disabled.  I believe grub
doesn't install interrupt handlers, and thus a single interrupt would lock
the machine (as the appropriate handler would likely point to garbage).

would the BIOS (or similar in other architectures) give the processor to
the bootloader with interrupts disabled already?

> also, since the origin is at 0000:7c00h i figured that must imply that
> "mov sp, 0x2000" means that the stack starts at 0x7c00+0x2000 = 9c000
> right?

I guess not.  to get what you described, I would do:

	mov sp, 0x2000
	add sp, 0x7c00

from your disassembly, I'd expect SP to be 0x2000, counting from 0x0000.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.
