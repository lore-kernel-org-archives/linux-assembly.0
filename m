From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: interupts...
Date: Mon, 23 Sep 2002 15:46:54 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D8F1B4E.6050808@eprocess.fr>
References: <Pine.VMS.3.91-2(vms).1020923151918.31945B-100000@cs.felk.cvut.cz>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Cc: Mateusz Srebrny <ms189442@zodiac.mimuw.edu.pl>, linux-assembly@vger.kernel.org

Rudolf Marek wrote:

>On Mon, 23 Sep 2002, Mateusz Srebrny wrote:
>
>  
>
>>Date: Mon, 23 Sep 2002 15:04:42 +0200 (CEST)
>>From: Mateusz Srebrny <ms189442@zodiac.mimuw.edu.pl>
>>To: linux-assembly@vger.kernel.org
>>Subject: interupts...
>>
>>Hi!
>>
>>This question is out of concern of this group (I think).
>>But...
>>
>>Does proccessor (somehow) know if an interrupt it gets was hard- or soft- 
>>ware generated? I mean if hard disk finishes for example his asynchronous 
>>IO operation it generates the disk interrupt. But if I want something from 
>>the disk I do it all the same... 
>>    
>>
>
>If it is software generated it is in the procesor itself (int instruction)
>if Hardware, there is I think one PIN called INTA on processor.
>
>Through this "wire" is ALL  hardware requesting interrupt.
>
>
>  Hardware -> IRQ lines 0-15  -> PIC (Programemble interrupt controller) 
>-> "INTA" Pin of procesor.  
>  
>
right, you have to reset this line at the end of the interrupt handler 
(by the good 8259 port, something like out 20h,20h for the first, if i 
remember well)

>Hope someone will correct me if I'm not right but this is basic idea.
>  
>
>>Is there the same int-handler for hardware and for software, but the 
>>execution differs by means of some parameters? Or there are two separate 
>>interrupt accidentally called by the same number?
>>
>>    
>>
>
>No HW and Software can be mixed togehter.
>
>INT 5 -> bound exeption has same handler as for Printscreen for 
>example.(Under DOS)
>
>Regards
>		Rudolf
>  
>
hum, we can make a
pushf
call 0:5*4
it will call the int 5.
I think that hw and sw may be mixed in an int handler (i find it ugly, 
but...)

You can also program the 8259 to map IRQ to other interrupts than those 
by default.
When bios take the control, in boot stage, it maps
irq 0-7 to ints 8-f and irq 8-f to ints 70-77.
But you can change that , and make irq 0-7 points to 90-97 and irq 8-f 
to interrupts 98-9f if you want to!


Fred

> 
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>



