From: "Richard Cooper" <generic@xersedefixion.com>
Subject: Softer Terminal Emulator
Date: Tue, 21 Dec 2004 01:37:20 -0500
Message-ID: <opsjch0iu0uqea3r@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org


I tried emailing the linuxassembly.org web site maintainer a couple of  
times to get the link updated, but with no luck.

Anyhoo, here's the new address:

http://www.xersedefixion.com/softer/

The current version is 122.  Versions 118 through 120 have a  
security-related bug in them.  Version 121 fixed the bug, and included a  
couple of changes to make sure something similar doesn't happen again.

Other changes since 119 are pretty minor.  It now does a kinder and  
gentler job of killing it's subprograms on control-alt-backspace, and I  
think I fixed a problem where pressing alt-something failed to actually  
send anything to the program.  And now that I think about it there's still  
a bug where the fill command always results in something being drawn on  
the screen even if all of the coordinates are off to the side.  I'll fix  
that next time.

I also threw in a file with instructions on how to use it.  I don't know  
why it never occured to me before that it might not be obvious.
