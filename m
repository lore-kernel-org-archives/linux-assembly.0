From: lx <lx@lxhp.in-berlin.de>
Subject: Re: asmutils 0.17
Date: Mon, 19 Aug 2002 06:38:58 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020819063858.080df0d0.lx@lxhp.in-berlin.de>
References: <20020817181020.28d3a051.stephan.walter@gmx.ch>
	<Pine.LNX.4.43L.0208181505381.1622-100000@alpha.linuxassembly.org>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.43L.0208181505381.1622-100000@alpha.linuxassembly.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

On Sun, 18 Aug 2002 18:53:45 +0400 (MSD)
Konstantin Boldyshev <konst@linuxassembly.org> wrote:

> On Sat, 17 Aug 2002, Stephan Walter wrote:
>=20
> > truss.asm should be updated. As a label of a "dd" statement it uses
> > "pause", which is a reserved word in NASM 0.98.33 (and possibly in =
all
> > the 0.98.xx versions).
>=20
> Yes, I will update it, but not because of nasm.
> It introduces quite an issue with LIBC build.

any syscall name would...

this is how i found that despite all switches and 'options' to ld or=20
cc those did always link some, obscure 'glibc' into my 'lib4th' code=20
- until using the static archive.

hp

--=20
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
     software=A0patents=A0http://petition.eurolinux.org/pr/pr17.html
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
