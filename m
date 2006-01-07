From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Subject: Re: hello again :D
Date: Sat, 7 Jan 2006 01:17:38 -0200
Message-ID: <20060107011738.938c4239.rnsanchez@terra.com.br>
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

> _start:
>         xor ebx, ebx
>         mov byte [t1], 0x90
> 
> t1:     
>         inc ebx	; try to skip this so exit(0) instead of exit(1);

also: this translates into a single byte?  otherwise you'd need to
overwrite whatever bytes this produces.

but again, I believe you cannot modify executable pages (at least not in
such manner) :)

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.
