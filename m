From: hp <lx@lxhp.in-berlin.de>
Subject: Re: bios interuppts
Date: Wed, 5 Mar 2003 06:55:41 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200303050705.h2575frL010363@hirsch.in-berlin.de>
References: <20030304120742.6160.qmail@webmail7.rediffmail.com> <3E64EAB9.5070000@hampshire.edu> <15973.3207.212962.958382@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <15973.3207.212962.958382@eidolon.muppetlabs.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Brian Raiter <breadbox@muppetlabs.com>, linux-assembly@vger.kernel.org

Brian Raiter am Dienstag, 4. M=E4rz 2003 20:28:
> > The simplest way to do it is to use terminal escape codes.
>
> vt100 escape codes aren't guaranteed to work everywhere, though.
	[...]

simplest 'clearscreen', standard even in those times where the 'tty' wa=
s a=20
real tty writer is by VT control <ff>, i.e. char 12. def'd in ANSI, VT5=
2, etc.
it should be handled by a displaying program such that it clears the sc=
reen=20
or, sends a form feed if output is not a video display.

hp

--
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
