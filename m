From: Philip Jacob Smith <pj@evobsyniva.com>
Subject: Re: newbie :adding larger value
Date: Thu, 27 Nov 2003 10:20:58 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprzax88scb2epmx@localhost>
References: <20031127124723.6b3aeb07.vadiraj@mail.cyberneme.com> <3FC5B0C5.9040009@eprocess.fr>
Reply-To: pj@evobsyniva.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FC5B0C5.9040009@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

> jnc no_lowcarry      : if no carry, just add the upper 32bits
>     inc ecx            ;if carry, increments the upper 32bits
> no_lowcarry:

Oh my god...

Ok, this is real easy now.  Say we have two 64-bit numbers, as such:

big_one dd 1, 2
big_two dd 3, 4

In normal intel backwardness (the right way, btw) 1 and 3 are the least signifigant dwords.

It's as easy as this:

add [big_one+0], [big_two+0]
adc [big_one+4], [big_two+4]

or, if you prefer code that compiles:

mov eax, [big_two]
add [big_one], eax
mov eax, [big_two+4]
adc [big_one+4], eax

jc overflow_handler

You just go from least signifigant to most signifigant adding them together, and use 'add' for the first and 'adc' for each one after that, and when you're done, the carry flag is the same as if you had added just one number, the 'jc overflow_handler' will jump only if the answer in this case would not fit into 64 bits.  To subtract you do exactly the same thing, just using sub and sbc.
