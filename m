From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: gas jump
Date: Wed, 3 Sep 2003 12:54:07 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200309031254.07399.wklux@yahoo.co.uk>
References: <200308311206.37056.wklux@yahoo.co.uk> <200309011024.36769.wklux@yahoo.co.uk> <3F55AA32.5E2E324D@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F55AA32.5E2E324D@wp.pl>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl, linux-assembly@vger.kernel.org

Maciej Hrebien am Mittwoch, 3. September 2003 09:45:
>
> I thinked so ;) But guess what.. i noticed that you may use more digits
> when creating this local labels, NNN: seams to be correct. Heh, my

this was since long the case. used (and required) in the linux kernel where a 
chain of .9999 (or so) implements a linked list. - which was  where I 1st 
noticed the feature, while searching for at least some, minimal feature of 
setting up a set of run-time asm variables. which -imo- is the one, almost 
indispensable feature badly missing in the 'as' assembler. those numbered 
labels can help, in some cases, though.

newer versions docs notice those numeric labels, implicitely, by explaning 
that the lower 10 being handled in an optimized manner. even newer docs do 
not mention the limit of 10,  any more.

btw, anyone ever manged to utilize those locally valid numeric labels, which 
are promised by AS 'documentation' as to be defined by a number and a 
trailing "$" (dollar) instead of the ":" colon. - I did not, no way.

> (obsolete?) info docs say only about 10 bacwards & 10 forwards.

never trust those GNU/FSF originating info docs! many (most?) of which are 
utterly out of date and/or so badly organized that the sparse remarks wrt. 
those features are easily over-looked (ps or dvi variants are, at least, 
somewhat 'readable').

> Question: how many digits can you put there? I tried it by hand and when
> i was assembling this little example below, gas-2.11.90.0.19 seg fault:
>
> jmp 429496729616743212345f
> nop
> 429496729616743212345:
> nop
>
> So, how it really is with this "non-standard" digit-labels?

maximal figure not mentioned, anywhere in the docs. probably 63 bit ? i.e. +ve 
values of 'double' or 'long long' range? anyway, 31 bit  seem sufficient - 
I'm using the higher figures for the linked lists of "F4"-forth, in range of 
10000 +10.

best,
	hp
-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> clf -at- lxhp -dot- in-berlin -dot- de <<

