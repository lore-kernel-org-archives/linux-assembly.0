From: willy meier <wklux@yahoo.co.uk>
Subject: correction: Re: Orphaned Processes and TCSETSW]
Date: Fri, 17 Oct 2003 18:22:10 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F902542.705ADCA4@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: linux-assembly@mlists.in-berlin.de, linuxassembly@evobsyniva.com

> Any suggestions?  Anyone know more than I do about this controlling terminal orphaned background process group stuff?

your problem may be due to interleaved saveing/restoreing of the rsp.
console state.

i.e. let program-1 save the console state, then modify; now program-2
starts & saves current state & modifies... which would restore _only_ if
the jobs would terminate in the same sequence as they were started.
				^-- REVERSED (i.e. last restores first)
many programs apparently save, modify and (attempt to) restore console
state!
I'd encounter that problem with 'less' and 'lib4th'/'F4'.


best,
	hp


-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<
