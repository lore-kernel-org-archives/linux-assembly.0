From: fmarmond@eprocess.fr
Subject: Re: compiler error
Date: Sun, 25 Jul 2004 13:54:31 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1090756471.41039f7726d97@intranet.eprocess.fr>
References: <opsbnrjub8jku7fn@smtp.wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <opsbnrjub8jku7fn@smtp.wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pawel Pustelnik <pawelpus@wp.pl>
Cc: linux-assembly@vger.kernel.org

Hi, 
 
It would be easier to help you if you send the code... 
What is in the "..." ? => __asm__ __volatile__(...) 
 
If you don't want, try to investigate in those ways: 
- if you have gcc 3.x, add the '-save-temps' option. 
It will save the temporary files, and you can have a look at them (how the 
assembly is generated) 
- if you have gcc 2.x, there are similar options, but I don't remrember which 
- have a look at compiler options. 'movq' is for 8 bytes long, and I don't 
know if your compiler can understand it (for 'standard' 32 bits cpu, movl (4 
bytes) is the maximum). Try to enable specific cpu architecture if needed 
(-march=athlon or something like that) 
 
Fred 
 
 
 
Selon Pawel Pustelnik <pawelpus@wp.pl>: 
 
> Hi, 
>  
> I used assembler code in my cpp code 
> ( __asm__ __volatile__(...) ) 
> This assembler's syntax is ok but i can not compile my application 
> because after "g++ my_apps.cpp" I get: 
>  
> /tmp/ccADrA0k.s: Assembler messages: 
> /tmp/ccADrA0k.s:3637: Error: too many memory references for `movq' 
>  
> Maybe I do not know something about inline assembler? 
>  
> --  
> Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/ 
> - 
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in 
> the body of a message to majordomo@vger.kernel.org 
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 
>  
>  
 
 
 

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
