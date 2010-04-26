From: Frederic Marmond <fmarmond@gmail.com>
Subject: Re: how to send the READ(10) command to usb device by assembler 
	language?
Date: Mon, 26 Apr 2010 11:47:34 +0200
Message-ID: <j2led8e3c011004260247pbff467a9p6848e60fbe4a8743@mail.gmail.com>
References: <i2jf3566d61004250728w244ffad9hf74b0c6c3bd61b4b@mail.gmail.com> 
	<z2p41279cd11004251909n9a80fa6bz1cfccb9c2c407aea@mail.gmail.com> 
	<m2gf3566d61004260232q5c89bc33z6cc627deff93b37e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=g7vSv4CfIjAdBbHzXNwFFGPtrIIq3Uei6wV2Z/kBvjA=;
        b=hgQV6btJuLbfODsJpNMp58/t8rp/cENjR7YJ0MbNh4gcWekqvBd/OWdhcIxsw5qPr+
         tJjbSJJuPmcWxdvJkJXyk++gg0QrXTlazno6dxJjVXcRiVs0kSULhzXY4G0Z8zJAj/TZ
         +AEzGKevkTlugts8IEny4b8HqRoG2zAcHQ+7U=
In-Reply-To: <m2gf3566d61004260232q5c89bc33z6cc627deff93b37e@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

Hi,
maybe you could have a look at the bios : some bios consider usb hard
drives as 'regular' ide/scsi hard drives, so they can be accessed
transparently by boot loader. So, if your bios supports it, you may
use its default hd functions.

=46red

2010/4/26 Bai Shuwei <baishuwei@gmail.com>:
> On 26 April 2010 10:09, Mike R. <noodlesgc@gmail.com> wrote:
>> I'm no expert, but couldn't you read from the device usb device at /=
dev/bus/usb?
> The /proc/bus/usb is used by the application. But i want to get those
> information in the bootloader.
>
>> --Mike
>>
>>
>>
>> On Sun, Apr 25, 2010 at 10:28 AM, Bai Shuwei <baishuwei@gmail.com> w=
rote:
>>> Hi, All:
>>> =A0 =A0The usb device support READ(10) command, but how i send it t=
o usb
>>> device with assembler language? Thanks for you response!
>>>
>>> Best regards
>>>
>>> Bai Shuwei
>>>
>>> --
>>> Love other people, as same as love yourself!
>>> Don't think all the time, do it by your hands!
>>>
>>> E-Mail: baishuwei@gmail.com
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-ass=
embly" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-asse=
mbly" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
>
> --
> Love other people, as same as love yourself!
> Don't think all the time, do it by your hands!
>
> E-Mail: baishuwei@gmail.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
