From: hp <lx@lxhp.in-berlin.de>
Subject: Re: Preprocessing Assembly
Date: Sun, 27 Apr 2003 01:20:02 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200304262320.h3QNKcVN000848@hirsch.in-berlin.de>
References: <3EAAA2CC.3000606@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3EAAA2CC.3000606@users.sourceforge.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johann Oskarsson <myrkraverk@users.sourceforge.net>, linux-assembly@vger.kernel.org

Johann Oskarsson am Samstag, 26. April 2003 16:16:
> Hi,
>
> I've been doing a little assembly on my playstation2 running linux
> (actually writing a little tutorial as I go along) and was wandering
> what you ppl use to preprocess the source (if you do)?  I've tried a
> little gasp, but that's depricated.
		^^^^^^^^^^^^
not really. GASP enables a few features which are often required but not 
implemented with any other part of the binutils.
besides, the binutils' authors only _state_ that all GASP features are 
implemented with AS, which is not true. and, there is still some development 
on GASP going on, not documented but, a "diff" shows. and, the GASP is 
included in the binutils sources, with AS, in the directory of which it can 
be compiled, separately ("make gasp-new").


>  Do you generally use cpp, or is there a better tool out there?

I don't know of any such tool which wouldn't be worse - or self-made.


best,,
	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>
