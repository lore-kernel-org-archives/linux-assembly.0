From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: gas jump
Date: Mon, 1 Sep 2003 10:24:36 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200309011024.36769.wklux@yahoo.co.uk>
References: <200308311206.37056.wklux@yahoo.co.uk> <3F52FEE9.220376C1@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F52FEE9.220376C1@wp.pl>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Maciej Hrebien am Montag, 1. September 2003 09:10:
> > correct code would be:
> >                 jmp 1f
> >         ...
> > 1f:
>
> ^^^^^^
>
> It's "one forward", so the label should be named just "1" without the
> "f". Don't you think? The semantics for such local symbols is N: where N

certainly! 'typing error' :)

hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<

