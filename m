From: lx <lx@lxhp.in-berlin.de>
Subject: Re: debugging in linux
Date: Sat, 14 Sep 2002 22:51:23 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020914225123.48cbc74e.lx@lxhp.in-berlin.de>
References: <4.3.2.7.2.20020914112556.00bdb340@mail.ciudad.com.ar>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4.3.2.7.2.20020914112556.00bdb340@mail.ciudad.com.ar>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hernan <beri@ciudad.com.ar>
Cc: linux-assembly@vger.kernel.org

On Sat, 14 Sep 2002 11:31:05 -0300
Hernan <beri@ciudad.com.ar> wrote:

> Hello,
>=20
> I'm trying to debug a program (without debug information) with gdb bu=
t I=20
> can't do some things:
>=20
> 1) How can I run step by step,
> 2) see the registers values (including eip),
> 3) make a dump of memory
>=20
> I'm running code that starts in 0x80003c0 and when I try disas 0x8000=
3c0 I=20
> get "No function contains specified address".

try 'objdump -d'

> The executable is a test that I'm doing I change the elf entry point =
and=20
> put some code there.
>=20
> Is there a softice like debugger for linux? where can I get it?

no. linux. 'ald' might serve your purpose...
url re http://linuxassembl.org

hp

--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
    software=A0patents =A0http://petition.eurolinux.org/pr/pr17.html
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
