From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Troubles with JIT compiler
Date: Fri, 22 Jan 2010 09:19:14 -0800
Message-ID: <19289.56850.385830.564528@eidolon.muppetlabs.com>
References: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
	<1264137975.1983.30.camel@bob-desktop>
	<cb4d391b1001212204u73bbda5cub4e36e88836a2972@mail.gmail.com>
	<1264143669.1983.38.camel@bob-desktop>
	<cb4d391b1001212316p736a62cfrce0f5ad43896f671@mail.gmail.com>
	<cb4d391b1001220245n61ff839elc19851404017f4a3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <cb4d391b1001220245n61ff839elc19851404017f4a3@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> After someone's tip, I found a solution to this. Passing the linker
> '-z execstack' made it run, no problem. It's funny that Linux didn't
> complain about it, but rather just seg-faulted.

But the segfault is the complaint. What else would you hope for? In
general neither the compiler nor the linker has enough information to
reliably warn you of the issue before runtime.

It may also be worth noting that making stack memory non-executable by
default is a relatively recent change to Linux, done to ameliorate the
effectiveness of stack-based code exploits.

b
