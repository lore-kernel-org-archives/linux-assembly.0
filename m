From: Philip Jacob Smith <pj@evobsyniva.com>
Subject: Re: Orphaned Processes and TCSETSW
Date: Fri, 17 Oct 2003 17:37:57 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprw7idjuab2epmx@localhost>
References: <3F902542.705ADCA4@yahoo.co.uk>
Reply-To: pj@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F902542.705ADCA4@yahoo.co.uk>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


> i.e. let program-1 save the console state, then modify; now program-2
> starts & saves current state & modifies... which would restore _only_ if
> the jobs would terminate in the same sequence as they were started.
> 		            		^-- REVERSED (i.e. last restores first)
> many programs apparently save, modify and (attempt to) restore console
> state!

Yes, I think this is related.  Program-1 (gpsmap) doesn't modify any terminal settings, but rather it executes program-2 (softer) to do it, but I think the kernel may have something built into it to prevent what you described from happening, and so when it sees program-1 exit it disallows program-2 from changing the terminal settings under the expectation that it doing so would mess things up.  However, that's not the case this time, and in fact not allowing Softer to change the settings messes things up.

It's also possible that you can't change the settings when a program is currently blocking while reading the terminal, and since gpsmap exits, bash begins reading the terminal, and Linux then isn't able to allow Softer to change the settings while bash is reading.  I think I'm out of luck if that's the case.

- Pj

--- special one time signature line ---
(yes, blatant off-topic advertising)

Sucko's, the operating system so cool it...err...
(I don't want to use bad words on a public mailing list.)
http://www.evobsyniva.com/suckos/
It's probably a good thing it doesn't actually exist.

