From: "A D" <a_d_249@hotmail.com>
Subject: Re: why overflow flag being set?
Date: Fri, 20 Apr 2007 13:04:02 -0400
Message-ID: <BAY133-F49FF3CABD01881240286AF5560@phx.gbl>
References: <1177087941.4688.28.camel@localhost>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1177087941.4688.28.camel@localhost>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: plantz@sonoma.edu
Cc: linux-assembly@vger.kernel.org

>Robert Plantz wrote:
>The range of 8-bit, signed number is -128 -> +127. There is no +128. But
>there is (unsigned) 128. Unfortunately, the assembler doesn't know this.
>When you wrote movb $128, %bl, it blindly used the bit pattern 0x80 for
>128, which is the bit pattern for (signed) -128. The bit pattern for 127
>is 0x7f.
>
>The addb instruction sets both the carry flag and the overflow flag
>according to the results of the addition. In 8-bit addition (in hex):
>       0x80 + 0x0a = 0x8a      CF = 0   OF = 0
>       0x7f + 0x0a = 0x89      CF = 0   OF = 1
>
>In signed decimal this is
>       -128 + 10 = -118   ==> correct arithmetic
>        127 + 10 = -119   ==> incorrect arithmetic
>
>If your program were using unsigned values, the range of 8-bit numbers
>is 0 -> 255.
>In unsigned decimal this is
>        128 + 10 = 138   ==> correct arithmetic
>        127 + 10 = 137   ==> correct arithmetic
>
>The bit patterns (expressed in hex here) are the same. If your program
>is treating them as signed values, you should test the overflow flag. If
>they are being treated as unsigned, look at the carry flag.
>
>This illustrates the importance of using the "unsigned" keyword in C/C++
>where appropriate. Assembly language has no concept of "type." You have
>to take care of that in your code.
>
>Good news: You can do whatever the hardware is capable of in assembly
>language.
>
>Bad news: You have to do it.



Thanks for the comprehensive explanation. That answers my question.

_________________________________________________________________
Find the best places on campus to get take out, study & unwind 
http://www.liveu.ca/explore.aspx

