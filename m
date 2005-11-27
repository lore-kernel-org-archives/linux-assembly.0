From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Subject: Re: sys_fork
Date: Sun, 27 Nov 2005 17:27:43 -0200
Message-ID: <20051127172743.587c2c41.rnsanchez@terra.com.br>
References: <20051126192634.43926.qmail@web26006.mail.ukl.yahoo.com>
	<200511271337.56268.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200511271337.56268.hitoc_mail@yahoo.it>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Quoting  HIToC <hitoc_mail@yahoo.it>
Sent on  Sun, 27 Nov 2005 19:22:35 +0100

> My problem is to tell the OS to create a new child when
> a connection is established.

you'll have a loop blocking on accept(), with a call to fork() in the
body.  the child will handle the connection, the parent will block again on
accept().

can you give more details on your problem?  where are you stuck?

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.
