From: Niel A <amerei@gmail.com>
Subject: newbie
Date: Fri, 23 Dec 2005 16:50:14 +0000
Message-ID: <20051223165014.3a1db406.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

hello all!

i'm taking linux assembly as a hobby for christmas and i found your great site. the tutorials have been much helpful.

anyway, i meant to ask something.. 

section .data
	string: db "hi!",10

and i wanna capitalize the small letter 'h'.

at first i used
	mov di, string ; but di is 16 bits and ld complains

so i eventually started using the 32 bit ones to do the capitalisation operation. but for some reason, i lose all other letters, including the linefeed.

please point me to the right direction.

merry christmas,
- niel
