From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Troubles with JIT compiler
Date: Thu, 21 Jan 2010 23:01:09 -0800
Message-ID: <1264143669.1983.38.camel@bob-desktop>
References: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
	 <1264137975.1983.30.camel@bob-desktop>
	 <cb4d391b1001212204u73bbda5cub4e36e88836a2972@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <cb4d391b1001212204u73bbda5cub4e36e88836a2972@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Sibley <sisibley@gmail.com>
Cc: linux-assembly@vger.kernel.org

Very big oops here! See below.


> >>
> >> Well, it appears to be crashing at the first instruction. Here are the
> >> values of ebp and esp.
> >>
> >> (gdb) x/x $ebp
> >> 0xbffff168:    0xbffff188
> >> (gdb) x/x $esp
> >> 0xbffff14c:    0x0804e481
> >>

I misread your gdb display. I'm used to using the i r command to look in
the registers.

You used the x/x command, which shows the contents of the register, then
what it is pointing to.

So the values in ebp and esp DO look reasonable. That's the range I
expect in 32-bit program, and they are reasonably close to each other.

I apologize for my error.

From what you have posted, I don't see any problems with the first few
instructions. So I have no idea why the program is crashing there.

Sorry...

--Bob


