From: Paul Irofti <bulibuta@gmail.com>
Subject: Re: prime numbers
Date: Thu, 14 Jul 2005 06:02:23 +0300
Message-ID: <42D5D5BF.9040300@gmail.com>
References: <42D59858.8060404@gmail.com> <42D5AE75.4030100@comcast.net> <42D5CC32.4080905@gmail.com> <42D5D32B.8050204@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42D5D32B.8050204@comcast.net>
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
>> ok, so than what's the diffrence between:
>> a) movb $test, %al
>> b) movb test, %al
>> c) movb (test), %al
>> c) movb ($test), %al      #if this exists!
>
>
> Hmmm, I'm actually Nasmist, not an as user, but...
>
>> and how come when i access kernel ops i use $<oper>
>>
>> i.e. movl $__NR_write, %eax    #i actually append the address 1?! not 
>> put the value 1?!
>
>
> I perhaps shouldn't have said "address"... As I understand it, the '$' 
> indicates an "immediate" value. "movl $4, %eax" (or $__NR_write) moves 
> the value 4 into %eax. "movl 4, %eax" would move the contents of 
> address 0x00000004 into %eax - except that it segfaults because 
> 0x00000004 isn't in "your" address space.
>
> Maybe an actual (G)as user can clarify it better. It *is* confusing - 
> if it were easy, everybody'd be doing it! :)
>
> Best,
> Frank
>
>
thanks man!

i had the same problems with syntax and address/value access in MASM 
when i started, now, i see myself hitting the same spot in the *nix 
world of assembly:))

well, i'm blown off, it's 6am here, i need some sleep, hopefully someone 
will make my morning..eh! afternoon... sweeter with a short lesson on 
the issue!

bye!
