From: Lawrence <lawrencio@hotpop.com>
Subject: Re: reply to jeff message
Date: Thu, 18 Sep 2003 16:04:05 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F6966F5.7020809@hotpop.com>
References: <3F6906D4.6050008@hotpop.com> <200309180913.20136.wklux@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200309180913.20136.wklux@yahoo.co.uk>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

peter w krause ??:

>Lawrence am Donnerstag, 18. September 2003 02:13:
>  
>
>>Hi All,
>>
>>From my experience, I think the most salient problem that hinder people
>>from using assembly as her development tool lies in the absent of a
>>robust assembly debugger.  Although people says gdb is good enough, I
>>still don't know how to treak it to symbolically debug my intel-syntax
>>asm program.  I've also try ald before, but I think it's the problem of
>>nasm, it cannot show the symbols too.
>>    
>>
>
>latest version can. the older one can be patched:
>re http://www.lxhp.in-berlin.de/lhplinks.html#ald
>  
>
Hi hp, thanks for your advice. I've tried this version of ald before, 
but still can't get full symbolic capability. I believe the problem is 
not attributed to ald, but the inability of nasm to generate proper 
debugging information to the debugger. I've also tried the amended nasm 
version you've post on your site too, but I still encounter failure.

If I am wrong on this point, would you please instruct me how to setup 
the debugging environment? For instance, which version of nasm/ld/ald 
should use, and if there are any parameter needed to be set during 
compliatoin, etc. After all, ald is much more similiar with the 
environment that I am using now.

>>After I got the gift from Jeff, I've tried it out all night,  and I
>>finally figure out how to debug my asm program symboliclly under kdbg,
>>with his suggestion of using another version of nasm.  With Jeff's tool,
>>I finally can tried to start doing the porting.
>>    
>>
>
>did I miss something?
>
>  
>
What do you mean about this? I am not quite understand...

>best,
>	hp
>
>  
>
Thanks and Regards,
Lawrence

