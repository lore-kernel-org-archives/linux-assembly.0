From: Robert =?ISO-8859-1?Q?=D6stling?= <robost@home.se>
Subject: ELF and optimizations
Date: Wed, 27 Oct 2004 19:18:44 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20041027191844.02ffd728.robost@home.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

Hello,

When using proper ELF headers, things like lea reg,[reg-somelabel]
won't work. I found this in finger.asm and getty.asm

-- Robert =D6stling
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
