From: zad <zacido@tiscali.it>
Subject: Re: linux system call for allocation of memory
Date: Thu, 13 Nov 2003 10:19:16 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB35AA4.4050404@tiscali.it>
References: <3FB33D54.9000605@cbf.chinese2000.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org



Lawrence wrote:
> Hi Linux asm gurus,
> 
> 
> I would like to know if the linux kernel has the syscall for memory
> manipulation(allocation, release and resize) that synonymous with DOS
> 48H of INT 21.  I've read some documents saying that these are
> implemented in C library.
> 
> I know that I can use the flat memory model, but I would like to take
> the allocaion/release approach, for easy porting my current DOS program
> to Linux.
> 
> Thanks
> Lawrence
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

So :
1) If u want call a linux'system call u need to use the interrupt 0x80 
with the follown convenctions:
	-eax contains the syscall number
	-ebx ecx edx esi edi the first argument ,second ,and third and 			so 
one till the six
	-the return value of a syscall is stored in eax reg.
2) a complete list of sys call is in the file 
/linux/include/asm/unistd.h where linux is the base tree of the kernel 
source.

