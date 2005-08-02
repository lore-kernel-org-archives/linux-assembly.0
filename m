From: a c <notawwal@yahoo.com>
Subject: im news, heres why
Date: Tue, 2 Aug 2005 16:31:31 -0700 (PDT)
Message-ID: <20050802233131.99326.qmail@web34012.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

i wanted to know about this, hopefully someone on here
can look at this and decode it, its a packet,
unfortunately i forgot to -s 0 on tcpdump before i saw
it
but ive seen it a few times before and this is as long
as it gets

04:04:39.6808717 00:XX:aa:XX:aa:XX 0000592
 0x0000 4500 0240 7678 0000 4011 fd35 0000 0000
 0x0010 ffff ffff 0044 0043 022c f66a 0101 0600
 0x0020 7aa4 e836 000a 0000 0000 0000 0000 0000
 0x0030 0000 0000 0000 0000 0000 d0a4 0214 0000
 0x0040 0000 0000 0000 0000 0000 0000 0000 0000
the corrosponding ascii translation, i dont trust
the line wrap.
E..@{x..@..5....
.....D.C.,.j....
z..6............
................
................

okay so i have no idea what this is, and that bothers
me a little bit, since it -seems- to accompany other
symptoms of funny networking, eg lag, telnet clearing
the screen, sometimes the telnet process forgets how
to
clean up after a backspace so to "a" becomes "_a" 
the _ is the cursor.. thats probably a whole different
issue for a whole different group, i just hope some
hex
master can look at that and go "that is <blah>" 
it occurs right after i "modprobe ndiswrapper" but
not every time. im not even sure why i care. im 
running 2.6.9 kernel, slackware 10 distro, lots of 
sloppy cross installations of everything, ndiswrapper 
1.0 for a realtek net8180 chipped dlink wireless b
adapter, in any case im looking forward to observing
the mailing list chatter, if there is any, cause this
stuff intrigues me and ill try to stay quiet and not
pester you guys like i do most of the "programmers" i 
know who mostly just have alot of library experience
:) heh


		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 
