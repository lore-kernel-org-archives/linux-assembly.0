From: willy meier <wklux@yahoo.co.uk>
Subject: Re: Orphaned Processes and TCSETSW
Date: Mon, 20 Oct 2003 12:38:25 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F93C931.A9A32CB9@yahoo.co.uk>
References: <3F902542.705ADCA4@yahoo.co.uk> <oprw7idjuab2epmx@localhost> <3F92B6E9.BF7360A8@yahoo.co.uk> <oprxa2qb0ob2epmx@localhost>
Reply-To: ns@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pj@evobsyniva.com
Cc: linux-assembly@vger.kernel.org, linux-assembly@mlists.in-berlin.de

Philip Jacob Smith wrote:
> 
> This script causes the error.  You'll see stty complain about an I/O error.
> 

I forgot mentioning another -imho- quite odd behaviour which I didn't
find a single word of 'documentation' about, wrt the 'dup' and 'dup2'
syscalls, which I found a source of the difficulties which you
mentioned:

those syscalls do not duplicate the rsp. channels' descriptions but,
return just another index ('fd') to the rsp. single one description
array. thus, any modification to a 'dup'-ed channel will appear working
with its siblings, in the same manner.
apparently, only the settings which can be modified with the <fcntl>
syscall will be unique to the rsp. fd.

now, since stdin etc when passed as console channels (almost?) always
were set up with the 'dup' syscalls, there is no real distinction
between stdin/out/err and, the ioctl-ed modifications could easily
conflict with the rsp. channel's (copy) purpose.

my solution was reading the supposed to be modified channel's
description and its path+name (with <fstat> and, <readlink> - which
requires the /proc-fs), than closeing and newly opening the channel with
the required settings, with the <open> syscall, thus constituting a
truely independent console channel. 
<close>ing won't affect the parents channels, and the new one can't...


best,
	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<
