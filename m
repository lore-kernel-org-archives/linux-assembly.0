From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Access to Program Counter in C
Date: Fri, 19 Nov 2004 03:30:54 -0800
Message-ID: <16797.55662.422644.907944@eidolon.muppetlabs.com>
References: <20041116163821.61564.qmail@web51902.mail.yahoo.com>
	<419D9361.6070903@codito.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <419D9361.6070903@codito.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> A M wrote:
>> Does anybody know how to access the address of the
>> current executing instruction in C while the program
>> is executing?
> doing exactly as your words say, won't be possible (as
> far as my limited experience with ix86 architecture goes),
> but something nearabout can be achieved with little inline
> assembly fragment.

Actually, there's a gcc-specific extension that can do this, namely
the unary && operator, which will return the address of a goto label:

int somefunction(void)
{
    /* ... */
    void *pc = &&here;
  here:
    /* ... */
}

Of course you shouldn't use this unless you completely don't care
about portability.

b
