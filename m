From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Test MMX code (Using inline Assembly)
Date: Thu, 23 Jan 2003 14:17:17 -0800 (PST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15920.27117.870637.394512@eidolon.muppetlabs.com>
References: <20030123201712.40527.qmail@web21209.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030123201712.40527.qmail@web21209.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: Zeeshan Ali <zeelists@yahoo.com>

>   A test code of mine doesnt work. I dont understand at what is
> wrong with it.

You're calling a BIOS interrupt. Assuming you're running this program
under Linux, that's not permitted. The only interrupt available to you
under Linux is int 0x80.

> Plz i want answers that why on earth it doesnt work and not advices
> to use other alternatives.

Okay.... "You're calling a BIOS interrupt."

b
