From: Andreas Schwab <schwab@suse.de>
Subject: Re: wrong opcode?
Date: Fri, 14 Jun 2002 22:18:47 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <je4rg5d36g.fsf@sykes.suse.de>
References: <004E42C8.C21188@si.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <004E42C8.C21188@si.com> (<kieft_brian@si.com>'s message of
 "Fri, 14 Jun 2002 13:27:06 -0400")
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: kieft_brian@si.com
Cc: linux-assembly@vger.kernel.org, binutils@sources.redhat.com

<kieft_brian@si.com> writes:

|> I curious as to why the code generated for these two move.w commands=
 is
|> completely different. In the first assembly I used two variables (on=
e equal to 0
|> and the other equal to 8). I tried doing a move using the variables =
added
|> together as my offset to register A1 and managed to get 33B9 0000 00=
00 0170 0000
|> 0008. When I simply put an 8 in instead of the variables, I got the =
correct
|> code. 3379 0000 0000 0008. Any ideas??????
|>=20
|> I'm using gnu as on a pc-cygwin system with a m68k target.=20
|>=20
|>=20
|> 3901 034a 0000 0008         .DC.L   C_WCP1_MSG_PARM
|>  3902 034e 0000 0000        .DC.L   HWPN_PARM_OFS
|>  3903 0352 33B9 0000 MOVE.W SYS_SYS_VERS_W,C_WCP_MSG_PARM+HWPN_PARM_=
OFS(%A1)
|>  3903      0000 0170=20
|>  3903      0000 0008=20

The other opcode is not wrong, it just uses the 32bit offset form.  How
are C_WCP_MSG_PARM and HWPN_PARM_OFS defined?  Please provide a complet=
e,
self-contained test case.

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux AG, Deutschherrnstr. 15-19, D-90429 N=FCrnberg
Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
