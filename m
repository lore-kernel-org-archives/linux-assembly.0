From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Protected2Real
Date: Thu, 13 Feb 2003 22:17:34 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15948.35326.877704.290091@eidolon.muppetlabs.com>
References: <20030214010206.4210.qmail@web11402.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030214010206.4210.qmail@web11402.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Slack Traq <slacktraq@yahoo.com>
Cc: linux-assembly@vger.kernel.org

> I have a question. When Linux loads it first load
> itself in real-mode (obviously) and then switch to
> protected or virtual mode. How can I do to reset the
> micro and switch from protected mode to real?
> I'd read that it can be done through a Triple-SegFault
> of the micro. If that is the solution, how can I do to
> SegFault the processor?

Your information is out of date.

The triple-fault technique of resetting the processor to get out of
protected mode (which was done by causing a fault while inside the
double-fault exception handler) was only necessary for the 80286. On
all later processors, you can just clear the low bit in CR0:

	mov	eax, cr0
	and	eax, ~1
	mov	cr0, eax

Note that you'll need to be privileged in order to do any of this.

b
