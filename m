From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: instruction "00 00"
Date: Wed, 25 Jun 2003 21:19:31 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16122.29779.168894.906589@eidolon.muppetlabs.com>
References: <20050625204254.6d789a1c.lee@biggdaddy4u.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050625204254.6d789a1c.lee@biggdaddy4u.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> one question i have is whenever i see the instruction "00 00" apear,
> the assembly code given for that is "add ptr [eax], al".
> 
> is this normal?

Sure. "add [eax], al" happens to be the instruction that assembles to
0000. Why did you think this might be wrong?

b

