From: fmarmond@eprocess.fr
Subject: Re: Device Driver Development in Assembly Language
Date: Tue, 13 Jul 2004 21:56:29 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1089748589.40f43e6d65f80@intranet.eprocess.fr>
References: <1089708694.5852.200244241@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1089708694.5852.200244241@webmail.messagingengine.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fikri Aydemir <facse238@fastmail.fm>
Cc: linux-assembly@vger.kernel.org

Hi,  
Hum... 
You know, drivers stands in kernel stage, and must follow 'standardized' way 
for regestering to the kernel itself. 
What do you teacher wants exactly? 
 
Do the driver's operations in assembly?  
-> embed assembly into a C prog, that will take advantage of all C macros for 
registering driver to kernel (=> teacher wants you to do assembly for its 
speed for particular driver tasks but don't care of the glue around) 
 
or write a .asm that would do all the stuff (teacher wants you to learn 
exactly what a driver must do to register, catch events, perform operations, 
release, ...) which is pretty much longer to write... 
 
I hope you have access to the sys calls at least! 
One tip: if you have to write 100% assembly, write a small driver in C (with 
full debugger options), and decompile it, to see what it does. Then, 
understand the schem, and re-write it in optimized assembly... 
 
If you have more precise questions, feel free to ask, I can answer in nights 
(french time) 
 
good kuck! 
 
Fred 
 
Selon Fikri Aydemir <facse238@fastmail.fm>: 
 
>  
> Hi, 
>  
> I am making a research on device driver development in assembly 
> programming language for linux systems. I know that it is easier to 
> write a device driver in C but my professor wants me to make it in 
> Assembly language, preferably in Intel syntax.  
>  
> Is there anyone who has worked on device driver development? Do you know 
> any resource such as a book or web site which I can benefit from? Thank 
> you...  
>  
> Fikri Aydemir 
> - 
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in 
> the body of a message to majordomo@vger.kernel.org 
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 
>  
>  
 
 
 

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
