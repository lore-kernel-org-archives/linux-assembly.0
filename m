From: Gags Grewal <gagan_grewal@vsnl.net>
Subject: Re: Protected2Real
Date: Fri, 14 Feb 2003 09:18:35 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302140911.55789.gagan_grewal@vsnl.net>
References: <20030214010206.4210.qmail@web11402.mail.yahoo.com>
Reply-To: gagan_grewal@vsnl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030214010206.4210.qmail@web11402.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Slack Traq <slacktraq@yahoo.com>, linux-assembly@vger.kernel.org

Hi
> I have a question. When Linux loads it first load
> itself in real-mode (obviously) and then switch to
> protected or virtual mode. How can I do to reset the
> micro and switch from protected mode to real?
If the need is specific to executing real-mode code, then try using the vm86() 
call.

> I'd read that it can be done through a Triple-SegFault
> of the micro. If that is the solution, how can I do to
> SegFault the processor?
Am not exactly a guru at this, but roughly ... you coud try loading a kernel 
module that would modify the page-table for _some_ user-space mapping ... 
i.e. remove the mapping and then try reading/writing to an address in the 
area you just unmapped.

And if at all you are willing to do that, you could go farther and try 
implementing a "rouge-device" in the /dev tree, write a driver-module for 
that, which does the _dirty_ job on open( ). The advantage(?) here would be 
that you could mess the page-tables pertaining to 'current', not just ANY 
user process.

Regards,
Gags.
