From: Robert Plantz <plantz@SONOMA.EDU>
Subject: Re: jmp instruction
Date: Sun, 02 Feb 2003 09:02:51 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <2A024D8C-36D0-11D7-BF5A-003065A88832@sonoma.edu>
References: <2338DB4A-36AF-11D7-92D5-000A27B17C58@ticino.com>
Mime-Version: 1.0 (Apple Message framework v551)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <2338DB4A-36AF-11D7-92D5-000A27B17C58@ticino.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matteo Cortonesi <m_cortonesi@ticino.com>
Cc: linux-assembly@vger.kernel.org

I see two problems with your code. (This is at&t syntax,
so I'm assuming you are using gas, etc.)
1. You need to specify a relative jmp.
2. You need to look at a listing file and count the
    number of bytes in the jmp instruction and the
    one(s) you wish to skip.

I got this to work with a
        jmp   .+7
since there are two bytes in the jmp   .+7 and five
bytes in the instruction you wish to skip.

I guess you have a good reason for not simply removing
the instruction or using a label?

-- Bob
On Sunday, February 2, 2003, at 05:06  AM, Matteo Cortonesi wrote:

> (gdb) disas main
> Dump of assembler code for function main:
> 0x8048430 <main>:       push   %ebp
> 0x8048431 <main+1>:     mov    %esp,%ebp
> 0x8048433 <main+3>:     mov    $0x1,%eax
> 0x8048438 <main+8>:     jmp    0xa
> 0x804843d <main+13>:    mov    $0x4,%eax
> 0x8048442 <main+18>:    mov    $0x0,%ebx
> 0x8048447 <main+23>:    int    $0x80
> 0x8048449 <main+25>:    pop    %ebp
> 0x804844a <main+26>:    ret
>
> I need to go 10 bytes forward from main+8 (because 18-8=10) to skip 
> mov $0x4,%eax, so i wrote jmp 0xa. Unfortunately the program causes a 
> segmentation fault (core dumped), and I don't understand why.
> Where did I make the mistake? I know that it's banal question, sorry
-------------------------------------------------------
Robert G. Plantz, PhD			|
Professor of Computer Science	| cs.sonoma.edu/~bob
Sonoma State University			| plantz@sonoma.edu
1801 E. Cotati Ave.				| ph: 707.664.2806
Rohnert Park, CA 94928			| fax: 707.664.3012

