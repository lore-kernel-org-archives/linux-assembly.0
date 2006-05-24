From: Timo Lindfors <lindi@kurp.hut.fi>
Subject: Re: chdir on linux does not work
Date: Wed, 24 May 2006 15:17:44 +0300
Message-ID: <20060524121744.GA28190@kurp.hut.fi>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com> <20060524042614.GA18142@kurp.hut.fi> <447401F4.4020603@comcast.net> <17524.2055.728735.900869@eidolon.muppetlabs.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <17524.2055.728735.900869@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

Hi,

On Wed, May 24, 2006 at 12:15:19AM -0700, Brian Raiter wrote:
> It is simply not possible. Like setenv, cd absolutely must be a shell
> builtin.

Indeed, unless you do some dirty tricks by using ptrace(2) to attach
to the parent and force it to do the chdir syscall :)

best regards,
Timo Lindfors
