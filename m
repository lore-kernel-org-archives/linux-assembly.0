From: peter willy krause <wklux@yahoo.co.uk>
Subject: Re: stack contents at function call
Date: Mon, 1 Mar 2004 09:40:17 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200403010940.22587.wklux@yahoo.co.uk>
References: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: vadiraj@mail.cyberneme.com, linux-assembly@vger.kernel.org, linux-assembly@mlists.in-berlin.de

assuming ia32 architecture...
Q1)	return stack, if existent, is set up by the rsp. cpu;
	programming languages often put several data on the same stack as
	arguments to a subroutine call which, requires specific conventions.

users stack 'frame' can be set up by convention, which may be defined b=
y a =20
standard, e.g. 'posix' - which even assigns specific registers to certa=
in=20
tasks.

Q2)	basic return stack set up is not under programmers influence,=20
	additional data may carefully be pushed/popped, e.g. "C"-ish=20
	'arguments' or 'automatic' (i.e. locally available) variables &c.
	assembly leaves full control to the programmer, no implied conventions=
!
	(or else, mickeysoft...)

plain assembly is not bound to such conventions but, to different=20
processor architectures.

in principle, cpu-s w. stacks usually store the return address (or some=
=20
aequivalent data item) to top of stack and advance the stack pointer to=
=20
the next, unused position; whether this 'push' goes towards lower (most=
=20
commonly) or higher (e.g. some hp processors) addresses depends on the=20
particular cpu design. some cpu-s can store additional data to the=20
return-stack for interrupts or to supporting certain programming=20
'languages', which got to be removed in an orderly manner, before=20
accessing a previously stacked return address.

this basic procedure can be implemented in many different ways, thus=20
depends on the particular cpu.

for instance, ia32 type cpu, 'protected mode', stores address after the=
=20
<call disp> opcode which, will be removed by the subroutine 'ret' opr.=20

posix documents re	http://www.lxhp.in-berlin.de/lhplinks.html#sysv
intel manuals		http://developer.intel.com/sites/developer/
"C" vs assembly code	http://www.lxhp.in-berlin.de/lhplinks.html#cas

best
	hp

Am Montag, 1. M=E4rz 2004 07:48 schrieb Vadiraj C S:
>   Hello Assembly Gurus
>
>    I'm working on Assembly programming under linux from few days, her=
e
> are some issues
>
>  1.When a function call is made the parameters are pushed on to the
> stack and a a call to the function is made.
>
>  Now the top of the stack is the return address, Please correct me if
> I'm wrong here, and the parameters above it is the first parameter se=
nt
> and so on..
>
>  1. Is this OS dependent, or compiler dependent?
>  2. Does this sequence change when call from C language and call from
> assembly.
>
> Cos I noticed difference with gcc(GNU compiler) and icc (Intell
> compiler)
>
>
>  Help is needed urgent,
>
> Thanks in advance...

--=20
mail to 'hp': lx at lxhp : in-berlin : de

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
