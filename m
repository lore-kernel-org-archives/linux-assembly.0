From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: writing to the videoram
Date: Mon, 16 Jun 2003 08:43:38 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3EED671A.9000007@eprocess.fr>
References: <00cf01c3336a$92240550$0145a8c0@icepic>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <00cf01c3336a$92240550$0145a8c0@icepic>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: icepic <icepic1984@gmx.de>
Cc: linux-assembly@vger.kernel.org

icepic wrote:

>Hi!
>
>I have a problem.
>I want to write directly to the videoram under linux.
>Because of the realmode i have some problems..
>can someone explain how it works?
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>
realmode ?!?
Hey, on which cpu are you??? ;-)
I guess you are on x86 architecture, so, some explainations:
- x86 have 3 main modes of use: real, virtual and protected (plus a 
usefull hybrid: flat)
- Linux is on protected mode
- the bootloader (lilo, grub) make the switch from real mode (when you 
switch on your PC, it is in real-mode, for 8086 compatibility!) to the 
protected mode.

If you want to write to the video memory, one basic thing would be to 
write it from the kernel (who have the right to read/write everywhere). 
 From the user-space, you'll have to ask the write access to the kernel.

Could you please ask a more precise question?!?

Fred

