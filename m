From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: ld error
Date: Tue, 28 May 2002 04:26:29 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15603.26981.802686.899671@shub.muppetlabs.com>
References: <m3r8jygir3.fsf@wobble.eth.net>
	<200205272027.52371.alfred.cleve@t-online.de>
	<m31ybwsuxv.fsf@wobble.eth.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <m31ybwsuxv.fsf@wobble.eth.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: Alfred Cleve <Alfred.Cleve@t-online.de>

> I don't think so, because the given assembly program has a main
> function; and the tutorial has given a step by step procedure to
> produce the executable.  
> 
> Inspite of my above statement, I am not very sure of the given
> assembly program being complete, basically because it doesn't work!
> But it does have a main function.

Instead of having to build the link line yourself, you could just let
gcc do it for you. That is, instead of:

    ld -m elf_i386 -static average.o /usr/lib/crtn.o /foo/bar/baz blahblahblah

use:

    gcc -static average.o

b
