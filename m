From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: newbie question about integers size/portabilty.
Date: Tue, 28 Dec 2004 14:38:29 -0800
Message-ID: <16849.57445.118809.760890@eidolon.muppetlabs.com>
References: <20041228122916.GA7137@ic.unicamp.br>
	<opsjpz0szcuqea3r@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <opsjpz0szcuqea3r@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> No one can solve the problem of how to make data types portable when
> one system doesn't have the same sizes as another, so someone says
> "hey, let's just make four sizes, char, short, int and long, and be
> completely undecided and nonspecific about them, thereby passing the
> problem on to the programmer so that we don't have to deal with it"
> and that was that.

This rather misses the point, I think.

At the time C was written, most computer languages either specified a
precise size for their integer types, or more likely they were
designed to only run on one platform and nobody gave a second thought
to portability. So you'd have a situation where "int" was specified as
always being *exactly* 16 bits, for example, because that's the best
size for integers on the hardware that exists at the time your
language was created. Which means that your compiled program would run
like a sick dog when compiled on a modern P4 machine, which has
atrocious handling of 16-bit math.

The C language specifies that a C int should be set to the platform's
"native" integer size -- whatever is going to be the fastest and most
versatile. 32 bits on a 32-bit machine, 64 bits on a 64-bit machine,
18 bits on an 18-bit machine.

> Nevermind that every programmer will have to deal with it, since if
> char isn't at least 7 bits then they need to make their strings out
> of shorts instead of chars.

This is untrue. The ANSI C standard specifies minimum guaranteed
sizes. chars have to be able to hold at least 8 bits, shorts and ints
both have to be able to hold at least 16 bits, longs at least 32 bits,
and long longs at least 64 bits. Thus we can see that it's actually
not possible to write a C compiler for an 8-bit microprocessor that is
both well-optimized and ANSI-compliant. (Embedded 8-bit software is
typically written using a C compiler that's about 90% compliant.)

> I myself would have made sizes like "1bit" and "2bit" and "3bit" and
> "4bit" all the way up to "1000bit" and said that if you need at
> least 11 bits in your number, use "11bit" and it'll compile into a
> data size at least large enough to hold 11 bit numbers.

... thereby passing the problem of what integer size will produce
efficient code on to the programmer, so that you don't have to deal
with it.

> I seem to recall seeing macros in C code like sizeof(int) used to
> figure out the size of things and then conditionally compile code.

sizeof isn't a macro, actually, and it cannot be used to conditionally
compile code. For most cases, you can simply rely on the guaranteed
sizes I mentioned above. If you're dealing with circumstances in which
you really need to know EXACT sizes, then your best option is to use
the macros in <limits.h>. In this header file are defined macros such
as CHAR_BIT, INT_MIN, ULONG_MAX, etc etc etc.
http://www-ccs.ucsd.edu/c/limits.html shows what the ANSI C standard
defines. (POSIX defines a number of other macros to be included.)

If you know that you're using a C99-compliant compiler, then you can
look at <stdint.h> and perhaps use the types defined there. However,
C99 compilers are not particular widespread at this time.

b
