From: Vince Weaver <vince@deater.net>
Subject: Re: bios interuppts
Date: Tue, 4 Mar 2003 15:34:20 -0500 (EST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0303041531310.10881-100000@pianoman.cluster.toy>
References: <15973.3207.212962.958382@eidolon.muppetlabs.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <15973.3207.212962.958382@eidolon.muppetlabs.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


> > The simplest way to do it is to use terminal escape codes.
>
> vt100 escape codes aren't guaranteed to work everywhere, though.
>
> If you don't care much about portability, then use the escape codes
> that are shared between VT100, ANSI, and xterm. That will probably
> work fine 99% of the time, on a Linux machine.

also, if you only care about working on the text console you can
read/write to the /dev/vcs* devices ( "man vcs" ) which give you
more or less the equivelant of poking around in the DOS text-framebuffer.

Vince


