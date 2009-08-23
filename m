From: =?iso-8859-1?Q?=A3ukasz?= <blurrpp@yahoo.com>
Subject: Appendix: multithreating HOWTO ? :)
Date: Sun, 23 Aug 2009 03:29:15 -0700 (PDT)
Message-ID: <556680.44596.qm@web50309.mail.re2.yahoo.com>
References: <779223.59642.qm@web50307.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1251023355; bh=QW4lJ/dD28lYNqK4MESrE5zPbH/qOlWRgopgH31pkHI=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=1R1jmW7TQLoNRX2yp5R+W8AAxINxcIOzJwS2juQoBtUlwRXwKxZkCDXa2yQBqZamgJ4uSl8RcjTp+RL3OLoSiaM8JTnTaAE+eU3kDh/2a4j2bM+X3HbEBfSIEJ8sPj+HTGNE0j7d8kU/FWH4XPKl2ArL6tCjSMeI/8QS/1g5BCE=
In-Reply-To: <779223.59642.qm@web50307.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

in appendix i want to just precize problem. Broblem is how to write, cr=
eate etc, shared memory for parent and child proceses, where they could=
 for example exchange wariables

--- On Sat, 8/22/09, =A3ukasz <blurrpp@yahoo.com> wrote:

> From: =A3ukasz <blurrpp@yahoo.com>
> Subject: multithreating HOWTO ? :)
> To: linux-assembly@vger.kernel.org
> Date: Saturday, August 22, 2009, 6:48 PM
> Hi All.
> I'm trying to start writing multithread programs with
> assembler (no pthreads), i want to just ask what is wrong in
> folowing simple code:
>=20
>=20
> .section .data
>=20
> signal1:
> .quad=A0=A0=A0 1
>=20
> signal2:
> .quad=A0=A0=A0 1
>=20
> x:
> .quad=A0=A0=A0 0
>=20
> y:
> .quad=A0=A0=A0 0
>=20
> .section .text
> .globl _start
> _start:
> =A0 =A0 nop
> =A0 =A0 movq=A0=A0=A0 $2,%rax=A0 =A0
> =A0 =A0 =A0=A0=A0# sys_fork
> =A0 =A0 xorq=A0=A0=A0 %rbx,%rbx
> =A0 =A0 int=A0=A0=A0 =A0=A0=A0
> $0x80
> =A0 =A0=20
> =A0 =A0 cmpq=A0=A0=A0 $0,%rax
> =A0 =A0 jl=A0=A0=A0 =A0=A0=A0 end
> =A0 =A0=20
> =A0 =A0 cmpq=A0=A0=A0 $0,%rax
> =A0 =A0 jg=A0=A0=A0 =A0=A0=A0
> parent=A0 =A0 =A0 =A0 =A0 =A0 # jump if
> parent
> =A0 =A0=20
>=20
> child:
> =A0 =A0 movq=A0=A0=A0 $100,x
> =A0 =A0 movq=A0=A0=A0 $0,signal1
>=20
> 1:=A0=A0=A0=20
> =A0 =A0 cmpq=A0=A0=A0 $0,signal2
> =A0 =A0 jnz=A0=A0=A0 =A0=A0=A0 1b
> =A0 =A0 jmp =A0=A0=A0 end
>=20
>=20
> parent:
> =A0 =A0 movq=A0=A0=A0 $100,y
> =A0 =A0 movq=A0=A0=A0 $0,signal2
>=20
> 1:=A0=A0=A0=20
> =A0 =A0 cmpq=A0=A0=A0 $0,signal1
> =A0 =A0 jnz=A0=A0=A0 =A0=A0=A0
> 1b=A0 =A0 =A0 =A0 =A0 =A0 # INF. LOOP ?
> =A0 =A0=20
> end:
> =A0 =A0 movq=A0 =A0 =A0 =A0 x,%rbx
> =A0 =A0 addq=A0 =A0 =A0 =A0 y,%rby
> =A0 =A0 movq=A0=A0=A0 $1,%rax
> =A0 =A0 int=A0=A0=A0 =A0=A0=A0
> $0x80
>=20
> Program stacks at parent part in infinite loop waiting for
> "signal1" change to 0. Anybody knows how to write it
> properly with using two threads? Thanks in advance.
>=20
> Lukas
>=20
>=20
> =A0 =A0 =A0=20
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html
>=20


     =20
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
