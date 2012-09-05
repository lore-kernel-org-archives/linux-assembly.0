From: Nicolas Bock <nicolasbock@gmail.com>
Subject: Re: 4x4 single-precision matrix product with SSE
Date: Wed, 5 Sep 2012 13:13:46 -0600
Message-ID: <CAPMKG4Co96j3bcFCL2qmB72FvYeGd+53Wxkx6x3nkDN7XHgmzQ@mail.gmail.com>
References: <4D7AA710.2030303@gmail.com> <AANLkTimCWmanFU19admtg5q18HvCOxrdjm+9XWFT-0Zm@mail.gmail.com>
 <4D7D27C3.5050404@gmail.com> <AANLkTim-ZqzJ+2q+u=7+yRjzTf7FQDcuu-YDN=RV0H6X@mail.gmail.com>
 <AANLkTimny0PkR0bYBjKgaH4j=_=2aL=rt=YcDjWeQCG6@mail.gmail.com> <AANLkTimtyx3+bapOWEC=WO5hV5v+q4_EWh15TvHFQVdz@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=ST1TMVkhZwE4RVDN4/P7ev8hGXMtlDaJD5H4qWd0yvE=;
        b=KnBAzzsC/Lo1LVBhGpfp81pYK3RaXa9AUcqlSWtcmNs3HekF5KwbGvChTpAJw1H+4P
         Q9jdfos2Bml9chFuP9JaLtcykuSVLYX/Wpwy1HMHXkOp7YnFGgKL/kKb2LlQW22fEC3W
         xv5eusTNiRAAyIOokPPBdNeFyIzC8xrE/tyK9jhWuiVvSAzlgVCBsTRdLu2aOpAE+Pw7
         XOWaPH3rlZs7NxwwG2EIC5YmsTzb9z4YC5DYqPgJYfRpKgXAwa5f0yXInU5POqCkwzW0
         b4EnQbfg2Yj/1odSqLkDNgHFnBpamVGReuh0VtPPELQ3LaqgJ8OqJ7MzrAgV14E8Syow
         c47A==
In-Reply-To: <AANLkTimtyx3+bapOWEC=WO5hV5v+q4_EWh15TvHFQVdz@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly <linux-assembly@vger.kernel.org>

Hi list,

thanks to the many helpful comments and suggestions here I was able to
write the 4x4x4 multiply and even get a somewhat performance out of
the code. We have published our results on this here:

http://arxiv.org/abs/1203.1692

Thanks again,

nick
