From: Robert G. Plantz <plantz@sonoma.edu>
Subject: Re: OFF-TOPIC : Confusion about basic C program behaviour
Date: Thu, 10 Mar 2005 08:23:23 -0800
Message-ID: <b53955c58d37e2d3a2137e960f23e579@sonoma.edu>
References: <20050310115414.47387.qmail@web41101.mail.yahoo.com>
Mime-Version: 1.0 (Apple Message framework v619.2)
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050310115414.47387.qmail@web41101.mail.yahoo.com>
Sender: kernelnewbies-bounce@nl.linux.org
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <linux-assembly.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:ecartis-owner@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ruxyz@yahoo.com
Cc: Assembly Linux <linux-assembly@vger.kernel.org>, Stephen Ray <steve@mrmighty.net>, Linux Kernel Newbie <kernelnewbies@nl.linux.org>

This makes a good case for using explicit type casting.

I urge my students to do that because it explicitly shows what
you are intending to do for the person who has to maintain
your code. In other words, some implicit documentation.

Actually, I like to use separate variables, do my type
casting, then pass the appropriate argument. In these days
where CPUs have floating point and integer units that
can work in parallel, I doubt there would be a performance
hit.

Bob

On Mar 10, 2005, at 3:54 AM, Learner wrote:

> Hi Stephen ,
>
>    Thanks for catching the float to double promotion
> in printf . The man page below confirms this .
>
> #> man 3 printf
>
> <snip>
> The conversion specifier
>
> f,F -
>
> The  double  argument  is  rounded  and  converted  to
>  decimal  notation  in the style [-]ddd.ddd, where the
> number of digits after the decimal-point character  is
>  equal  to the  precision  specification.   If  the
> precision is missing, it is taken as 6; if the
>      precision is explicitly zero, no decimal-point
> character appears.  If a  decimal  point
> appears, at least one digit appears before it.
>
> <snip>
>
>
>     Just to confirm my understanding, if the code was
> changed as below :-
>
> printf(" CASE 3 : d-f > %d - %f \n\n", (int)a1, a2);
>
> only the first 32 bits of the float data a1 would be
> put on stack & then the 64 bit float value .
>
> This would be because printf is implemented as a
> var args function , so everything is literally copied
> to the stack.
>
> Hence, the output would be correct.
>
> Thanks for fixing my basics !
>
> --- Stephen Ray <steve@mrmighty.net> wrote:
>> Just a thought, but not a particularly educated one.
>>  Compiling with
>> -Wall gives me:
>>
>> test.c:4: warning: return type defaults to `int'
>> test.c: In function `main':
>> test.c:15: warning: int format, double arg (arg 3)
>> test.c:16: warning: int format, double arg (arg 2)
>> test.c:18: warning: int format, double arg (arg 2)
>> test.c:18: warning: int format, double arg (arg 3)
>> test.c:20: warning: control reaches end of non-void
>> function
>>
>> Looks like maybe the floats are automatically
>> promoted to doubles before
>> they are passed to printf.  I don't know if that's
>> standard behaviour,
>> but it seems reasonable.  So then in the first case,
>> two 64-bit values
>> are put on the stack, and two 64-bit values are
>> taken off the stack.
>>
>> In the second case, two 64-bit values are put on the
>> stack, one 64-bit
>> value is taken off the stack and presented
>> correctly, and one 64-bit
>> value has only the first 32 bits read, and
>> misinterpreted as a signed int.
>>
>> In the third case, two 64-bit values are put on the
>> stack, and the first
>> 32 bits are interpreted as the first signed int, and
>> the second next 64
>> are interpreted as a double.  So case 3 is different
>> from case 2 in that
>> the double value in case 3 is made up of two halves
>> of two different
>> doubles, while in case 2 the double is made from an
>> actual double.
>>
>> Or something like that.
>>


--
Kernelnewbies: Help each other learn about the Linux kernel.
Archive:       http://mail.nl.linux.org/kernelnewbies/
FAQ:           http://kernelnewbies.org/faq/

