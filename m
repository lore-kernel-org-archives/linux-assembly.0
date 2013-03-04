From: Robert Plantz <plantz@sonoma.edu>
Subject: RE: how to use .section command in asm code?
Date: Mon, 4 Mar 2013 15:31:35 +0000
Message-ID: <6E3CF6FDA48EC747AAAE0EAEDF16EFF802C7E62F@coronet.solar.sonoma.edu>
References: <20130303195050.GA3236@debian.localdomain>,<CAN0_x-JmEGNH+efO0z86GFx1CepZwFqJXp-05bgcCXL9AO7LEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <CAN0_x-JmEGNH+efO0z86GFx1CepZwFqJXp-05bgcCXL9AO7LEg@mail.gmail.com>
Content-Language: en-US
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: Sofiane Akermoun <akersof@gmail.com>, ishare <june.tune.sea@gmail.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Actually, the terminology is "assembler directive", "assembly directive", "pseudo opcode", "pseudo-operation", or "pseudo-op". They direct the assembler to do things as it assembles the source file. For example, as Sofiane points out, ".section .text" tells the assembler to place what follows in the .text segment of the object code. I recommend reading http://en.wikipedia.org/wiki/Assembly_language

(I recognize that computer programming language terminology is largely English-centric, and that English is not the native language for (probably) most programmers in the world.)

--Bob Plantz

________________________________________
From: linux-assembly-owner@vger.kernel.org [linux-assembly-owner@vger.kernel.org] on behalf of Sofiane Akermoun [akersof@gmail.com]
Sent: Sunday, March 03, 2013 10:06 PM
To: ishare
Cc: linux-assembly@vger.kernel.org
Subject: Re: how to use .section command in asm code?

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
--
To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html