From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Executing memory mapped files
Date: Thu, 4 Aug 2005 12:11:11 -0700
Message-ID: <17138.26703.809921.895920@eidolon.muppetlabs.com>
References: <MC6-F34jriLdElsBt8s003595b5@MC6-F34.hotmail.com>
	<BAY7-F2808E06858B3CEE096030CDFC20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY7-F2808E06858B3CEE096030CDFC20@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Is it possible to load an executable binary (8k) into memory using mmap()
> function ant then executing the binary program in memory.

If by executable binary, you mean an ELF binary, then no, it wouldn't
be easy. (Obviously, it's *possible*, because that's exactly what
Linux does when you run a program.) You'd have to replicate all of the
program-loading processes that the kernel does for you.

The answer is to just use an exec function to run the program file
directly. There's no point in trying to mmap() it first (and in fact
the kernel will undoubtedly use mmap in the process of loading it).

b
