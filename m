From: lynx.abraxas@freenet.de
Subject: precise debugging of inline asm
Date: Sun, 1 Jun 2008 17:01:40 +0200
Message-ID: <20080601150140.GA2832@drago>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello!


The  mentioning  of  gdb  in  this  mailinglist  gave  me  the  idea to ask my
unresolved question here as well:

Trying to port cpt2 to linux I have an inline assembly part of about 100 lines
that causes a segmentation fault while juggling around with memory. When I use
gdb for debugging it sadly only points me to the line  where  the  inline  asm
starts.  I  haven't  been able to figure out how to get a more precise info in
what line the actual segmentation fault comes from.
Does anybody here know if that is at all possible and if so, how? Would labels
to each line help?

Thanks for any help or hints.
Lynx


