From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: average
Date: Wed, 29 Dec 2004 22:22:56 -0800 (PST)
Message-ID: <20041230062256.64239.qmail@web52903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: assembly <linux-assembly@vger.kernel.org>

hi

actually problem i am facing is of average

i have a variable of uint8_t type

now the problem is when i add(paddb) N numbers then
the MMX register overflows i.e every byte overflow or
get truncated

so i want to make it a word....this is getting a prob.

thanks

ankit


	=09
__________________________________=20
Do you Yahoo!?=20
All your favorites on one personal page =96 Try My Yahoo!
http://my.yahoo.com=20
-
To unsubscribe from this list: send the line "unsubscribe linux-assembly"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
