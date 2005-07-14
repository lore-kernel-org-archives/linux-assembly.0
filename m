From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: prime numbers
Date: Wed, 13 Jul 2005 22:51:23 -0400
Message-ID: <42D5D32B.8050204@comcast.net>
References: <42D59858.8060404@gmail.com> <42D5AE75.4030100@comcast.net> <42D5CC32.4080905@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42D5CC32.4080905@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Irofti <bulibuta@gmail.com>
Cc: linux-assembly@vger.kernel.org

Paul Irofti wrote:

...
> ok, so than what's the diffrence between:
> a) movb $test, %al
> b) movb test, %al
> c) movb (test), %al
> c) movb ($test), %al      #if this exists!

Hmmm, I'm actually Nasmist, not an as user, but...

> and how come when i access kernel ops i use $<oper>
> 
> i.e. movl $__NR_write, %eax    #i actually append the address 1?! not 
> put the value 1?!

I perhaps shouldn't have said "address"... As I understand it, the '$' 
indicates an "immediate" value. "movl $4, %eax" (or $__NR_write) moves 
the value 4 into %eax. "movl 4, %eax" would move the contents of address 
0x00000004 into %eax - except that it segfaults because 0x00000004 isn't 
in "your" address space.

Maybe an actual (G)as user can clarify it better. It *is* confusing - if 
it were easy, everybody'd be doing it! :)

Best,
Frank

