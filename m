From: Pea Jay <peajay@evobsyniva.com>
Subject: Re: int 16 ?
Date: Sun, 16 Feb 2003 01:29:49 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030216012949.37412fb2.peajay@evobsyniva.com>
References: <20030215181726.56630.qmail@web11101.mail.yahoo.com>
	<3E4EB2E2.7DA23F1@seasurf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3E4EB2E2.7DA23F1@seasurf.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jdennon@seasurf.net
Cc: linux-assembly@vger.kernel.org

On Sat, 15 Feb 2003 13:36:34 -0800
Jack Dennon <jdennon@seasurf.net> wrote:

> fetch the next keyboard entry and return immediately with it?
>
> Having stalled out on this, I use curses.

Sadly, the easiest way I've found to do this is to use stty.

First fork and exec 'stty -g' and save it's stdout.  It's a special
string that restores the current mode.

Then fork and exec 'stty raw -echo'.  This will change all sorts of
things, e.g. you now have to output CRLF instead of just LF on stdout,
the characters aren't automatically echoed to the screen, and of course,
you get characters as soon as they're typed, typing enter gives you
character 13 instead of character 10, etc.  Basically, it'll work like
one would expect it to.

Just before your program ends, fork and exec stty with that string you
saved from earlier, and it'll put everything back like it was.

Using stty isn't all bad.  Supposedly the reason the ioctls to do this
are undocumented is because they might change, if they ever do, then
once someone fixes stty, your program will be fixed as well.  

This even works over telnet, for reasons I'm afraid to think about.

