From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: different asm code
Date: Mon, 18 Feb 2013 16:54:19 +0100
Message-ID: <CAN0_x-LUExqeQTyKGSmB0pRMxBDNVZF3Qgd9qiDT2CQeke6XGg@mail.gmail.com>
References: <20130218050630.GA11240@debian.localdomain>
	<CADtGFvkFR_rGnC18Z+yYFObtVOAQPXo1KrrNfT1_kOb-3Zg4XQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=h3PmBtIKeMc40RWYcqbPFdavZ4I10UkASUITrxRW1pc=;
        b=vYYUziVf90GkucbaM5HPPt/KeRshTtzXcnSm6AyTts2+qzTF5yoX+33zUaQD89kRcu
         r2RByWzpYCDY9oBbtiZfUx67OEoVrav23m2frWQOJDccnBm1U5pkrM9kzoT/sqQlNA3D
         /0vWgw9DTV8hHfwRHY8zepPrUKkvtF0OvtkhMULhu1chqCD8m58h/NGFEBfhLcfaODSi
         0hRDy2J9ftfBwX+6xVL92NX7RNJ8Hfqfgn+cECv6kf/bKdsSh+TYTYSbMxh0DrAMkd4c
         RFwZOf7FEkHGMbsFzoK9Z5po1YPHfSkY+9Hj3OFrbaDkMCP4TfymB0BKzPHgVQ+YIEA0
         Nx0g==
In-Reply-To: <CADtGFvkFR_rGnC18Z+yYFObtVOAQPXo1KrrNfT1_kOb-3Zg4XQ@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvjunk@gmail.com>
Cc: horseriver <horserivers@gmail.com>, linux-assembly@vger.kernel.org

a nice trick too:
push 0
pop register

We could start writing some metamorphic code to zeroed something :)

Horseriver you really have to search a bit yourself before spamming
this mailling list. I would mean your are sometimes asking question
that could be answerd in few seconds by google.
An advice if you need quick answers for short questions there are
really good irc chan for assembler stuff, freeonde as a good one #asm
and efnet too like #assembly, #win32asm or #asm, you have to try.

for you information, compiler and assembler can choose what is the
best way to generate code, loop etc. If he find something redundant he
can try to optimize it. sometimes he prefers to xor a register to
zeroed it, sometimes he prefers to mov 0 into the register.
You have to check optimization option of your assembler/compiler.

but if you really have something weird or interesting as wrote Hendrik
Visage paste code here.

regards,

Sofiane Akermoun

2013/2/18 Hendrik Visage <hvjunk@gmail.com>:
> On Mon, Feb 18, 2013 at 7:06 AM, horseriver <horserivers@gmail.com> wrote:
>> hi:)
>>
>>   I have compiled a .S file ,using command gcc -c x.S -o x.
>>   Then I use objdump to look up its asm code, even find that some code is not the
>>   same as that .S file , more important is , some code in origin  .S file has disappear .
>>
>>   what is about the reason ? If it is due to version , why some code chould get lost after compile?
>
> Give examples please.
>
> There are several "similar"/equivalent code/instructions that the
> assembler could chose from.
>
> Ie. to zero a register, you could
> 1) mov REGISTER,0
> 2) xor REGISTER, REGISTER
> 3) mv REGISTER,g0 (on a SPARC where g0 is always zero)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
