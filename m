From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Win32 function call using GNU assembler
Date: Wed, 2 Sep 2009 11:35:06 -0700
Message-ID: <19102.47834.230223.108136@eidolon.muppetlabs.com>
References: <20090902081109.40BBA300022A@bmail00.one.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20090902081109.40BBA300022A@bmail00.one.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: uglyhunK <mail@uglyhunk.in>
Cc: linux-assembly@vger.kernel.org

> The following assembly source is not working. Really not sure where
> I'm going wrong.

Well, you're posting a windows programming question to a list called
linux-assembly. So that's the first thing I'd say that you're doing
wrong.

But, marshalling my vestigial Windows programming knowledge, it looks
like you're defining a WinMain function that calls CreateWindowEx and
then immediately exits, thus destroying the window well before it has
a chance to display itself. So that's your central problem.

b
