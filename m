From: hp <lx@lxhp.in-berlin.de>
Subject: Re: warning: newbie attempting SSE
Date: Thu, 29 May 2003 16:41:27 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200305291442.h4TEg6MF007010@hirsch.in-berlin.de>
References: <3ED59433.4010906@lalila.net> <200305290914.h4T9E0MF022583@hirsch.in-berlin.de> <200305290903.38497.bstep@ugmoresearch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200305290903.38497.bstep@ugmoresearch.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Boyd Stephens am Donnerstag, 29. Mai 2003 15:03:
> How do you apply the patch to ald?

easiest way should be just replacing the rsp source files in the <source> and 
<include> dirs. alternatively, the diffs can be applied with <patch -p0 ..> 
if they are in the same dirs. i.e. at same level.

	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  pse, reply to << lx -at- lxhp -dot- in-berlin -dot- de >>
