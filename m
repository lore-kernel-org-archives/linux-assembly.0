From: Vadiraj C S <vadiraj@mail.cyberneme.com>
Subject: Re: How to get allocate memory run time
Date: Thu, 12 Feb 2004 09:39:30 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040212093930.39dcba89.vadiraj@mail.cyberneme.com>
References: <20040211172713.07ca6282.vadiraj@mail.cyberneme.com>
	<16426.52763.577200.389101@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <16426.52763.577200.389101@eidolon.muppetlabs.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org


Mr Brian,

> libc's malloc et al work by using the brk system call (#45 in Linux).

  I know the implementation of malloc, using brk this is again a C implementation, What is the procedure
behind it, I mean how can this be done in assembly language. I dont want to call the extern functions from
asm. There would be some kind of asm implementation which does exactly what brk and sbrk does. I just want 
to know them.

  Thanks
  
-- 
                       With knowledge comes power, and with power comes responsability.  


With Best Regards
Vadiraj C S


