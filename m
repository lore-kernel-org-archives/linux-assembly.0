From: "Claudio Fontana" <claudio.fontana@gmail.com>
Subject: Re: Disassemble in GDB
Date: Sun, 1 Jun 2008 12:15:40 +0200
Message-ID: <2c04dc350806010315h3f0d9f7creb115bbe8be4affb@mail.gmail.com>
References: <g1tke5$cnh$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Wqn2gMClVsFSmVd8ovIpqTl69lJUAvPOM4+9Hyf1FVA=;
        b=ui4BDliePHGWZmH5lfFs4LH21BvMcMzDaBrlaQfcAY2zq0orZTPKmziEfAldO+cZ8AD0IC7z/JxcMAOMyQSt3RyppCu/YEnj58cSOaLcTsbznNhgsYFE8qrSjAQWRtC8oUluZegFwIKQbpDHK8+z4AqWXinjNaBJlz6vRsMpiJc=
In-Reply-To: <g1tke5$cnh$1@ger.gmane.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill <bill.clinton@fredastaire.ch>
Cc: linux-assembly@vger.kernel.org

On Sun, Jun 1, 2008 at 9:51 AM, Bill <bill.clinton@fredastaire.ch> wrote:
> I wrote a simple hello world in c. how can i disassemble main() with
> gdb?
>
> Cheers, Bill

Read The Fine gdb Manual.

'info gdb' or
http://sourceware.org/gdb/current/onlinedocs/gdb_toc.html
