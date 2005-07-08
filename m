From: "Richard B. Johnson" <linux-os@analogic.com>
Subject: Re: x86 Endiannes and libc printf
Date: Fri, 8 Jul 2005 16:17:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0507081614160.17058@chaos.analogic.com>
References: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
Reply-To: linux-os@analogic.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42117.62.38.142.34.1120849517.squirrel@webmail.wired-net.gr>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Nanakos Chrysostomos <nanakos@wired-net.gr>
Cc: linux-assembly@vger.kernel.org

On Fri, 8 Jul 2005, Nanakos Chrysostomos wrote:

> Hi all,
> i am searching for a few hours now the endianness in the x86
> environment,and i have the following
> snippets of code,which in some places i cant understand.Please help me!!!

Intel ix86 processors have the lowest byte in the lowest
memory location. Therefore if you had an unsigned SHORT int
(16 bits) of 0xcdef, it would be represented in memory as:

.byte	0xef, 0xcd
            |     |____ Highest byte
            |__________ Lowest byte

Now, it turns out that the two WORDS of a long int also
have the lowest word stored in the lowest memory location.

Therefore, if we had a long int of 0x89ABCDEF it would be
stored as:

.byte	0xef, 0xcd	# Lowest word
.byte	0xab, 0x89	# Highest word
            |     |____ Highest byte
            |__________ Lowest byte


Long longs follow the same rule.

It makes no difference if data are on the stack or in memory.
But.... You may need to understand how 'C' views things.
The default for the gcc compiler is to think of chars as
signed. This may be a problem if you attempt to view
a memory object that is large for its type, and the
observation window is signed. The compiler tools and
the runtime library will sign-extend your observation.
For instance, a char of value 0xff will be 0xffff when
viewed as a short and 0xffffffff when viewed as an int.
This, even though you know from observing the byte in
memory that it was 0xff. This is absolutely correct
because all 3 types are -1 in value.

Therefore, when experimenting with bytes and bits,
it's certainly recommended that you use unsigned types
so you don't get this extension.

Cheers,
Dick Johnson
Penguin : Linux version 2.6.12 on an i686 machine (5537.79 BogoMips).
  Notice : All mail here is now cached for review by Dictator Bush.
                  98.36% of all statistics are fiction.
