From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: writing a jump table
Date: Wed, 16 Mar 2011 19:23:08 -0700
Message-ID: <19841.28812.233966.341511@eidolon.muppetlabs.com>
References: <4D7FFFDD.5020103@gmail.com>
	<19840.863.574550.774103@eidolon.muppetlabs.com>
	<4D816E2B.2000409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4D816E2B.2000409@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Bock <nicolasbock@gmail.com>
Cc: linux-assembly@vger.kernel.org

> I think I figured it out now. I used gcc to compile PIC for the C
> switch statement and checked what it does. I don't fully understand
> it to be honest, but it seems to do the job also for non PIC code.

Of course -- PIC code just means that the code doesn't assume it knows
where it's located in memory, which for a shared-object library is a
necessary thing. It does mean the code has to jump through a few more
hoops, which is why the compiler doesn't make it the default.

b
