From: "Randall Hyde" <randyhyde@earthlink.net>
Subject: Bug in Gas?
Date: Sun, 10 Apr 2005 20:39:29 -0700
Message-ID: <01d101c53e48$115b2300$6302a8c0@pentiv>
References: <Pine.LNX.4.21.0503242354490.1652-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi All,
I have been tracing down an insidious bug in HLA for a while and I believe I
found a code generation problem in Gas. The problem (obviously, since it's a
Gas bug) only manifests itself under Linux. Over the past several months
I've been getting reports of problems with floating point code in the HLA
standard library. The code generally works fine (under Linux, it always
works fine under Windows), but recently I've noticed that the HLA compiler
emits some strange looking constants when you statically initialize real64
variables. Most of the time, it seems to work, even with the weird
constants, but not always.

To make a long story short, I've discovered that whenever you initialize a
floating point constant with a literal real value, the HLA compiler actually
stores the real32 value of the constant into memory rather than the real64
value. I couldn't figure out why: (1) it was doing this, and (2) why we'd
get correct results most of the time (we should be getting errors all the
time). Well, (2) turns out to be explanable: when the HLA stdlib is compiled
with this bug in the compiler, all the real64 conversion routines wind up
doing real32 conversions. Ugh. (1) was a bit more challenging to figure out
what's going on, because if you look at the HLA compiler's output, it *is*
correct.

The problem turns out to be the Gas fld and fstp  instructions. To convert
from real80 to real64, I use an HLA sequence like this:

   fld( someReal80Value );
   fstp( aReal64Variable );

HLA (correctly, I presume) emits the following Gas code:

   fld [ someReal80Value ]
   fstpd aReal64Variable

Note that "fstpd" (presumably) stands for "floating point store and pop,
double-precision" (that is, a real64 value. Note that "fstps" is how you
would store away a single-precision (32-bit) value. However, when I
*disassemble* the code assembled by Gas, it shows the following sequence:

  fld someReal80Value
  fstps aReal64Variable

IOW, either fstpd is *not* a double precision store and pop, or Gas is
generating the wrong code here.
Anyone have a clue?
Cheers,
Randy Hyde

