From: Frank Kotler <fbkotler@zytor.com>
Subject: Re: Appendix: multithreating HOWTO ? :)
Date: Sun, 23 Aug 2009 11:04:46 -0400
Message-ID: <4A915A8E.4000207@zytor.com>
References: <556680.44596.qm@web50309.mail.re2.yahoo.com> <4A9145B0.50507@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4A9145B0.50507@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Claudio Fontana <claudio.fontana@gmail.com>
Cc: =?ISO-8859-1?Q?=A3ukasz?= <blurrpp@yahoo.com>, linux-assembly@vger.kernel.org

Claudio Fontana wrote:
> =A3ukasz wrote:
>> in appendix i want to just precize problem. Broblem is how to write,=
=20
>> create etc, shared memory for parent and child proceses, where they=20
>> could for example exchange wariables
>=20
> You are using fork. Fork is used to create new processes.
> You probably want clone instead, to create new threads and specify
> which resources to share between the two threads.
>=20
> man 2 clone
>=20
> sys_clone is 120 (0x78).

Is that a 64-bit sys_call number? I thought they'd changed that on us.=20
AFAIK, __NR_clone is 56 these days... and "syscall" replaces int 0x80. =
A=20
real "curve ball" to asm programmers! Well, they *told* us not to do it=
=20
that way. :)

Best,
=46rank

--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
