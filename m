From: Philipp Kohlbecher <pk031698@uni-greifswald.de>
Subject: Re: [PATCH 2.6.21.1] i386: save registers before intra-privilege
 syscall
Date: Fri, 18 May 2007 01:27:06 +0200
Message-ID: <464CE4CA.8000704@uni-greifswald.de>
References: <20070517220638.GA6532@localhost.localdomain> <464CD44A.5000307@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <464CD44A.5000307@zytor.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

H. Peter Anvin wrote:
> Philipp Kohlbecher wrote:
>> From: Philipp Kohlbecher <pk031698@uni-greifswald.de>
>>
>> The kernel_execve function issues a software interrupt (int 0x80) to=
 make
>> a system call to sys_execve. This function expects to find the stack=
 segment
>> and stack pointer of the function that issued the system call in the=
 pt_regs
>> struct. The syscall entry code that sets up this struct expects the =
stack
>> segment and the stack pointer of the issuing function already on the=
 stack.
>> But the Intel processor saves these registers only if a stack-switch=
 occurs,
>> i.e. for inter-privilege interrupts and exceptions (cf. Intel Softwa=
re
>> Developer=E2=80=99s Manual, Vol. 3A, p. 5-17,
>> http://www.intel.com/design/processor/manuals/253668.pdf).
>> For an intra-privilege interrupt like the one issued in kernel_execv=
e, these
>> registers must be saved manually.
>>
>=20
> Could you describe the failure scenario this causes?

I don't know of any problems this causes. The kernel needs to be aware
of the fact that the xss and esp fields of the pt_regs struct may
contain wrong values anyway, as hardware interrupts arriving while the
CPU is in kernel mode would also lead to this condition.
The file include/asm-i386/processor.h contains a comment to that effect
(lines 483-492).
With kernel_execve we can predict this, however, and account for it.
(This may be superfluous, but I don't think it hurts and it might
prevent future errors.)

- Phil Kohlbecher
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
