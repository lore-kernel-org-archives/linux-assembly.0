From: "Maik Beckmann" <baegsch@linuxmail.org>
Subject: Re: debugger
Date: Sun, 07 Sep 2003 12:50:58 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030907115058.19795.qmail@linuxmail.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

gdb is also capable of printing in intel style. I do not know the correct c=
ommand for this, But its possible to change the syntax by a simple command.

And for the syscall list take a look at arch/i386/kernel/entry.S
All syscalls are merged there in the sys_call_table, which is really easy t=
o obtain.=20

regards baegsch


----- Original Message -----
From: Rafael Diniz <rafael.diniz@ic.unicamp.br>
Date: 	Sun, 7 Sep 2003 06:47:39 -0300
To: linux-assembly@vger.kernel.org
Subject: debugger

> Hello all,
> I'm starting code in assembly language for Linux (i386 with nasm) and I'm=
=20
> using gdb to debug my programs, but I would like to know if there is any =

> other debugger for i386 that uses the Intel syntax.
>=20
> Another thing, where can I get a complete documented (or not) list of all=
 the=20
> syscalls present in the linux 2.6?
>=20
> Asm rocks!!!
>=20
> Bye,
> Rafael Diniz
> =20
> +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-
> Engenharia da Computa=E7=E3o  --  Unicamp
> http://www.gnu.org/philosophy/why-free.pt.html
> Usu=E1rio do sistema operacional GNU/Linux
> Chave PGP: http://www.dcc.unicamp.br/~ra017126/pubkey.asc
> "Acreditar num conhecimento que pode ser vendido e
> comprado =E9 uma forma sutil (e cruel) de perpetuar a ignor=E2ncia."
> +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
______________________________________________
http://www.linuxmail.org/
Now with e-mail forwarding for only US$5.95/yr

Powered by Outblaze
