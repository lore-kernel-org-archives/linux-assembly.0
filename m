From: "Stephen Pelc" <stephen@mpeltd.demon.co.uk>
Subject: Re: Embeded
Date: Wed, 10 Aug 2005 10:34:13 +0100
Message-ID: <42F9D825.24163.1960BE71@localhost>
References: <42F997D3.40105@unreal64.net>
Reply-To: Stephen Pelc <stephen@mpeltd.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <42F997D3.40105@unreal64.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly <linux-assembly@vger.kernel.org>

Date sent:      	Wed, 10 Aug 2005 07:59:47 +0200
From:           	Lada 'Ray' Lostak <ray@unreal64.net>
Subject:        	Embeded

> maybe a bit wrong list, maybe not :) I have to crete embeded
> machine with custom HW. I am looking for some microcotroller,
> enough strong which is abble to run kernel. I am going to use
> clean kernel + asm stuffs to build system here. I am looking
> for CPU which have working kernel. Anyone have experimence
> with this ? 
> 
> Microcontroller in my eyes mean: it doesn't need any external
> chips at all. It includes everything. The less external chips
> it needs the better. Integrated ethernet (or usb) controller
> (with proper kernel drivers) is my dream :) 

Have a look at Philips LP2138/48 or Atmel AT91SAM7S256. These 
are 60 or 30 MHz ARM cores with up 512k Flash and 32k RAM. 
Forget about Linux and do the O/S yourself. Then it will fit. We 
run a multi-threaded web server on a Philips LPC2106 with 1288k 
Flash and 64k RAM and an external Ethernet chip.

If you must run some flavour of Linux, then you will need 
external Flash and RAM, in which case you may find the Atmel 
AT91RM9200 to be what you need. Boards and Linux for this chip 
already exist.

Stephen

--
Stephen Pelc, stephen@mpeltd.demon.co.uk
MicroProcessor Engineering Ltd - More Real, Less Time
133 Hill Lane, Southampton SO15 5AF, England
tel: +44 23 80 631441, fax: +44 23 80 339691
web: http://www.mpeltd.demon.co.uk - free VFX Forth downloads
