From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: gas jump
Date: Mon, 01 Sep 2003 10:10:17 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F52FEE9.220376C1@wp.pl>
References: <200308311206.37056.wklux@yahoo.co.uk>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

"peter w krause (by way of peter w krause )" wrote:
> 
> Fekete Gabor am Samstag, 30. August 2003 23:46:
> > hi
> >
> > i want to make a relative jump.
> > i tried it with "jmp 0x09" and expected it to
> 
> the actual displacement is not an argument to <jmp>
> 
> > jump to the address that comes 9 bytes after
> > this "jmp".
> > is it correct?
> 
> no.
> 
> > i'm asking because when I examined (x/bx) the code with
> > gdb it didn't really show any bytes with value 0x09 when
> > looking at this jump instruction.
> 
> should copile a branch to address stored at location 0x09
> 
> correct code would be:
>                 jmp 1f
>         ...
> 1f:
^^^^^^

It's "one forward", so the label should be named just "1" without the
"f". Don't you think? The semantics for such local symbols is N: where N
is any digit.

-- 
Maciej Hrebien

