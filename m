From: h-peter recktenwald <*@lxhp.in-berlin.de>
Subject: Re: how can I have access to the memory as in flat mode?
Date: Tue, 25 Jun 2002 23:17:38 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020625231738.216814d7.*@lxhp.in-berlin.de>
References: <3D15E5AF.5010706@eprocess.fr>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D15E5AF.5010706@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: fmarmond@eprocess.fr
Cc: linux-assembly@vger.kernel.org

On Sun, 23 Jun 2002 17:13:51 +0200
=46rederic Marmond <fmarmond@eprocess.fr> wrote:

>=20
> Hi,
>=20
> few days ago, i posted mails to try to know better about linear memor=
y=20
> in linux.
> perhapse you've already answer me, but I could'nt see mails from the =
list...
> So, I managed to make my prog work by using /dev/mem
> it's very ugly, but it worked.
>=20
> Is there any other way to access somewhere?
> In fact the exact problem is:
>=20
> on a embeded system, the mac-adress of  eth0 and eth1 are stored in a=
=20
> flash memory, mapped somewhere.
> The 'standard' driver (natsemi) doesn't know this, and try to access =
to=20
> the 'normal' pci network card.
> So, i have to read the mac adress by hand, and modify the value retur=
ned=20
> by the 'standard' driver.
>=20
> I know the adress, but I've got seg-faults when trying to access it f=
rom=20
> the driver (readb, (unsigned char*)0xf8000, ...)
				^^^^^^^^^^^^

i'm most probably the least experieced on this access mode, thus only=20
guessing, i.e. the way how i would start trying:

is your code running in kernel mode (e.g. module)?
otherwise that address would not be accessible, 1st GB owned by kernel.

in kernel mode you might try sys_open on /dev/kmem and set the 'file po=
inter'=20
to the mentioned mmap-ed(?) address, then read w.=20
	sys_read fd,memory-address,number-of-byte-to-read

which might even work from user space (by a 'normal' program) when call=
ed=20
with 'root' access privileges.

>=20
> any help?

???? - I'd yet never try any of those...


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
