From: Bai Shuwei <baishuwei@gmail.com>
Subject: Re: how to send the READ(10) command to usb device by assembler 
	language?
Date: Mon, 26 Apr 2010 17:32:45 +0800
Message-ID: <m2gf3566d61004260232q5c89bc33z6cc627deff93b37e@mail.gmail.com>
References: <i2jf3566d61004250728w244ffad9hf74b0c6c3bd61b4b@mail.gmail.com>
	 <z2p41279cd11004251909n9a80fa6bz1cfccb9c2c407aea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=O90QRrqFs8AmR0m1zlsaGuGRsrDKvxsPQhiDD2I21ho=;
        b=jsFQLBm2uhyWk7JYMQa2kT9kVEdzXt94KAun7cwXorjqGDfhsA2ATrr1oorCTXp//0
         eyQmJZL9c6oh6VmPdsNXZdRhtSC45DkCY2PfiH2CBNAqBVJCcAbwhtCgzmiwpIn5ZZx7
         0luwApxuMXMb48Y9Hz9iRncOWUeYH4bFyLCxE=
In-Reply-To: <z2p41279cd11004251909n9a80fa6bz1cfccb9c2c407aea@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Mike R." <noodlesgc@gmail.com>
Cc: linux-assembly@vger.kernel.org

On 26 April 2010 10:09, Mike R. <noodlesgc@gmail.com> wrote:
> I'm no expert, but couldn't you read from the device usb device at /d=
ev/bus/usb?
The /proc/bus/usb is used by the application. But i want to get those
information in the bootloader.

> --Mike
>
>
>
> On Sun, Apr 25, 2010 at 10:28 AM, Bai Shuwei <baishuwei@gmail.com> wr=
ote:
>> Hi, All:
>> =A0 =A0The usb device support READ(10) command, but how i send it to=
 usb
>> device with assembler language? Thanks for you response!
>>
>> Best regards
>>
>> Bai Shuwei
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
