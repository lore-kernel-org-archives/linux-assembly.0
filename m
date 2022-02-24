From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4] hwmon: (dell-smm) Improve assembly code
Date: Wed, 23 Feb 2022 16:45:27 -0800
Message-ID: <e0c0eac9-a66a-fc35-0864-2ca1ba7cb32f@roeck-us.net>
References: <20220220190851.17965-1-W_Armin@gmx.de>
 <20220222165432.GA255373@roeck-us.net> <20220222175150.qs32v4outislnqj6@pali>
 <b3cecea1376f4080929f47da2529685c@AcuMS.aculab.com>
 <4b5ca065-06a4-c1ff-ed16-3bbb038ee6e0@gmx.de>
 <63a04993864f4c08923ed753d83cdf37@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oLxhe1+/q/ffytS2x1bnbij1SrGOn3CdIxFKv6xoCNQ=;
        b=T1Pc4B23cN3s1FGEyr9jrL0b8gag+JUNzErCsCXYOhNTaC9lMQqhiVTDrXqC4kcDz5
         4GBMrIYL7Oez63vIGGSOU70kgfUEkiQknd2HqL2t+N5Ohdln0utp/KlJrvhl3Fa6GBN0
         bXyabAAVmmb/lusrMmTE/7s5MPg2a0nVzjeQ8lFHlDtm/rMXUSXXdHYL9PJWGDwEFc8Q
         gMeg9uCvhL9izTnstMr83iWz8QKqjZuYYdZ0Vj/t9PB/vqMMjO2t+9w9mL5DHIM+lXpi
         7RlG8RwYAdWVYIa7GH8QBsQuVeq6TKZYoWcEFiEucaDJB7l8XuAN21bWA0fpIxEUIqDD
         kCgA==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Language: en-US
In-Reply-To: <63a04993864f4c08923ed753d83cdf37@AcuMS.aculab.com>
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Laight <David.Laight@ACULAB.COM>, 'Armin Wolf' <W_Armin@gmx.de>, =?UTF-8?B?J1BhbGkgUm9ow6FyJw==?= <pali@kernel.org>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2/23/22 14:35, David Laight wrote:
> From: Armin Wolf
>> Sent: 23 February 2022 21:39
> ...
>>> As far as this patch goes I think I'd add a 'stc' (set carry)
>>> instruction before the first 'outb'.
>>> Then if the 'something magic happens here' doesn't happen (because
>>> you aren't on the right kind of motherboard) the action fails.
>>>
>>> 	David
>>
>> We already check for such scenarios by checking if eax changed.
>> I would not set the carry flag before doing a SMM call since im
>> not sure if the firmware code always clears the carry flag when
>> the call was successful.
>> If for example the firmware code only sets the carry flag on
>> error and otherwise ignores the carry flag, we might create some
>> false negatives when a successful SMM call leaves the carry flag set.
> 
> If you are worried about that you should be clearing carry on entry.
> 

I agree, but now we have an argument for clearing carry (because the
SMM code might not do it) and for setting carry (because the SMM code
might not execute). I don't know which way to go, if any, but that
would be a functional change and should be submitted as separate patch.

Guenter
