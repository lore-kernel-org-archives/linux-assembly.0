From: h-peter recktenwald <*@lxhp.in-berlin.de>
Subject: Re: sound
Date: Tue, 25 Jun 2002 21:28:21 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020625212821.5080cb4f.*@lxhp.in-berlin.de>
References: <3D17944F.E391DBF4@freesurf.fr>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D17944F.E391DBF4@freesurf.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: philippe <pvir@freesurf.fr>
Cc: Linux-assembly@vger.kernel.org

On Mon, 24 Jun 2002 23:51:11 +0200
philippe <pvir@freesurf.fr> wrote:

> hi
> I am new on this list and my name is Philippe.
> I used to make some programs on windows but wanted to trye on linux.
> I have a problem with a small prog i had done for windows witch play
> sounds on the fm chip of a sound card.

direct port access requires 'root' rights and the concerning ports
being enabled, with sys_ioctl or sys_ioperm. - e.g <man 2 ioctl>

> But when i translate it on linux, it doesn't work any more.
> It compile and link correctly(nasm), but on execution it writes:
> segmentation fault!
> I post you the sources at the end of this message.
>=20
> I had an other question:
> Where can I find bible of all the interruptions and what is the  name=
 of
> it?

basically, there is one interrupt and several sub-codes, passed w. eax.
'the' bible doesn't exist, linux is in a somewhat 'fluid' state and, ba=
dly=20
documented. Paricularly no aequivalent to 'RBIL' but, you might get som=
e=20
help from my syscall pages where i collect whatever i find fairly relia=
bly=20
documented/tested.
	http://www.lxhp.in-berlin.de/lhpsyscal.html


regards,
	hp
--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
NO abusive=A0software=A0patents=A0http://petition.eurolinux.org/pr/pr17=
=2Ehtml
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
