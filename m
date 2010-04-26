From: Bai Shuwei <baishuwei@gmail.com>
Subject: Re: how to send the READ(10) command to usb device by assembler 
	language?
Date: Mon, 26 Apr 2010 18:16:19 +0800
Message-ID: <j2uf3566d61004260316ta81186e5tcb41792ec7d32883@mail.gmail.com>
References: <i2jf3566d61004250728w244ffad9hf74b0c6c3bd61b4b@mail.gmail.com>
	 <z2p41279cd11004251909n9a80fa6bz1cfccb9c2c407aea@mail.gmail.com>
	 <m2gf3566d61004260232q5c89bc33z6cc627deff93b37e@mail.gmail.com>
	 <j2led8e3c011004260247pbff467a9p6848e60fbe4a8743@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=AsYRWWnTH4bUn0v27K1hiJh7WL/lNVeiEHRUoNXdHVA=;
        b=Wv9AX67DovaZ8/Sb80GdkqTgA/jGUiCOfai8D/eTxtSNNM7pmhpLk01MmqoxzyLSy/
         EvvklLQVIB0ovewFPYE8sAFsyy1p9I8sTpSI/ylyqnZOhL20hNnV+SkIGmg1UhXgi6os
         a9dKZMjLWmvEZ4Tu83HmBgNDYAV0BocGWBILI=
In-Reply-To: <j2led8e3c011004260247pbff467a9p6848e60fbe4a8743@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frederic Marmond <fmarmond@gmail.com>
Cc: linux-assembly@vger.kernel.org

On 26 April 2010 17:47, Frederic Marmond <fmarmond@gmail.com> wrote:
> Hi,
> maybe you could have a look at the bios : some bios consider usb hard
> drives as 'regular' ide/scsi hard drives, so they can be accessed
> transparently by boot loader. So, if your bios supports it, you may
> use its default hd functions.
The BIOS support int 13h  to access the disk, but only same as sector
read/write. I want to know how to get the command to read the disk
serial number. I don't whether there are some commands can be used to
get the usb-disk serial number?


>
> Fred
>
> 2010/4/26 Bai Shuwei <baishuwei@gmail.com>:
>> On 26 April 2010 10:09, Mike R. <noodlesgc@gmail.com> wrote:
>>> I'm no expert, but couldn't you read from the device usb device at =
/dev/bus/usb?
>> The /proc/bus/usb is used by the application. But i want to get thos=
e
>> information in the bootloader.
>>
>>> --Mike
>>>
>>>
>>>
>>> On Sun, Apr 25, 2010 at 10:28 AM, Bai Shuwei <baishuwei@gmail.com> =
wrote:
>>>> Hi, All:
>>>> =A0 =A0The usb device support READ(10) command, but how i send it =
to usb
>>>> device with assembler language? Thanks for you response!
>>>>
>>>> Best regards
>>>>
>>>> Bai Shuwei
>>>>
>>>> --
>>>> Love other people, as same as love yourself!
>>>> Don't think all the time, do it by your hands!
>>>>
>>>> E-Mail: baishuwei@gmail.com
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-as=
sembly" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-ass=
embly" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>>
>>
>>
>> --
>> Love other people, as same as love yourself!
>> Don't think all the time, do it by your hands!
>>
>> E-Mail: baishuwei@gmail.com
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-asse=
mbly" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

E-Mail: baishuwei@gmail.com
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
