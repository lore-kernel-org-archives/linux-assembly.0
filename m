From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: interupts...
Date: Mon, 23 Sep 2002 15:26:19 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <7323.08653318814$1032787729@news.gmane.org>
References: <Pine.LNX.4.44.0209231456470.21172-100000@zodiac.mimuw.edu.pl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0209231456470.21172-100000@zodiac.mimuw.edu.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mateusz Srebrny <ms189442@zodiac.mimuw.edu.pl>
Cc: linux-assembly@vger.kernel.org



On Mon, 23 Sep 2002, Mateusz Srebrny wrote:

> Date: Mon, 23 Sep 2002 15:04:42 +0200 (CEST)
> From: Mateusz Srebrny <ms189442@zodiac.mimuw.edu.pl>
> To: linux-assembly@vger.kernel.org
> Subject: interupts...
> 
> Hi!
> 
> This question is out of concern of this group (I think).
> But...
> 
> Does proccessor (somehow) know if an interrupt it gets was hard- or soft- 
> ware generated? I mean if hard disk finishes for example his asynchronous 
> IO operation it generates the disk interrupt. But if I want something from 
> the disk I do it all the same... 

If it is software generated it is in the procesor itself (int instruction)
if Hardware, there is I think one PIN called INTA on processor.

Through this "wire" is ALL  hardware requesting interrupt.


  Hardware -> IRQ lines 0-15  -> PIC (Programemble interrupt controller) 
-> "INTA" Pin of procesor.  

Hope someone will correct me if I'm not right but this is basic idea.
> 
> Is there the same int-handler for hardware and for software, but the 
> execution differs by means of some parameters? Or there are two separate 
> interrupt accidentally called by the same number?
> 

No HW and Software can be mixed togehter.

INT 5 -> bound exeption has same handler as for Printscreen for 
example.(Under DOS)

Regards
		Rudolf
 


