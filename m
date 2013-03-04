From: Sofiane Akermoun <akersof@gmail.com>
Subject: Re: how to use .section command in asm code?
Date: Mon, 4 Mar 2013 07:06:36 +0100
Message-ID: <CAN0_x-JmEGNH+efO0z86GFx1CepZwFqJXp-05bgcCXL9AO7LEg@mail.gmail.com>
References: <20130303195050.GA3236@debian.localdomain>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=LoBKYFVatZai+Mi0h2Jrbg/y7iAJRAMRC7QGCc7SF20=;
        b=S0UpXaRf65oGrhEkrs7SaAsInHVJJRJ+2F1OR0Buc4gbS7r986nsgIu5WSwlKbEqKd
         IGRybbC3A1a1WI6DmdQ1au6AEzpPpSvSZCgzIxXHW5kuM2l8BLgrhbwW9XGaoM06Du72
         8+a0c32SIp9bHDV9Su7RN/w6/AmAG67plm7DgIw1fKAXV1qOvXiKSqa6arPSsmipdo3Z
         F3nxTjMr9uJ5krahIy6bUacGOSgPQN4J8iDNulM8i/D67BVCLep9yDoOqtjERY3GGzMT
         x1sXfgud4VKJtIM9M5PXchVc6gB0g63f+RZnbWK7xaoPB9L4EmzstREVROZiGOEZsf1v
         B+iA==
In-Reply-To: <20130303195050.GA3236@debian.localdomain>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ishare <june.tune.sea@gmail.com>
Cc: linux-assembly@vger.kernel.org

This is not a command.
.section is a keyword related to your assembler syntax, probably gas
in your case.
A binary should have a section containing the code.
with gas we declare it with: .section .text with nasm we declare it
with section .text
We write below this tag all the executable code.
A binary could need data of course we create a section containing all
the data with .section .data with gas.
Your asm source file should be like this:
#some headers here
.section .data
    #initialized data here

.section .text
    global _start
    _start:
           #the executable code

regards,

Sofiane Akermoun


2013/3/3 ishare <june.tune.sea@gmail.com>:
>
> can .section command be used in asm code to define a section ?
>
> is there any examples?
>
>
> thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Sofiane AKERMOUN
akersof@gmail.com
