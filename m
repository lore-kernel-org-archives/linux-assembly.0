From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: again simple problem under linux
Date: Thu, 13 Nov 2003 10:23:06 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB34D7A.3010406@eprocess.fr>
References: <3FB27DF6.9060003@tiscali.it> <04e301c3a946$5179af80$6501a8c0@rhyde> <3FB2845B.8070508@tiscali.it> <200311130352.01362.wklux@yahoo.co.uk> <3FB3535C.3070104@tiscali.it>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FB3535C.3070104@tiscali.it>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: zad <zacido@tiscali.it>
Cc: linux-assembly <linux-assembly@vger.kernel.org>

it is pretty easy:
get the lilo source, and remove all around the first.S in the makefile.
Then, you'll see some 'dd' calls, to get only the good part of your prog.
It took me one hour to make the framework of my own boot loader this way!
You'll have to code it in 100% assembly, but it is very easy (not linux 
related though), in real mode, bios calls for disk access, ...
Read the documentation and have a look at the lilo first.S code!

Then, to test it (raw basic way):
- get a spare HD (more secure)
- put your resulting code into the MBR (dd if=your_resulting_bin 
of=/dev/hdc for exemple)
- add the entry to your lilo.conf file (other=/dev/hdc)
- try it with lilo! (you'll need to reboot), then, you'll be able to 
(reboot) get back to your linux

If you need some more specific help, feel free to ask more precise question!

Fred

zad wrote:

> thanks a lot ..peter & C.
> I have another question .
> I'm tring to make a bootloader for a system start up , so whene a pc 
> starts up (if it has a IA32) uses the real mode (this is way I won't 
> use the Linux'syscalls)
> But how can I test that code on a linux machine ?
> Is It just not possible?
> And how can I merge more executable files in one to use it at the boot?
> I read some papers about the boot and all makes reference at the Ralf 
> Brown's list for read from floppy , set the video mode and so on.
> Do u know where can I have more informations?
> thanks at all
> by zad
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


