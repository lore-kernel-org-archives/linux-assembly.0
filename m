From: ram <ram@curvesoft.com>
Subject: Re: GRUB sample kernel question
Date: Sat, 01 Nov 2003 14:36:01 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FA43551.1020806@curvesoft.com>
References: <Law9-F40TZiqpJjmH4P000039ed@hotmail.com> <oprxh599q8b2epmx@localhost> <3FA3E836.4070709@curvesoft.com> <200311012224.25240.DieJaenickes@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200311012224.25240.DieJaenickes@t-online.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Alexander_J=E4nicke?= <DieJaenickes@t-online.de>
Cc: linux-assembly@vger.kernel.org

Alexander J=E4nicke wrote:

>Am Samstag, 1. November 2003 18:07 schrieb ram:
> =20
>
>>Hi,
>>
>>I was looking at the toy kernel in the grub distribution (multiboot.h=
,
>>kernel.c, boot.S
>>in the 'docs' subdirectory) and noticed boot.S starts out like this:
>>
>>    .globl    start, _start
>>start:
>>_start:
>>    jmp    multiboot_entry
>>    ....
>>multiboot_entry:
>>
>>I'm wondering why this jump is needed; couldn't the start/_start labe=
ls
>>simply have
>>been placed adjacent to the multiboot_entry label thereby avoiding th=
e
>>jump ?
>>
>>Thanks.
>>
>>Ram
>>   =20
>>
>
>
>No, this jump is necessary for making sure that the cs register is ini=
tialised=20
>correctly. Every BIOS loads the bootloader to physical address 0x07c00=
=2E=20
>Normally cs=3D0 and ip=3D0x7c00, but to be on the safe side, you shoul=
d make a=20
>far-jump. That's why code in most bootloaders begins with a=20
>jmp 0x0000:StartAddr or jmp 0x07c0:StartAddr, dependent on whether the=
=20
>location counter started at 0x0000 or 0x07c0.
>If you are interested in os development, have a look at=20
>http://www.nondot.org/sabre/os/articles
>
>Alex
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assemb=
ly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> =20
>
Thanks for the response but I'm still a little confused: my impression=20
is that this
code is not a bootloader but a sample 32-bit OS loaded by GRUB, so GRUB=
 has
already switched to protected mode when this code starts to execute ?

Ram

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
