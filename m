From: DieJaenickes@t-online.de (Alexander =?iso-8859-1?q?J=E4nicke?=)
Subject: Re: GRUB sample kernel question
Date: Sat, 1 Nov 2003 22:24:24 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311012224.25240.DieJaenickes@t-online.de>
References: <Law9-F40TZiqpJjmH4P000039ed@hotmail.com> <oprxh599q8b2epmx@localhost> <3FA3E836.4070709@curvesoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FA3E836.4070709@curvesoft.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ram <ram@curvesoft.com>, linux-assembly@vger.kernel.org

Am Samstag, 1. November 2003 18:07 schrieb ram:
> Hi,
>
> I was looking at the toy kernel in the grub distribution (multiboot.h,
> kernel.c, boot.S
> in the 'docs' subdirectory) and noticed boot.S starts out like this:
>
>     .globl    start, _start
> start:
> _start:
>     jmp    multiboot_entry
>     ....
> multiboot_entry:
>
> I'm wondering why this jump is needed; couldn't the start/_start labels
> simply have
> been placed adjacent to the multiboot_entry label thereby avoiding the
> jump ?
>
> Thanks.
>
> Ram


No, this jump is necessary for making sure that the cs register is initialised 
correctly. Every BIOS loads the bootloader to physical address 0x07c00. 
Normally cs=0 and ip=0x7c00, but to be on the safe side, you should make a 
far-jump. That's why code in most bootloaders begins with a 
jmp 0x0000:StartAddr or jmp 0x07c0:StartAddr, dependent on whether the 
location counter started at 0x0000 or 0x07c0.
If you are interested in os development, have a look at 
http://www.nondot.org/sabre/os/articles

Alex
