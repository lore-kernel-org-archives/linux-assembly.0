From: "Tibor Kircsi" <tkircsi@gmail.com>
Subject: Re: Current break round up
Date: Wed, 1 Oct 2008 16:40:42 +0200
Message-ID: <c12f7eca0810010740q2836fe8fi9142a1aad59cbbd@mail.gmail.com>
References: <1222802784.8421.10.camel@kirilla-desktop>
	 <48E37E93.3080101@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=fxcWiu+m90mKPcVl2VtKaPPHK2tY1UrJRs8VxKhS2os=;
        b=d9+u7p5F7q8nJPH2xbCYjnphEAkSipoYBd9rq4e0k2a5g56Xgfo8oaRaAJ0Wi+EmLa
         UAAdC7R/5Y9LZdGA8um6LIlWe/oFgzIrw6zNGydoFONG4REJ2t5IHlzMaVpa95Iej8y+
         S15rgLEXS8UoVrOS6K0G2+OBUBQIsi70tYvbE=
In-Reply-To: <48E37E93.3080101@verizon.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@verizon.net>
Cc: linux-assembly@vger.kernel.org

Hi,

You're right! I tested it and I could write and read above the current
break after I call brk. I'll will test the page border too. Thanks.

regards,
Tibor

On Wed, Oct 1, 2008 at 3:43 PM, Frank Kotler <fbkotler@verizon.net> wrote:
>
> Kircsi Tibor wrote:
>>
>> Hi,
>>
>> Sorry for my english. I started learn assembly again after 15 years.
>> Now, I'm learning about memory management and sys_brk system call. I've
>> created a really simple program, which try to extend the heap size. I've
>> read, when sys_brk is called with the new break address(last usable
>> address of the heap or data segment), it will be rounded up to the next
>> nearest page, but it didn't. Am I misundestand somthing?
>
> I've noticed this. Seems to be related to kernel version (2.4.33.3 here). May be a "bug"? I think you can access memory up to the top of the page (what you/we would "expect" brk to return). I don't know what to make of it.
>
> Best,
> Frank
>
