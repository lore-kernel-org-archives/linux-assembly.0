From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: extended asm+pointers
Date: Wed, 11 Aug 2004 11:33:49 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16666.26253.291076.329433@eidolon.muppetlabs.com>
References: <20040811090012.14095.qmail@web52905.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040811090012.14095.qmail@web52905.mail.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly <linux-assembly@vger.kernel.org>

>      14   asm("movq (%1), %%mm0 \n"
>      15       "movq %%mm0, (%0) \n"
>      16       :"=r"(m1)
>      17       :"r"(m)
>      18       );

I believe this code copies the contents of m to m1. (Actually, with
movq, I guess it will copy an extra four bytes in the process.) After
it runs, both m and m1 will point to b[].

I think part of your problem is that you're trying to treat an array
as an lvalue. gcc is decomposing your array into a pointer to the
first element, which is not a valid lvalue. So you're trying to do the
same thing via pointers. But it's not the same thing at all.

In other words, you're stumbling with how C treats arrays and
pointers, not the assembler.

Get rid of your m and m1 variables, and try doing this instead:

  asm("movq (%1), %%mm0 \n"
      "movq %%mm0, (%0) \n"
      : : "r"(b), "r"(a)
      );

(Note the lack of output operands. That's because we're not modifying
the "pointer" b. We're just modifying the array that b points to.)

I think this will do what you want.

b
