From: "Joshua Hudson" <joshudson@hotmail.com>
Subject: (unknown)
Date: Wed, 09 Oct 2002 09:31:36 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <F129z5Bl8LgFuoe5ciz00000d57@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-assembly@vger.kernel.org
Cc: konst@ipian.kazan.ru

When hunting down the last errors remaining in tar, I came across
a particularly weird one in both tar and chmod.

Try chmod 4755 true. True will have mode 755.
This happens in linux 2.0.63, 2.2.22, 2.4.18-3
Is anybody else getting this? Anybody have a solution?

_________________________________________________________________
Join the world=92s largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com

