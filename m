From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: again simple problem under linux
Date: Thu, 13 Nov 2003 03:52:01 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311130352.01362.wklux@yahoo.co.uk>
References: <3FB27DF6.9060003@tiscali.it> <04e301c3a946$5179af80$6501a8c0@rhyde> <3FB2845B.8070508@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FB2845B.8070508@tiscali.it>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zad <zacido@tiscali.it>, linux-assembly <linux-assembly@vger.kernel.org>

zad am Wednesday 12 November 2003 19:04:
> afterall thank for u help .
> I thought that my code was intel  and not DOS code .

right. but, following the 'real mode' coding conventions of ms-dos...
linux user programs run in protected mode, level 3, 'flat' memory adressing, 
i.e. unsegmented 32 bit range, full instruction set.

> So  is all the Ralf Brown's list  for DOS?

a few exceptions apply to linux ('vm86' system call, nvram data).

dos 'interrupts' have their aequivalent in liux system calls.

some (short) syscalls docs re
	http://www.lxhp.in-berlin.de/lhpsyscal.html

much more for linux + asm in
	http://linuxassembly.org

> Cheers

	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<

