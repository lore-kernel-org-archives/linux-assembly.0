From: h-peter recktenwald <lx@lxhp.in-berlin.de>
Subject: Re: I have a problem with inline ASM
Date: Fri, 5 Jul 2002 01:16:05 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020705011605.28697afd.lx@lxhp.in-berlin.de>
References: <3D24BB9C.E518173C@persystems.com>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D24BB9C.E518173C@persystems.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Cc: linux-assembly@vger.kernel.org, wgonzalez@persystems.com

On Thu, 04 Jul 2002 16:18:20 -0500
alter Gonzalez <wgonzalez@persystems.com> wrote:

>=20
> WORD rol_word(WORD value, BYTE bits)
> {
>   __asm__ __volatile__("movl %1, %%eax;
>                         movb %2, %%cl;
>                         roll %%cl, %%eax;

	rolls through 32 bit

>                         movl %%eax, %0;"
>                        :"=3Deax"(value)              // output
>                        :"eax"(value),"cl"(bits)    // input
>                        );


--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
