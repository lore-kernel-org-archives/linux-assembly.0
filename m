From: Gregor Schatz <gregor.schatz@placeofplay.de>
Subject: Re: a-Linux question
Date: Fri, 8 Oct 2004 15:17:43 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200410081517.44649.gregor.schatz@placeofplay.de>
References: <152709311.20041007214548@home.ro>
Reply-To: gregor.schatz@placeofplay.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <152709311.20041007214548@home.ro>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly <linux-assembly@vger.kernel.org>

Hello Claudiu,

Claudiu Tanaselia wrote:
> I'd  downloaded  the  a-Linux, it's really cool stuff, but does anyone
> knows how can I mount a FAT32 partition for read/write? I tried the od
> fashioned  way, but in /dev directory there were no hda6 device. And I
> need a hda6 one. How can I create one?

I think you should create the device-files /dev/hda and /dev/hda6 with mknod 
(info mknod / man mknod). 


> When will it be the next release of a-Linux?
There I'dont know anything.

Sorry for my bad english

Gregor


