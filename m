From: "Kenton Brede" <kbrede@gmail.com>
Subject: Re: suffix or operands invalid for
Date: Fri, 22 Dec 2006 08:18:21 -0600
Message-ID: <d5418ffc0612220618ra72b5dfpcca0312c356b45ce@mail.gmail.com>
References: <d5418ffc0612211839n531644f2x11f8afc4f293f1dd@mail.gmail.com>
	 <458BD4BB.1050502@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <458BD4BB.1050502@verizon.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

On 12/22/06, Frank Kotler <fbkotler@verizon.net> wrote:
> Kenton Brede wrote:
> > I've done some scripting but don't consider myself a programmer.
>
> Ah. "Denial". Don't worry, it isn't so bad when you get used to it. :)

:)

> > Here are the errors when I run "as power.s -o power.o":
> >
> > power.s: Assembler messages:
> > power.s:14: Error: suffix or operands invalid for `push'
> ... etc.
>
> Your code... or Jonathan's... assembles silently and sweetly for me.
>
> "as --version" reports:
>
> GNU assembler 2.15.90.0.3 20040415
> Copyright 2002 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License.  This program has absolutely no warranty.
> This assembler was configured for a target of `i486-slackware-linux'.
>
> What's yours?

$ as --version
GNU assembler 2.16.91 20060118 Debian GNU/Linux
Copyright 2005 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
This assembler was configured for a target of `x86_64-linux-gnu'.

<snip>

Thanks to both of you for your replies.  You've helped me identify the
problem.  I'm trying to assemble the code on an x86_64 system.  I
tried the code using two identical versions of as, except one was 64
bit and the other 32.  The assembly code assembled fine on the 32 bit.

So I don't know if the code simply doesn't work with the 64 bit CPU or
the language of the program doesn't work with the 64 bit assembler.

At any rate I tried:

$ as --32 power.s -o power.o

$ ld power.o -o power

and got

ld: warning: i386 architecture of input file `power.o' is incompatible
with i386:x86-64 output

I then found if I put ".code32" at the top of the code it compiled but
seg faulted.

I'll use the 32 bit machine from now on.
Thanks,
Kent

-- 
"It may be true that the law cannot make a man love me, but it can stop him
 from lynching me, and I think that's pretty important." - Martin
Luther King Jr.
