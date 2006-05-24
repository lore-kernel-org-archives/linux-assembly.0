From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: chdir on linux does not work
Date: Wed, 24 May 2006 00:15:19 -0700
Message-ID: <17524.2055.728735.900869@eidolon.muppetlabs.com>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com>
	<20060524042614.GA18142@kurp.hut.fi>
	<447401F4.4020603@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <447401F4.4020603@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

> Adding a call to sys_getcwd (__NR_ 183) (why is this man 3, not man
> 2 ???)

Good question, actually. I don't know.

>> You can't e.g. write a replacement for shell's builtin "cd"
>> command that way.
> 
> Okay, how *would* we do that?

It is simply not possible. Like setenv, cd absolutely must be a shell
builtin.

b
