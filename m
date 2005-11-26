From: HIToC <hitoc_mail@yahoo.it>
Subject: sys_fork
Date: Sat, 26 Nov 2005 18:06:03 +0100
Message-ID: <200511261804.38432.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello list,
	I have written a small echo program that listen for a TCP
incoming connection on a port, then send all data received.

This program can accept only a session at time: I would to
handle multiple connections using fork(), but in assembly this
way is little difficult!
How to hold the controll over the child genereted?

Can anyone help me?
Thanks for every suggestion.
-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
