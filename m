From: hp <lx@lxhp.in-berlin.de>
Subject: Re: warning: newbie attempting SSE
Date: Thu, 29 May 2003 11:13:23 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200305290914.h4T9E0MF022583@hirsch.in-berlin.de>
References: <3ED59433.4010906@lalila.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3ED59433.4010906@lalila.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

etienne deleflie am Donnerstag, 29. Mai 2003 06:01:
> hello,
>
> The main reason why I need help is because I have no idea how to verify
> what is in my xmm registers (I'm using gdb) .... does anyone know how I
> can view the bits (or bytes) in xmm using gdb ?

no idea about "gdb"; the "ald" debugger displays mmx-regs with
	set  step-display-mmxregs on
after start-up

source available at
	http://dunx1.irt.drexel.edu/~psa22/ald.html

patch for continuous symbols' display (and a(nother) man-page):
	http://www.lxhp.in-berlin.de/lhplinks.html#ald


best,
	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
	FAQ(s) + DOCs at http://linuxassembly.org
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>
