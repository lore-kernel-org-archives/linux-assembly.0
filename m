From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: bios interuppts
Date: Wed, 5 Mar 2003 11:42:26 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15974.21282.393278.25969@eidolon.muppetlabs.com>
References: <20030304120742.6160.qmail@webmail7.rediffmail.com>
	<3E64EAB9.5070000@hampshire.edu>
	<15973.3207.212962.958382@eidolon.muppetlabs.com>
	<200303050705.h2575frL010363@hirsch.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200303050705.h2575frL010363@hirsch.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hp <lx@lxhp.in-berlin.de>
Cc: linux-assembly@vger.kernel.org

> simplest 'clearscreen', standard even in those times where the 'tty'
> was a real tty writer is by VT control <ff>, i.e. char 12. def'd in
> ANSI, VT52, etc.  it should be handled by a displaying program such
> that it clears the screen or, sends a form feed if output is not a
> video display.

I agree that it *should*. However, FF does not clear the screen in the
Linux console, or in any of the xterm programs that I tested it with.
That makes it pretty unportable in my book, at least in the context of
a linux-based mailing list.

b
