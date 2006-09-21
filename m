From: Henio Paszczak <blurrpp@yahoo.com>
Subject: Re:hinit?
Date: Thu, 21 Sep 2006 10:59:59 -0700 (PDT)
Message-ID: <20060921175959.94340.qmail@web50301.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Thank You for answer ( sorry but i couldn't write
earlier ). It explain me many things but i steel
receive the same results:

1)Program which  uses the same registers one by one
works 
4% faster then when it uses different.

> Second I've always trying not to use memory because
> its extremely slow .
>
> nut again if i exchange value between registers with
> using temporary memory:
>
> movl %eax,temp
> movl %ebx,%eax,
> movl temp,%ebx
>
> it works faster than:
>
> movl %eax,%edx
> movl %ebx,%eax,
> movl %edx,%ebx
>
> WHY? maybe linux is doing something in the mean time
> ... ?

>Where did you get that result? On my machine, the
>version using memory 
>is 1.5x 
>slower than register-only, as expected.

I received this by 'time' command. It shows that
program using only registers is about 16% slower then
exchanging with memory. "Program" moves values 2^29
times.( is there any way to check duration of program
with less then 0.001s accuracy ? any clock in bios ? )

Any way i'm steel looking for some hints that could
make my programs work faster :).

Lukas


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
