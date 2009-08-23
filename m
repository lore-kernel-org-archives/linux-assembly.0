From: =?utf-8?B?wqN1a2Fzeg==?= <blurrpp@yahoo.com>
Subject: Re: Appendix: multithreating HOWTO ? :)
Date: Sun, 23 Aug 2009 12:13:26 -0700 (PDT)
Message-ID: <807013.28805.qm@web50302.mail.re2.yahoo.com>
References: <2c04dc350908230823uf1eb9a0t34bbcf611fa2e5b1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1251054806; bh=LnSEInCdt9Vu3S+KTjFw/orvXrn/D/g40JU5SRW1tgY=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=vDsHCQw+au1ja+wUyRW7zWjl80+F1oRu7ldQTGNS2N4PdwGXnwVQ0IUnA0qBfKSkb/k3yc1CtGkbI0oExL9Tb8D69csvcp6frdWUEKN+Ru/joV44J16s42lplIeQyCJ4UjyBdK05gKDdHw2D3hCb6OzTPV0ubrQAYx/RX72rjQU=
In-Reply-To: <2c04dc350908230823uf1eb9a0t34bbcf611fa2e5b1@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-assembly@vger.kernel.org

more info for example.

http://stackoverflow.com/questions/807506/threads-vs-processes-in-linux

as u see with litle work i can create process (fork) from thread (clone=
), i have to make some changes in systme tables etc. now need to read l=
ittle more kernel sys call source.

--- On Sun, 8/23/09, Claudio Fontana <claudio.fontana@gmail.com> wrote:

> From: Claudio Fontana <claudio.fontana@gmail.com>
> Subject: Re: Appendix: multithreating HOWTO ? :)
> To: "Frank Kotler" <fbkotler@zytor.com>
> Cc: "=C2=A3ukasz" <blurrpp@yahoo.com>, linux-assembly@vger.kernel.org
> Date: Sunday, August 23, 2009, 5:23 PM
> On Sun, Aug 23, 2009 at 5:04 PM,
> Frank Kotler<fbkotler@zytor.com>
> wrote:
> > Claudio Fontana wrote:
> >>
> >> =C5=81ukasz wrote:
> >>>
> >>> in appendix i want to just precize problem.
> Broblem is how to write,
> >>> create etc, shared memory for parent and child
> proceses, where they could
> >>> for example exchange wariables
> >>
> >> You are using fork. Fork is used to create new
> processes.
> >> You probably want clone instead, to create new
> threads and specify
> >> which resources to share between the two threads.
> >>
> >> man 2 clone
> >>
> >> sys_clone is 120 (0x78).
> >
> > Is that a 64-bit sys_call number? I thought they'd
> changed that on us.
> > AFAIK, __NR_clone is 56 these days... and "syscall"
> replaces int 0x80. A
> > real "curve ball" to asm programmers! Well, they
> *told* us not to do it that
> > way. :)
> >
> > Best,
> > Frank
>=20
> I am still on good old 32bit. On 64 bit system call numbers
> are indeed
> completely different.
>=20


     =20
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
