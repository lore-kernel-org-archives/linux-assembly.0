From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: suffix or operands invalid for
Date: Fri, 22 Dec 2006 07:51:07 -0500
Message-ID: <458BD4BB.1050502@verizon.net>
References: <d5418ffc0612211839n531644f2x11f8afc4f293f1dd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <d5418ffc0612211839n531644f2x11f8afc4f293f1dd@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kenton Brede <kbrede@gmail.com>
Cc: linux-assembly@vger.kernel.org

Kenton Brede wrote:
> I've done some scripting but don't consider myself a programmer.

Ah. "Denial". Don't worry, it isn't so bad when you get used to it. :)

> Here are the errors when I run "as power.s -o power.o":
> 
> power.s: Assembler messages:
> power.s:14: Error: suffix or operands invalid for `push'
... etc.

Your code... or Jonathan's... assembles silently and sweetly for me.

"as --version" reports:

GNU assembler 2.15.90.0.3 20040415
Copyright 2002 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
This assembler was configured for a target of `i486-slackware-linux'.

What's yours?

Only thing I can suggest trying is dump the "l" from "pushl"/"popl" - 
but that should be fine! I'm stumped.

Best,
Frank

