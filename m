From: Jack Dennon <jdd@seasurf.net>
Subject: Re: Local Symbol Names
Date: Wed, 25 Jun 2003 17:14:36 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <03062517120000.00355@linux24>
References: <Law14-F6AauNjVuMhvq0002ae10@hotmail.com> <03062511461400.00228@linux24> <16121.64387.51274.655658@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <16121.64387.51274.655658@eidolon.muppetlabs.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Wednesday 25 June 2003 12:44, Brian Raiter wrote:
> >	The call instruction probably was used to empty the
> >	the Execution Unit's instruction cache; thereby
> >	forcing it to be reloaded from memory. Or, it could
> >	be used just to force a time delay.
>
> The pop %eax instruction, however, makes it clear that the purpose of
> the code is to get the current PC address into eax. As hpr suggested,
> almost certainly for use in writing position-independent code.
>
	Hmm, yes you have a point.
	But then, why not just push and pop?
	jdennon@seasurf.com

