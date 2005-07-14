From: Paul Irofti <bulibuta@gmail.com>
Subject: Re: prime numbers
Date: Thu, 14 Jul 2005 05:21:38 +0300
Message-ID: <42D5CC32.4080905@gmail.com>
References: <42D59858.8060404@gmail.com> <42D5AE75.4030100@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42D5AE75.4030100@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Kotler <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

Frank Kotler wrote:

> Paul Irofti wrote:
>
> ...
>
>> sieve.o(.text+0x1):sieve.s:20: relocation truncated to fit: R_386_8 
>> .data
>
>
> ...
>
>>     movb $test, %dl
>
>
> Pretty sure you want "movb test, %dl" - "$test" indicates that you're 
> trying to move the *address* of your "test" variable (not the 
> contents) into %dl... and it won't fit! (...etc.)
>
> Best,
> Frank
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
ok, so than what's the diffrence between:
a) movb $test, %al
b) movb test, %al
c) movb (test), %al
c) movb ($test), %al      #if this exists!

and how come when i access kernel ops i use $<oper>

i.e. movl $__NR_write, %eax    #i actually append the address 1?! not 
put the value 1?!

these are very confusing stuff for me. and i would greatly apreciate it 
if explained! thanks a lot Frank!
