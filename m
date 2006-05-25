From: Adrian Ho <aho-linux-asm@03s.net>
Subject: Re: chdir on linux does not work
Date: Thu, 25 May 2006 11:55:18 +0800
Message-ID: <20060525035518.GA6288@megapower.03s.net>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com> <20060524042614.GA18142@kurp.hut.fi> <447401F4.4020603@comcast.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <447401F4.4020603@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Wed, May 24, 2006 at 02:49:24AM -0400, Frank Kotler wrote:
> Adding a call to sys_getcwd (__NR_ 183) (why is this man 3, not man 2 
> ???)

Are you talking about sys_getcwd(3) (which I've never seen or known to
exist) or getcwd(3)?  If the latter, there's a Linux-specific extension
that uses malloc() -- perhaps that's the reason why:

 As an extension to the POSIX.1 standard, Linux (libc4, libc5, glibc)
 getcwd() allocates the buffer dynamically using malloc() if buf is NULL
 on call. In this case, the allocated buffer has the length size unless
 size is zero, when buf is allocated as big as necessary. It is possi-
 ble (and, indeed, advisable) to free() the buffers if they have been
 obtained this way.

- Adrian
