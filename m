From: Mike Castle <dalgoda@ix.netcom.com>
Subject: Re: assembler reference
Date: Tue, 17 Jun 2003 09:11:29 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030617161129.GB6173@thune.mrc-home.com>
References: <200306161946.14714.gml@phrick.net>
Reply-To: Mike Castle <dalgoda@ix.netcom.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200306161946.14714.gml@phrick.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gml <gml@phrick.net>
Cc: linux-assembly@vger.kernel.org

On Mon, Jun 16, 2003 at 07:46:14PM -0400, gml wrote:
> can anyone recommend a decent assembler reference that covers intel and at&t 
> styles?  preferably something that comes in hardcover ;-)

I once saw a paper that described how to convert between the two.  It was
an internal engineering doc that had been released to the public, and it
was for a very well known and respected firm (at the time anyway).
Unfortunately I can't remember who it was from!

I am pretty sure I saw it come across the DJGCC lists years ago (i.e., when
in the era when it was still called DJGCC rather than DJGPP, which puts it
at the very begining of the project).

Anyway, at the time, I thought it was a very good document.  I just wish I
could find it again.

That aside, I found out some interesting info on DJ's site at delorie.com.

For example:

   Beginning  with  Binutils  2.10,  Gas  has an option that causes it to
   accept  the  Intel  syntax, so you can use Gas to assembly Intel-style
   code.

And linuxassembly.org looks useful.

Unless you buy a bound version of the docs for GAS, though, I don't think
you're going to find anything useful in print.  It's all online.

mrc
-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
