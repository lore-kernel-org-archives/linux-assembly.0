From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2.6.21.1] i386: save registers before intra-privilege
 syscall
Date: Thu, 17 May 2007 15:16:42 -0700
Message-ID: <464CD44A.5000307@zytor.com>
References: <20070517220638.GA6532@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761323AbXEQWRM@vger.kernel.org>
In-Reply-To: <20070517220638.GA6532@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Philipp Kohlbecher <pk031698@uni-greifswald.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-assembly@vger.kernel.org

Philipp Kohlbecher wrote:
> From: Philipp Kohlbecher <pk031698@uni-greifswald.de>
>=20
> The kernel_execve function issues a software interrupt (int 0x80) to =
make
> a system call to sys_execve. This function expects to find the stack =
segment
> and stack pointer of the function that issued the system call in the =
pt_regs
> struct. The syscall entry code that sets up this struct expects the s=
tack
> segment and the stack pointer of the issuing function already on the =
stack.
> But the Intel processor saves these registers only if a stack-switch =
occurs,
> i.e. for inter-privilege interrupts and exceptions (cf. Intel Softwar=
e
> Developer=E2=80=99s Manual, Vol. 3A, p. 5-17,
> http://www.intel.com/design/processor/manuals/253668.pdf).
> For an intra-privilege interrupt like the one issued in kernel_execve=
, these
> registers must be saved manually.
>=20

Could you describe the failure scenario this causes?  I'm trying to
understand how something that fundamental would have possibly slipped b=
y
testing?

	-hpa
