From: jeff <jko@bctonline.com>
Subject: Re: Keyboard and Mouse library
Date: Thu, 17 Jul 2003 00:17:27 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200307170017.27280.jko@bctonline.com>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com> <200307160015.06499.lx@lxhp.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200307160015.06499.lx@lxhp.in-berlin.de>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Tuesday 15 July 2003 04:15 pm, hp wrote:
> yes, but (most of) those C-'programmers' don't understand (and ignore)
> assembly, so you might need to learn their 'language'...

True, most of Linux seems to be documented from a "C" programmers
perspective.  One has to learn a long list of symbolic names for
things and then look in the .h files to see what codes they create.
Then you run into a lot of ifdef statements and have trouble
deciding if this symbol code is for BSD or AIX or ?   Eventually,
it is necessary to compile the code and use GDB to see
what code is generated.

Sigh... I sometimes wish we had a simple assembler interface
to the kernel.  If a call can only be accessed as root then
that would be handled etc.  Everything clearly documented
for assembler code.  No macros.   No includes.  Just
registers, dwords, words, and bytes.  If common operations
require several kernel functions they could be added.

Enough dreaming... back to work <grin>  Jeff Owens


