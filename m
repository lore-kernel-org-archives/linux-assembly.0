From: hp <lx@lxhp.in-berlin.de>
Subject: Re: Keyboard and Mouse library
Date: Wed, 16 Jul 2003 00:15:06 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200307160015.06499.lx@lxhp.in-berlin.de>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200307160303.16120.jko@save-net.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jeff <jko@save-net.com>, linux-assembly@vger.kernel.org

jeff am Mittwoch, 16. Juli 2003 11:03:
> Hello,
> I'm trying to create a linux library and running into
> trouble with the mouse.  The intent was to use kernel
> calls only and run from the user level.  Is this
> possible?

very difficult. simple ioctls won't work.

> I've looked at Gpm which works with terminals
> but find the "c" code difficult.  Assembler for me
> is much easier to understand.

yes, but (most of) those C-'programmers' don't understand (and ignore) 
assembly, so you might need to learn their 'language'...

> Also, it would be nice to get the raw keyboard scan
> codes.  I've found programs that claim to do this
> but they don't work on my 9.1 Mandrake version
> of Linux?

re library of 'biew' program, file 'keyboard.c', a link to the source can be 
found on http://linuxassembly.org

mandrake might be difficult, I'd find even some signals actions different (and 
falsely modified!) , in an old version.

best,
	hp
-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>

