From: h-peter recktenwald <lx@lxhp.in-berlin.de>
Subject: Re: GAS - \@ in macros and labels
Date: Thu, 30 May 2002 22:44:35 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020530224435.2d748db8.lx@lxhp.in-berlin.de>
References: <004C6F8A.C21188@si.com>
	<Pine.SGI.4.40.0205301306560.4473325-100000@shell01.TheWorld.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.SGI.4.40.0205301306560.4473325-100000@shell01.TheWorld.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Lanning <slanning@theworld.com>
Cc: kieft_brian@si.com, linux-assembly@vger.kernel.org

On Thu, 30 May 2002 13:13:25 -0400
Scott Lanning <slanning@theworld.com> wrote:

> On Wed, 29 May 2002 kieft_brian@si.com wrote:
> > .MACRO  tableHdr    someArgs
> > .SET    CMD_NUM,\@
> > A_CMD_NUM:
> >      .DC.W  (B_CMD_NUM - A_CMD_NUM)
> >     stuff....
> >
> >  .ENDM
> >
> >  .MACRO tableEnd    someArgs
> > B_CMD_NUM:
> >  .ENDM
> >
> >
> > Unfortunately GAS sees this as literal text and throws a bunch of "=
symbol
> > already defined" errors. Any ideas on how to make the CMD_NUM appea=
r as its
> > value in a label? Thanks,

if you want to generate linked/chained lists, you could use 'local' (nu=
meric)=20
labels, the range of which is far beyond the documented max. of 9. exam=
ples=20
can be found in the linux kernel (arch/i386/lib/checksum.S, macroes SRC=
, DST)=20
or, as aplied in "eForth" (http://www.lxhp.in-berlin.de/index-lx.shtml#=
e4)

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
