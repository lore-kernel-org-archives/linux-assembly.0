From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: gas' nop(s)
Date: Fri, 09 Aug 2002 21:47:12 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D541C40.C8BD3519@wp.pl>
References: <3D4D8E7F.8A393F62@wp.pl>
					<20020805102040.7d12bd33.*@lxhp.in-berlin.de>
					<3D4EBBA5.698AA14D@wp.pl>
					<20020805222102.193b66fc.lx@lxhp.in-berlin.de>
					<3D4F9750.328C98B1@wp.pl>
					<20020807074136.0a1c2cf3.lx@lxhp.in-berlin.de>
					<20020808155047.74fd863e.*@lxhp.in-berlin.de> <20020809160727.0462fe8c.*@lxhp.in-berlin.de>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

h-peter recktenwald wrote:
> 
> > > > Yes, right! But it still adds "89F6" padding which stands for "mov
> > > > %esi,%esi" & my question was how to avoid this.
> >
> > just tried: apparently, the ".end" directive inhibits those alignemt bytes,
> > (if not a label at end of code).
> 
> that was an error. though i wonder how some program of mine ends up
> with an odd address. probably due to its .data end. so i tried asm
> into a .data section, which works and, does #not# align. so, since you
> seem not to asm to any fixed 'format', that might be the alternative.

Good idea!! I've tried to move our example (this with simple exit call)
to the .data section but it still adds padding - it's: add %al,(%eax)
(coded as "00 00") on my gas even with .align directive set to 1. But!
I've followed Your way of thinking and guess what?! :) "why not to move
this code to the .rodata section?" and... it works just fine!! No
paddings!! :)

Thank You very much for Your suggestion Peter (is that Your name?)!!!

-- 
Maciej Hrebien

