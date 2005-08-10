From: "Stephen Pelc" <stephen@mpeltd.demon.co.uk>
Subject: Re: Embeded
Date: Wed, 10 Aug 2005 16:49:10 +0100
Message-ID: <42FA3006.30267.1AB80614@localhost>
References: <42F9D825.24163.1960BE71@localhost>
Reply-To: Stephen Pelc <stephen@mpeltd.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <42F9F031.9050105@unreal64.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lada 'Ray' Lostak <ray@unreal64.net>
Cc: linux-assembly <linux-assembly@vger.kernel.org>

> Thank you, I didn't know Philips do uC too :) I know Atmel one's
> and they seems prety OK. What TCP/IP stack you are using ? There
> exists sever GPL'ed, but I have no experimence with them.
> 
> The only reason why I wanted to run linux is to use their eth
> drivers & tcp/ip stack. Nothing more.

We use our own, see
  www.mpeforth.com/powernet.htm

If you are using external Ethernet chips such as the SMSC 91Cxxx 
series, RealTek 8019AS (and other NE2000 clones) or Asix 88976, 
the drivers are pretty simple and there are plenty of code 
examples on the net. Once you know what you are doing, about 200 
lines of code.

The Ethernet controllers integrated into most CPUs tend to 
consist of a MAC unit with small buffers and a DMA engine. You 
have to manage it all yourself. They can require 1000+ lines of 
code.

What to do depends on the hardware volume and how much time you 
have.

Stephen

--
Stephen Pelc, stephen@mpeltd.demon.co.uk
MicroProcessor Engineering Ltd - More Real, Less Time
133 Hill Lane, Southampton SO15 5AF, England
tel: +44 23 80 631441, fax: +44 23 80 339691
web: http://www.mpeltd.demon.co.uk - free VFX Forth downloads
