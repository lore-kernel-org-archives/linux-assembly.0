From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Subject: Re: sys_fork
Date: Mon, 28 Nov 2005 17:25:41 -0200
Message-ID: <20051128172541.d35e0496.rnsanchez@terra.com.br>
References: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com>
	<200511271337.56268.hitoc_mail@yahoo.it>
	<20051127172743.587c2c41.rnsanchez@terra.com.br>
	<200511281110.51363.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200511281110.51363.hitoc_mail@yahoo.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Quoting  HIToC <hitoc_mail@yahoo.it>
Sent on  Mon, 28 Nov 2005 11:10:51 +0100

Hello,

as Frank said, you're not handling fork() result.

> st_connection:	mov	[new_sock], eax	; new socket
> saved!
> 
> 		mov	eax, 0x02	; sys_fork
> 		xor	ebx, ebx
> 		int	0x80

you should test here whether eax is < 0 (error), 0 (child) or > 0 (parent)
and act accordingly.  but both processes are executing this right away:

> 
> 		mov		eax, 0x06	; sys_close
> 		mov		ebx, [sock_fd]
> 		int	0x80

and closing their listening socket (the one which is blocked on accept()).

do the program exit with error (EINVAL)?

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.
