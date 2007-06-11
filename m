From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Segment override and lldt instruction
Date: Sun, 10 Jun 2007 22:30:43 -0700
Message-ID: <18028.56835.820833.299934@eidolon.muppetlabs.com>
References: <d93f04c70706041652k3be549bs8140489a8abbe0b6@mail.gmail.com>
	<BAY133-F2621988146A83572C34FFBF51A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-F2621988146A83572C34FFBF51A0@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> So if answer is yes, and if more than 4GB of memory space is needed
> for a program how will segmentation register go beyond 4gig without
> override?

A single process cannot access more than 4GB in 32-bit Linux. Period.
If you need more than 4GB, then you should be using 64-bit Linux.

b
