From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: gas jump
Date: Wed, 03 Sep 2003 10:45:38 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F55AA32.5E2E324D@wp.pl>
References: <200308311206.37056.wklux@yahoo.co.uk> <3F52FEE9.220376C1@wp.pl> <200309011024.36769.wklux@yahoo.co.uk>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

peter w krause wrote:
> 
> Maciej Hrebien am Montag, 1. September 2003 09:10:
> > > correct code would be:
> > >                 jmp 1f
> > >         ...
> > > 1f:
> >
> > ^^^^^^
> >
> > It's "one forward", so the label should be named just "1" without the
> > "f". Don't you think? The semantics for such local symbols is N: where N
> 
> certainly! 'typing error' :)

I thinked so ;) But guess what.. i noticed that you may use more digits
when creating this local labels, NNN: seams to be correct. Heh, my
(obsolete?) info docs say only about 10 bacwards & 10 forwards.
Question: how many digits can you put there? I tried it by hand and when
i was assembling this little example below, gas-2.11.90.0.19 seg fault:

jmp 429496729616743212345f
nop
429496729616743212345:
nop

So, how it really is with this "non-standard" digit-labels?

-- 
Maciej Hrebien

