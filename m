From: m_hrebien@wp.pl
Subject: Re: gas' nop(s)
Date: Mon, 05 Aug 2002 11:23:40 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D4E441C.DD954A05@wp.pl>
References: <3D4D8E7F.8A393F62@wp.pl> <20020805091651.245c7d4b.jani@iv.ro>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Jani Monoses wrote:
> 
> Hi
> look at the .align directive in info gas

.align, oh, of course!! :) Thank You!!

> there is no requirement for text to be packed at 4

I thought so. Thanks for Your confirmation!

> but it is the default (or maybe even 16)

16? Possibly it depends on system/compilation, don't You think so? On my
gas it seems to be 4 as i wrote.

-- 
Maciej Hrebien

