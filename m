From: "=?iso-8859-1?q?Rodrigo=20F.=20Baroni?=" <rodrigobaroni@yahoo.com.br>
Subject: Re: int 16 ?
Date: Sat, 15 Feb 2003 15:17:26 -0300 (ART)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030215181726.56630.qmail@web11101.mail.yahoo.com>
References: <3E4D4D4A.9D5A139@seasurf.net>
Reply-To: rodrigobaroni@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3E4D4D4A.9D5A139@seasurf.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: jdennon@seasurf.net
Cc: linux-assembly@vger.kernel.org

 --- Jack Dennon <jdennon@seasurf.net> escreveu: >
When the PC boots up, the BIOS sets up an interrupt
> vector
> table at 0000:0000 with int 0x16 pointing into the
> BIOS keyboard
> driver. Linux uses this same vector table to access
> BIOS disk
> routines that are used for booting the system. Linux
> then sets up
> its own interrupt vector table and switches into
> protected mode.
> None of the original BIOS interrupts are then
> available, nor
> are they needed. There are several ways to read a
> single character
> at a time. One of the easier ways is provided by the
> curses
> library. Get on Amazon and look at the programming
> books
> by Matthew & Stones, and maybe even by J. Dennon.

    So the interrupt vector table created by linux is
other, that access the hardware of the another way so
(using for this others functions/drivers) ?

    I'm a student that loves architeture of computer,
assembly... , and I'm studing this topics at my
univesity now - I would like to do a lot of programs
to test and 'feel' the hardware and the intel
processor (I did this some time ago, but in DOS), but
using linux ...  There is some way to do this ? Like
manipulate control registers, bios interrupts, and so
on ? I had read "Linux Device Drivers", and some
another stuff, but I would like to know more about,
but in the raw mode - assembly, and if possible, in
"binary" mode (100101) or using hexa characteres - I
got this in DOS sometime ago (okay, I'm not crazy,
just wanting feel what is really going happen).

   Any knowlegde, docs, references about would be very
appreciated.


  Thanks a lot
Rodrigo F. Baroni

Computer Science Bach's Student
Sao Paulo, Brazil
  =20


_______________________________________________________________________
Busca Yahoo!
O servi=E7o de busca mais completo da Internet. O que voc=EA pensar o Y=
ahoo! encontra.
http://br.busca.yahoo.com/
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
