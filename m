From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: Linux sparc assembly misc questions
Date: Thu, 21 Apr 2005 10:53:21 +0200
Message-ID: <d93f04c705042101531c6eeaee@mail.gmail.com>
References: <1108856603.700.44.camel@0003ba16bccc>
Reply-To: Hendrik Visage <hvjunk@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1108856603.700.44.camel@0003ba16bccc>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio <fabio@crearium.com>
Cc: linux-assembly@vger.kernel.org

On 2/20/05, Fabio <fabio@crearium.com> wrote:
> Hello,
> 
> I am trying to code a small asm program that store 0x1 on a register and increment it.
> 
> how to translate this:
> 
> ladd #$01

Yes, SPARC or "funny" if you are used to the CISC ia86 :)

There are a synthetic instruction "set value, reg", which
translates to something like:

 sethi %hi (value),reg ; When (value & 01xffff)==0
OR or %g0, value ,reg ; When (-4096<=value<=4095)
OR sethi %hi (value),reg ; Otherwise. Warning don't use  SET as a
delay instruction
      or  reg, %lo(value),reg

> inca

There are two synthetic ops called inc, inccc, which translates to:

 inc const13,reg => add reg, const13, reg
 inc reg               => add reg, 1, reg
 inccc reg           => addcc reg,1,reg
 inccc const13,reg => addcc reg,const13,reg

where const13 is a signed constant that fits in 13bits.

That's the long way of saying "It's not always that easy in SPARC assembly :("
(Hey, you are using a RISC CPU, aren't you? You know that's the reason
it's "faster" than the CISC cpus, don't you??)

The sweet and the short is that the SPARC CPU's instructions are fixed
length (32bits if I recall correctly, don't know about the UltraSPARC)
and especially becaue of it's delayed instructions (the instruction
after a branch/jump/call/return also get's executed) it's not easy to
do variable lenght instructions without speed penalties.
 
The "better" way on a sparc would be to

ldd [address], reg[rd]
add reg[rd],1,reg[rd]
 
> to linux sparc assembly?

Also, check out docs.sun.com, and search for their SPARC assembly
documents, I recall there should be some hidden out there.

> 2. what are the implications of sparc register windowing when you program if you > used to program on intel or 68hc11 ?

Your function/routine/etc. should only really use %l0-%l7, thought %g0 always
returns zero, and %g1-7 could be used too.

If your function calls somebody, you will set the paramters in %o0-%o7, and the
returning function will set the return values in %o0-%o7 for you.
Your function should return it's values in %i0-%i7, as that's also
where you've gotten your paramters for your function.

-- 
Hendrik Visage
