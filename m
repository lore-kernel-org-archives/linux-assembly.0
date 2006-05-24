From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: chdir on linux does not work
Date: Tue, 23 May 2006 23:18:29 -0700
Message-ID: <17523.64181.553724.79208@eidolon.muppetlabs.com>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Anyone can tell me why this chdir code doesnot work on
> linux ?

> section .data
> dir:    db      '/bin'

You forgot to NUL-terminate your string. A dangerous mistake, as it
can become a Heisenbug. You were lucky it failed to work for you. Use
this instead:

dir:	db	'/bin', 0

b
