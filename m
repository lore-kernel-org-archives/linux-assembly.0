From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: calling bios interrupt from kernel
Date: Tue, 25 Nov 2003 08:56:32 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FC30B30.2050501@eprocess.fr>
References: <Pine.VMS.3.91-2(vms).1031124231514.55666F-100000@cs.felk.cvut.cz>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.VMS.3.91-2(vms).1031124231514.55666F-100000@cs.felk.cvut.cz>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Cc: linux-assembly@vger.kernel.org

Yeah!

I didn't know this lib (can be found as part of svgalib for those who care).

"unclean" is less than the reality! ;)
The graphic chip is a cyber5000, and the kernel driver only handles 
(few) vga modes.
I'm working on the TV output, in PAL format. I can't manage to set good 
timings (but almost), and the main problem is the interlaced mode I just 
cannot set correctly.
TVIA's doc is very poor (and we can't offer ourself the TVIA SDK that 
cost a lot)... I hope that I'll find some tools in the video BIOS for that.

By the way, do you have any tip for setting TVout to PAL mode in a 
cyberpro graphic chip?

Thanks Rudolf for pointing this lib.

Fred

Rudolf Marek wrote:

>Yes its possible but "unclean"
>
>Look for lrmi library.
>
>Or read the FAQ section on http://linuxassembly.org
>
>
>Regards
>
>
>Rudolf
> 
>On Mon, 24 Nov 2003, Frederic Marmond wrote:
>
>  
>
>>Date: Mon, 24 Nov 2003 16:35:21 +0100
>>From: Frederic Marmond <fmarmond@eprocess.fr>
>>To: linux-assembly@vger.kernel.org
>>Subject: calling bios interrupt from kernel
>>
>>I'm working on a graphic card for which I have only a binary driver, 
>>without sources.
>>
>>I would want to get started by calling the int 0x10 in a vm86 environment.
>>Does anybody tried something like this? Is there any way to succeed?
>>
>>Any info would be welcome!
>>Thanks in advance.
>>
>>Fred
>>
>>-
>>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>    
>>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>


