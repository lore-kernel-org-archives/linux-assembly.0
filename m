From: Mateusz Kocielski <shm@nation.pl>
Subject: Re: Problem with nasm
Date: Sun, 27 Mar 2005 00:58:46 +0100
Message-ID: <4245F736.1070600@nation.pl>
References: <Pine.LNX.4.21.0503261209420.570-100000@hestia>	<4245D101.2050206@nation.pl> <16965.62791.870164.701108@eidolon.muppetlabs.com>
Reply-To: shm@nation.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <16965.62791.870164.701108@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

Brian Raiter wrote:

> Try compiling with "gcc -nostartfiles -o exit exit.o" instead, and see
> if you get different results. If so, then gcc probably knows of some
> extra arguments that ld needs to produce a proper executable. Whenever
> feasible, you should let gcc do the linking for you instead of
> invoking ld directly. ld can take a lot of cmdline arguments.
> 
> The "-nostartfiles" option will tell gcc not to supply a _start
> routine, and not to link in the usual C libraries. You will probably
> still get a slightly bigger executable than if you invoked ld
> directly, but not by much.

$ nasm -felf -o exit.o exit.s
$ gcc -nostartfiles -o exit exit.o
$ strace ./exit
.
.
.
_exit(0)                                = ?

It works ok, thank you very much.

-- 
Shm - shm ( at ) irc7 ( dot ) pl
EKG: 2099452  JID: shm@chrome.pl
homepage : http://shm.nation.pl/
