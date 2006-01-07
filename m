From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Subject: Re: hello again :D
Date: Sat, 7 Jan 2006 01:15:13 -0200
Message-ID: <20060107011513.b8135cf9.rnsanchez@terra.com.br>
References: <20060107110622.65f5623a.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060107110622.65f5623a.amerei@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Quoting  Niel A <amerei@gmail.com>
Sent on  Sat, 7 Jan 2006 11:06:22 +0000

> first, what am i trying to do? i'm trying to replace an instruction with
> a nop.

IIRC, you can't change anything in .text section while running, as it
(AFAIK) will be marked r-xp (read, execute, p I don't know what is).
writing to it would then segfault.

anyone confirm/disagree?

Regards, and happy new year too (Niel and all of you). :)

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.
