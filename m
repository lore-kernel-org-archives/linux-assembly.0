From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: looping_code
Date: Sat, 31 Aug 2002 08:05:32 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <189BA622-BCF3-11D6-B94A-003065A88832@sonoma.edu>
References: <Pine.SGI.4.40.0208310210540.117091029-100000@shell01.TheWorld.com>
Mime-Version: 1.0 (Apple Message framework v482)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.SGI.4.40.0208310210540.117091029-100000@shell01.TheWorld.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org
Cc: Scott Lanning <slanning@theworld.com>


On Friday, August 30, 2002, at 11:17  PM, Scott Lanning wrote:

> On Mon, 26 Aug 2002, ssams wrote:
>> .data
>> msg: .byte 65,10
>>
>> .text
>>    .globl mulai
>> mulai:
>>     mov $10,%edx
>>
>> ulang:
>>   mov $4,%eax
>>   mov $1,%ebx
>>   mov $msg,%ecx
>
> This moves the value at 'msg'
> rather than a pointer to 'msg'.

Sorry, but the gas assembler *will* treat the address
as an immediate. Proof:

When I did this ---
mov $msg,%ecx
leal msg,%edx

and looked in the debugger, I got ---
(gdb) i r
eax            0x4      4
ecx            0x80494c8        134517960
edx            0x80494c8        134517960
ebx            0x1      1

Furthermore, if you look at the listing --
   12 000f B9000000      mov $msg,%ecx
   12      00
   13 0014 8D150000      leal msg,%edx
   13      0000
you see that the leal instruction costs one more byte.

I have only done this in a very simple teaching environment
using linux. I may be missing something here in a dos or
windows environment. On the other hand, one probably would
use gas only in linux.

-- bob

-------------------------------------------------------
Robert G. Plantz, PhD			|
Professor of Computer Science	| cs.sonoma.edu/~bob
Sonoma State University			| plantz@sonoma.edu
1801 E. Cotati Ave.				| ph: 707.664.2806
Rohnert Park, CA 94928			| fax: 707.664.3012

