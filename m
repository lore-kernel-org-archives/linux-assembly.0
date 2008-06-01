From: Claudio Fontana <claudio.fontana@gmail.com>
Subject: Re: precise debugging of inline asm
Date: Sun, 01 Jun 2008 19:27:26 +0200
Message-ID: <4842DBFE.4080404@gmail.com>
References: <20080601150140.GA2832@drago>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=1QUUAysLJ0JLfXKUhlDoauYtTOJHMvkqkAnCMXfpzs8=;
        b=x5REUqRO83VoTNV+fpOPJo/HvzzE2mTmZcqNYyXyC4yHWOp5FFZ3jbQQ0i+wmTX0XPeEwfl3vVJiqLryCtNtxda4Jt0Sjawd/xPvyOor+13mDB1iKArb41p+r1VL+7Ljo0P6lqC/kPcqU6C8Q/U37ST/JKbLwFbB69eoBs6fbiI=
In-Reply-To: <20080601150140.GA2832@drago>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lynx.abraxas@freenet.de
Cc: linux-assembly@vger.kernel.org

lynx.abraxas@freenet.de wrote:
> Hello!
> 
> 
> The  mentioning  of  gdb  in  this  mailinglist  gave  me  the  idea to ask my
> unresolved question here as well:
> 
> Trying to port cpt2 to linux I have an inline assembly part of about 100 lines
> that causes a segmentation fault while juggling around with memory. When I use
> gdb for debugging it sadly only points me to the line  where  the  inline  asm
> starts.  I  haven't  been able to figure out how to get a more precise info in
> what line the actual segmentation fault comes from.
> Does anybody here know if that is at all possible and if so, how? Would labels
> to each line help?
> 
> Thanks for any help or hints.
> Lynx

On x86, try for example

(gdb) disassemble $eip $eip+20

Also see
(gdb) info registers

Cld
