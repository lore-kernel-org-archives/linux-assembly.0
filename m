From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: gas jump
Date: Thu, 04 Sep 2003 00:22:54 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F5669BE.7F483D94@wp.pl>
References: <200308311206.37056.wklux@yahoo.co.uk> <200309011024.36769.wklux@yahoo.co.uk> <3F55AA32.5E2E324D@wp.pl> <200309031254.07399.wklux@yahoo.co.uk>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

peter w krause wrote:
> 
> Maciej Hrebien am Mittwoch, 3. September 2003 09:45:
> >
> > I thinked so ;) But guess what.. i noticed that you may use more digits
> > when creating this local labels, NNN: seams to be correct. Heh, my
> 
> this was since long the case. used (and required) in the linux kernel where a
> chain of .9999 (or so) implements a linked list. - which was  where I 1st
> noticed the feature, while searching for at least some, minimal feature of
> setting up a set of run-time asm variables. which -imo- is the one, almost
> indispensable feature badly missing in the 'as' assembler. those numbered
> labels can help, in some cases, though.

Heh, there are plenty of >1 digit labels in the kernel's *.S files, i
think i have never focused on this labels (their names) - just threat
them as dest of a jmp or something until now when i noticed it may be
useful ;) ok, never mind.
 
> > (obsolete?) info docs say only about 10 bacwards & 10 forwards.
> 
> never trust those GNU/FSF originating info docs! many (most?) of which are
> utterly out of date and/or so badly organized that the sparse remarks wrt.
> those features are easily over-looked (ps or dvi variants are, at least,
> somewhat 'readable').

The worst thing is that this obsolete docs come with quite fresh soft.
Yes, this is not the first time the info pages seem to be not the best
idea.
 
> maximal figure not mentioned, anywhere in the docs. probably 63 bit ? i.e. +ve
> values of 'double' or 'long long' range? anyway, 31 bit  seem sufficient -
> I'm using the higher figures for the linked lists of "F4"-forth, in range of
> 10000 +10.

But from the other hand: who uses 429496729616743212345: as the name of
a label? ;)

Thank you for your post!

-- 
Maciej Hrebien

