From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: ALD - patch update
Date: Mon, 8 Apr 2002 12:26:12 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <a8rrcc$60j$2@main.gmane.org>
Mime-Version: 1.0
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Hello,
	I fixed some things around attach/detach (breakpoints cleanups etc)
plus I added flags register decoding (Yeah now you can stop extracting 
flags bits by hand :))

It can be downloaded from http://ruik.sh.cvut.cz/ald.html
where you can find original source and a link to patch.

I have added L2 cache (thanks to H-Peter) to this mashine so I hope it 
will be OK. (got several hangups during boot, but adjusteted timigs and 
it is still running :)

Regards
		Rudolf




