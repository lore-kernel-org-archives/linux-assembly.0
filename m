From: willy meier <phpr@mail.china.com>
Subject: Re: Orphaned Processes and TCSETSW
Date: Fri, 17 Oct 2003 18:18:10 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F902452.1AED8FE7@yahoo.co.uk>
References: <oprwydvy0ylmcbdf@smtp-server.woh.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: linux-assembly@mlists.in-berlin.de, linuxassembly@evobsyniva.com

linuxassembly@evobsyniva.com wrote:
> 
> I've made a new program for Softer, and when it starts up, if it's not run under Softer it will start Softer itself, so that people can just type 'gpsmap' instead of 'softer gpsmap'.  It works well, until it exits.  Upon exit, Softer gives this error message:
> 
> Error calling TCSETSW to restore settings.
	[ ... ]
> 
>         shell -> gpsmap -> softer
> 
> And if gpsmap exits first, there's a link missing in the chain.  If I execute it with 'softer gpsmap' then it's like this:
> 
>         shell -> softer -> gpsmap
> 
> And there's never any problem regardless of which exits first.
> 
> If I can't find a solution to the problem, I'll probably just make it call wait on Softer to make sure Softer exits first, but I'd rather fix the problem than just work around it.
> 
> Any suggestions?  Anyone know more than I do about this controlling terminal orphaned background process group stuff?

your problem may be due to interleaved saveing/restoreing of the rsp.
console state.

i.e. let program-1 save the console state, then modify; now program-2
starts & saves current state & modifies... which would restore _only_ if
the jobs would terminate in the same sequence as they were started.
many programs apparently save, modify and (attempt to) restore console
state!
I'd encounter that problem with 'less' and 'lib4th'/'F4'.


best,
	hp


-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<
