From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: bios interuppts
Date: Tue, 4 Mar 2003 12:28:55 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15973.3207.212962.958382@eidolon.muppetlabs.com>
References: <20030304120742.6160.qmail@webmail7.rediffmail.com>
	<3E64EAB9.5070000@hampshire.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3E64EAB9.5070000@hampshire.edu>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> The simplest way to do it is to use terminal escape codes.

vt100 escape codes aren't guaranteed to work everywhere, though.

If you don't care much about portability, then use the escape codes
that are shared between VT100, ANSI, and xterm. That will probably
work fine 99% of the time, on a Linux machine.

If you don't care at all about portability, then use whatever escape
codes your own particular terminal uses.

If you do care about portability, then use ncurses. Or else don't even
try to draw on the screen. After all, the "screen" might actually be a
TTY (at least in theory).

b
