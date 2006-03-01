From: Ricardo Nabinger Sanchez <rnsanchez@notech.us>
Subject: Re: grub thing
Date: Wed, 1 Mar 2006 15:08:35 -0300
Message-ID: <20060301150835.90497c6a.rnsanchez@notech.us>
References: <200602222126.57346.thiago.silva@kdemail.net>
	<20060301071033.0c9eb1d4.amerei@gmail.com>
	<200603011542.51608.markosc@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200603011542.51608.markosc@interia.pl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-assembly@vger.kernel.org

Quoting  Marcin Ko=C5=9Bcielnicki <markosc@interia.pl>
Sent on  Wed, 1 Mar 2006 15:42:50 +0100

> Also, it has NOTHING to do with lack of interrupt handlers -- BIOS ha=
s=20
> handlers for all interrupts needed for bootstrap, and the others are=20
> disabled. No bad thing can happen. In fact, it re-enables interrupts
> right after setting the stack (sti)

thanks for correcting me! :)

--=20
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
