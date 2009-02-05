From: pei lin <telent998@gmail.com>
Subject: Re: why linux ELF base address is 0x8048000?
Date: Thu, 5 Feb 2009 09:58:01 +0800
Message-ID: <d6b7c4190902041758udbf450bg2972b9d7d89b4979@mail.gmail.com>
References: <d6b7c4190902030125w235bca7tdd86b8c94b727e06@mail.gmail.com>
	 <73512bc10902032321n863a27by7ac63193dfc4488a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=j42wZU/qY5LPqzbn/+b1+fp5+FXJ5IrUhtBSzJcdGzY=;
        b=ZF9F6KrHo5saiQlJJrA9ZafE+jOwDjiUAtXQpy3+a1E0QWaoyewxKCmxEY2ZF2X/dw
         IvdOwpjA4zeFo1KiSlJmqSAgbjpmoJAZRMiX8CIG90jeHbv0UXTwPNGgnQn9xminTzcs
         yrD7exC/DwbVnpc8d+mJHcXK3rEDs+Bw7NnFM=
In-Reply-To: <73512bc10902032321n863a27by7ac63193dfc4488a@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Evans <teknopup@gmail.com>
Cc: linux-assembly@vger.kernel.org

The article i read, but it does't explain my question about why linux
loads all elfs to this base address.

2009/2/4 Chris Evans <teknopup@gmail.com>:
> http://www.linux-tutorial.info/modules.php?name=MContent&pageid=327
>
>
> On Tue, Feb 3, 2009 at 1:25 AM, pei lin <telent998@gmail.com> wrote:
>>
>> hi,
>>   why linux ELF base address is 0x8048000? we can use ld to change
>> the base address or linker script.BUT why default is 0x8048000? There
>> must be some reasons or history i don't know. Could u give me an
>> advice? Thx.
>>
>>
>> Best Regards.
>>
>> P.L
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
