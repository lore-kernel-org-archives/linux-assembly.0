From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Passing parameters to assembler functions in 'C' 64 style.
Date: Thu, 04 Dec 2008 12:54:18 -0800
Message-ID: <1228424058.5690.31.camel@bob-desktop>
References: <5360.11799.qm@web50303.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <5360.11799.qm@web50303.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: blurrpp@yahoo.com
Cc: linux-assembly@vger.kernel.org

You need the AMD64 Application Binary Interface (v0.99) available at

http://www.x86-64.org/documentation.html

In particular, see Figure 3.4 on page 21.

Pay attention to the use of rax. The default for floating point in
x88-64 is the SSE unit. If a function will accept floating point
arguments (for example, printf) the number of floating point arguments
must be placed in eax. Write a C program that calls printf and use the
-S option to see the assembly language.

A good way to see what the compiler is doing to C code is to use the
following options:
$ gcc -O0 -g -Wa,-adhls -fno-asynchronous-unwind-tables \
> myProg.c > myProg.lst

(I added the "\" here to avoid confusing word wrapping.)

Bob

On Thu, 2008-12-04 at 12:20 -0800, =C2=A3ukasz wrote:
> Hi.=20
> I started to write assembler functions for C on 64-bit arch. On 32-bi=
t arch. every parameters ware put on stack, now is different, what can =
be easyly seen reading source program. For example if im passing one =20
> (int *) parameter, adress (&int) is kept in %rdi register, and so one=
 if u are passing more parameters. Ofcurse is not dificult to use it if=
 u know but is there any key according to which parameters are stored?.=
 I've made some "experiments" with different numbers and kind parameter=
s, but the "key" must be described somewhere.
>=20
> Luke


--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
