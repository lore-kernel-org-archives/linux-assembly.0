From: Fred Leboucher <fred.leboucher@free.fr>
Subject: PPC unknown Special Purpose Register ?
Date: Sun, 16 May 2004 00:46:11 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <AA0FBBE2-A6C1-11D8-BEFE-003065BACE6A@free.fr>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

I have a problem here with a weird instruction taken from a program 
that is supposed to run on a PPC 750CXe :
	mfspr r3, 920
(I already swapped the bites 0-4 and 5-9 for convenience, so 920 is the 
real spr number that is used by the instruction)
Problem is, there is no special purpose register with the number 920, 
according to all documentations I have on the ppc 750...

Anyone could help with this ?
Thanks !

Fred Leboucher

