From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: linux system call for allocation of memory
Date: Thu, 13 Nov 2003 13:38:21 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311131338.21706.wklux@yahoo.co.uk>
References: <3FB33D54.9000605@cbf.chinese2000.net> <3FB35AA4.4050404@tiscali.it> <3FB350CB.5060401@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FB350CB.5060401@hotpop.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lawrence <lawrencio@hotpop.com>, linux-assembly@vger.kernel.org

Lawrence am Thursday 13 November 2003 09:37:
> Thanks for your reply zad.
>
> I just browsed the list of linux system call again, and didn't find any
> related to either memory allocation or release.

syscalls: mmap, munmap, mremap

"F4" might serve as an example implementation w. a very simple automatic 
de-/allocation scheme.
	http://www.lxhp.in-berlin.de/lhpf4.html (de, introduction + source)
	http://www.lxhp.in-berlin.de/e-lhpf4.html (en, as above, short text)

other, more sophisticated memory management routines can be found in the 
'asmutils':
	http://linuxassembly.org

> Does this imply one must write linux asm program in flat model?

yes.


regards,
		hp
-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<

