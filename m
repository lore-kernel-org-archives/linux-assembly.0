From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: ELF binarry
Date: Wed, 15 Oct 2003 14:56:00 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16269.49776.37061.807592@eidolon.muppetlabs.com>
References: <20031015160137.8874.qmail@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031015160137.8874.qmail@linuxmail.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> So, how can we get memory info (start & finish) from argv, envp, and
> programname..?

Just look at them in the debugger:

$ gdb ./foo
GNU gdb [... blah blah blah ...]
(gdb) b main
Breakpoint 1 at 0x8048433: file foo.c, line 6.
(gdb) r
Starting program: ./foo 
Breakpoint 1, main (argc=1, argv=0xbffff584, envp=0xbffff58c) at foo.c:6
(gdb) p argv[0]
$1 = 0xbffff698 "./foo"
(gdb) p envp[0]
$2 = 0xbffff6ad "VISUAL=/usr/bin/emacs"
(gdb) p envp[31]
$3 = 0xbfffffd9 "HISTSIZE=1000"

et cetera, et cetera ...

b
