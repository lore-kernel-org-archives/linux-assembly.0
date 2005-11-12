From: Brian Raiter <breadbox@muppetlabs.com>
Subject: RE: Very newbie question...
Date: Fri, 11 Nov 2005 17:04:46 -0800
Message-ID: <17269.16302.176560.847323@eidolon.muppetlabs.com>
References: <437523A4.6080707@alice.it>
	<000301c5e715$e7a90370$619f3b80@NMAPod505BTLR>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <000301c5e715$e7a90370$619f3b80@NMAPod505BTLR>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> i have some problems with my first linux/nasm asm program.
> This is a simple "hello world" program but i can't see the "hello
> world" on my screen and i don't find my error.

As noted, you are confusing the function call method with the system
call method, and doing a little of both. You need to decide on one or
the other.

If you want to make direct kernel system calls, then follow the code
that was posted earlier. Alternately, if you wanted to use the POSIX
functions, your code would look something like this:

EXTERN write, _exit

; ...

	push	len
	push	hello
	push	1
	call	write
	add	esp, 12
	push	0
	call	_exit

b
