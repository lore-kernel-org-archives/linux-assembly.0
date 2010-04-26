From: Steffen Solyga <solyga@absinth.net>
Subject: Re: how to send the READ(10) command to usb device by assembler 
	language?
Date: Mon, 26 Apr 2010 23:34:58 +0200
Message-ID: <z2xc8cf8c271004261434x19282754ic8318aaa07fdac48@mail.gmail.com>
References: <i2jf3566d61004250728w244ffad9hf74b0c6c3bd61b4b@mail.gmail.com>
	 <z2p41279cd11004251909n9a80fa6bz1cfccb9c2c407aea@mail.gmail.com>
	 <m2gf3566d61004260232q5c89bc33z6cc627deff93b37e@mail.gmail.com>
	 <j2led8e3c011004260247pbff467a9p6848e60fbe4a8743@mail.gmail.com>
	 <j2uf3566d61004260316ta81186e5tcb41792ec7d32883@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type;
        bh=BG3o5Ej39NPlEDhdLGO2JJDzli5W41Y9RnHrUf31O/o=;
        b=NtaJg1Wrp637ECTZCbUQEAvj3wVzBgU+5O3S8rzgNVMHZQahgY9URewMrb59va7vI9
         tQLoG366U9FWS6+FxcwyCDi1ksxVIjgkeGdrmyx8OGPiYe2Xn6pFfnYhmRiP9PcjiO0m
         nFByZNqpd+UN6nEuyFow3ERql3RjG2XWNLbK4=
In-Reply-To: <j2uf3566d61004260316ta81186e5tcb41792ec7d32883@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bai Shuwei <baishuwei@gmail.com>
Cc: linux-assembly@vger.kernel.org

I never heard of a (standard) interface to the bios usb stack. So
either you build
your own driver(s) or you have to live with the old interfaces, namely int 13.
Does the hpa bootloader work for for your drive? Then you may check ah=48h;
at least it looks like some ata identify drive information.
http://linux.xulin.de/asm/boot/mbr.asm
http://www.ctyme.com/intr/int-13.htm
Steffen

On Mon, Apr 26, 2010 at 12:16 PM, Bai Shuwei <baishuwei@gmail.com> wrote:
> The BIOS support int 13h  to access the disk, but only same as sector
> read/write. I want to know how to get the command to read the disk
> serial number. I don't whether there are some commands can be used to
> get the usb-disk serial number?
