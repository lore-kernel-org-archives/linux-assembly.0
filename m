From: "Mike R." <noodlesgc@gmail.com>
Subject: Re: how to send the READ(10) command to usb device by assembler 
	language?
Date: Sun, 25 Apr 2010 22:09:48 -0400
Message-ID: <z2p41279cd11004251909n9a80fa6bz1cfccb9c2c407aea@mail.gmail.com>
References: <i2jf3566d61004250728w244ffad9hf74b0c6c3bd61b4b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=oKqwt8HJIgQ6BhjCgBS7bDoarJ38nG6mTlZMoNZft/g=;
        b=iB5LsoCH7nMAgckMdfzHt41bFWE6hGyFtucwdnbdpmJAG4OTQ8wXB2vxDE/BNGDuNI
         VBYpGBU6nRcVLnSyH6wL11XJnHgsfyBegHrFGA7pm4lH4zLzkIG4OPVlKjP5elJaoYQ0
         7IxmD9GtPhoGNlYrpzPuOqBhQwdA/0aLFUWGI=
In-Reply-To: <i2jf3566d61004250728w244ffad9hf74b0c6c3bd61b4b@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

I'm no expert, but couldn't you read from the device usb device at /dev=
/bus/usb?
--Mike



On Sun, Apr 25, 2010 at 10:28 AM, Bai Shuwei <baishuwei@gmail.com> wrot=
e:
> Hi, All:
> =A0 =A0The usb device support READ(10) command, but how i send it to =
usb
> device with assembler language? Thanks for you response!
>
> Best regards
>
> Bai Shuwei
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
