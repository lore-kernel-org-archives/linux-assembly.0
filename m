From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: I/O
Date: Thu, 11 Sep 2003 13:07:54 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <31694.3059712232$1063279112@news.gmane.org>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200309110801.37516.rafael.diniz@ic.unicamp.br>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Rafael Diniz <rafael.diniz@ic.unicamp.br>
Cc: linux-assembly@vger.kernel.org

Hello,

you have to change the TERMIO setting via IOCTL syscall.

(I think ICANON, see manual: man termios)

http://linuxassembly.org/asmutils/asmutils-0.17.tar.gz

look at sh.asm for example how to change the terminal (i think the
routine is called smth like term_setup, it is called at startup )

I hope this will help you.

Regards

Rudolf


On Thu, 11 Sep 2003,=20
Rafael Diniz wrote:

> Date: Thu, 11 Sep 2003 08:01:37 -0300
> From: Rafael Diniz <rafael.diniz@ic.unicamp.br>
> To: linux-assembly@vger.kernel.org
> Subject: I/O
>=20
> Hello all,
I'm using the sys_read to read chars from keyboard but I would like to =
read=20
the key as the user type the key, and not wait for the enter command to=
 read=20
the char.
What's the best solution to this problem?

Thanks,
Rafael Diniz

+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-+-
Engenharia da Computa=E7=E3o  --  Unicamp
http://www.gnu.org/philosophy/why-free.pt.html
Usu=E1rio do sistema operacional GNU/Linux
Chave PGP: http://www.dcc.unicamp.br/~ra017126/pubkey.asc
"Acreditar num conhecimento que pode ser vendido e
comprado =E9 uma forma sutil (e cruel) de perpetuar a ignor=E2ncia."
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-+-

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
