From: Lawrence <lawrencio@hotpop.com>
Subject: Re: linux system call for allocation of memory
Date: Thu, 13 Nov 2003 17:37:15 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB350CB.5060401@hotpop.com>
References: <3FB33D54.9000605@cbf.chinese2000.net> <3FB35AA4.4050404@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FB35AA4.4050404@tiscali.it>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: zad <zacido@tiscali.it>
Cc: linux-assembly@vger.kernel.org

Thanks for your reply zad.

I just browsed the list of linux system call again, and didn't find any 
related to either memory allocation or release. Does this imply one must 
write linux asm program in flat model?

Thanks
Lawrence

zad ??:

>
>
> Lawrence wrote:
>
>> Hi Linux asm gurus,
>>
>>
>> I would like to know if the linux kernel has the syscall for memory
>> manipulation(allocation, release and resize) that synonymous with DOS
>> 48H of INT 21. I've read some documents saying that these are
>> implemented in C library.
>>
>> I know that I can use the flat memory model, but I would like to take
>> the allocaion/release approach, for easy porting my current DOS program
>> to Linux.
>>
>> Thanks
>> Lawrence
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-assembly" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>
> So :
> 1) If u want call a linux'system call u need to use the interrupt 0x80 
> with the follown convenctions:
> -eax contains the syscall number
> -ebx ecx edx esi edi the first argument ,second ,and third and so one 
> till the six
> -the return value of a syscall is stored in eax reg.
> 2) a complete list of sys call is in the file 
> /linux/include/asm/unistd.h where linux is the base tree of the kernel 
> source.
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>


