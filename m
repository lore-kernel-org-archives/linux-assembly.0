From: "Anant Aneja" <anantaneja@rediffmail.com>
Subject: bios interuppts
Date: 4 Mar 2003 12:07:42 -0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030304120742.6160.qmail@webmail7.rediffmail.com>
Reply-To: "Anant Aneja" <anantaneja@rediffmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

My problem is i was using turbo c++ compiler before and
frequently
used ROM-BIOS interupts for
certain functions ( like handling the screen, calling the mouse
etc all in dos based programs
using 386 based registers like ah al etc).

Now I've started using gcc and find that even a basic screen
clearing function requires me to use the
"ncurses" library. this i did but it handles the screen only
using
windows and does not treat the console as an
unlimited buffer.

I dont wanna use the library therefore. plus it was a lot easier
calling interupts for most simple tasks.
I've read somewhere that Linux does not allow BIOS interupts
since
it runs in 'protected' mode.
therefore, I cant do simple stuff like clearing a screen myself.

Is there some way to do the above task easily (with or without
assembly ?)

Please help.
Anant




