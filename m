From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: interupts...
Date: Mon, 23 Sep 2002 15:37:49 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D8F192D.5040901@eprocess.fr>
References: <Pine.LNX.4.44.0209231456470.21172-100000@zodiac.mimuw.edu.pl>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mateusz Srebrny <ms189442@zodiac.mimuw.edu.pl>
Cc: linux-assembly@vger.kernel.org

on x86 architecture, you have two 'pic' (programmable interrupt 
controlers, which are 8259x chips in serial).
In your handler, you can ask them if it is an hard or soft interrupt 
(ports 20h-3fh for the 1rst 8259 and a0h-bfh for the second).
I don't remember exactly which port for this, but you can find docs on 
the net with thoses references.

Other way: test if the hard you are handling is the source of the interrupt.
If you have doc of your hard drive, you may find registers where you can 
find infos about its state.

good luck!

Fred

Mateusz Srebrny wrote:

>Hi!
>
>This question is out of concern of this group (I think).
>But...
>
>Does proccessor (somehow) know if an interrupt it gets was hard- or soft- 
>ware generated? I mean if hard disk finishes for example his asynchronous 
>IO operation it generates the disk interrupt. But if I want something from 
>the disk I do it all the same... 
>
>Is there the same int-handler for hardware and for software, but the 
>execution differs by means of some parameters? Or there are two separate 
>interrupt accidentally called by the same number?
>
>Thanks for any help...
>	Mateusz Srebrny
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>



