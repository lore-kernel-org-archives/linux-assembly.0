From: Emmet Ford <emmet@optonline.net>
Subject: Re: gdb help
Date: Mon, 23 Feb 2004 20:18:28 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <403AA664.1070501@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

I use gas rather than nasm, but I also find that I am unable to break on 
the first instruction in a program. Generally, what I do is use the gdb 
'list' command to list out the program and then set a break point on the 
line number of the second instruction in the program.

This issue is documented in various places, one of them being 
http://www.csee.umbc.edu/~chang/cs313.f03/gdb_help.shtml, where it says:

-->
Due to a bug in gdb,

<br> break *_start<br> does not stop the program before the execution of 
the first instruction. A workaround is to add a no operation instruction 
(mnemonic "nop") to the beginning of your program and use: <br> break 
*_start+1

<--

This may not be the problem that you are experiencing, however, since 
programs normally start at _start, not main. In any case, you might try 
break *main+1

--Emmet Ford


