From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: why overflow flag being set?
Date: Fri, 20 Apr 2007 09:52:21 -0700
Message-ID: <1177087941.4688.28.camel@localhost>
References: <BAY133-F63E64A1F0D134EAE6956AF5560@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-F63E64A1F0D134EAE6956AF5560@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A D <a_d_249@hotmail.com>
Cc: linux-assembly@vger.kernel.org

The range of 8-bit, signed number is -128 -> +127. There is no +128. But
there is (unsigned) 128. Unfortunately, the assembler doesn't know this.
When you wrote movb $128, %bl, it blindly used the bit pattern 0x80 for
128, which is the bit pattern for (signed) -128. The bit pattern for 127
is 0x7f.

The addb instruction sets both the carry flag and the overflow flag
according to the results of the addition. In 8-bit addition (in hex):
      0x80 + 0x0a = 0x8a      CF = 0   OF = 0
      0x7f + 0x0a = 0x89      CF = 0   OF = 1

In signed decimal this is
      -128 + 10 = -118   ==> correct arithmetic
       127 + 10 = -119   ==> incorrect arithmetic

If your program were using unsigned values, the range of 8-bit numbers
is 0 -> 255.
In unsigned decimal this is
       128 + 10 = 138   ==> correct arithmetic
       127 + 10 = 137   ==> correct arithmetic

The bit patterns (expressed in hex here) are the same. If your program
is treating them as signed values, you should test the overflow flag. If
they are being treated as unsigned, look at the carry flag.

This illustrates the importance of using the "unsigned" keyword in C/C++
where appropriate. Assembly language has no concept of "type." You have
to take care of that in your code.

Good news: You can do whatever the hardware is capable of in assembly
language.

Bad news: You have to do it.


On Fri, 2007-04-20 at 11:58 -0400, A D wrote:
> I've a question about the handling of signed and unsigned numbers by GAS. 
> When I
> write the following:
> 
> 
>     movb $128, %bl
>     addb $10, %bl
> 
> bl register doesn't overflow and overflow flag is not set. But as soon as I 
> use
> 127 instead of 128 like this:
> 
>     movb $127, %bl
>     addb $10, %bl
> 
> overflow flag is set. Does this mean when i move  a value to a register 
> smaller
> or equal to the maximum signed value that register can contain, gas treats 
> it as
> signed number? Thanks.


