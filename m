From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: init.asm - 0.03 (19-Jun-2002) - asmutils 0.18
Date: Fri, 02 May 2008 16:19:47 -0400
Message-ID: <481B7763.50605@verizon.net>
References: <4817406D.5000605@Giannone.de> <48198E19.7090605@verizon.net>
 <481B3754.7090000@Giannone.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <481B3754.7090000@Giannone.de>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bodo Giannone <Bodo@Giannone.de>
Cc: linux-assembly@vger.kernel.org

Bodo Giannone wrote:

...
> If I use another type of sh, for example ash from busybox I get the
> following error and no segfault: "can't access tty, job control turned off".

 From the Busybox FAQ:

--------------------
Why do I keep getting "sh: can't access tty; job control turned off" 
errors?  Why doesn't Control-C work within my shell?

     Job control will be turned off since your shell can not obtain a 
controlling
     terminal.  This typically happens when you run your shell on 
/dev/console.
     The kernel will not provide a controlling terminal on the /dev/console
     device.  Your should run your shell on a normal tty such as tty1 or 
ttyS0
     and everything will work perfectly.  If you <em>REALLY</em> want 
your shell
     to run on /dev/console, then you can hack your kernel (if you are 
into that
     sortof thing) by changing drivers/char/tty_io.c to change the lines 
where
     it sets "noctty = 1;" to instead set it to "0".  I recommend you 
instead
     run your shell on a real console...
-------------------

That's what it says...

> I think the cause could be the same. It could probably mean that init
> does not activate the ttys completely.

Agreed. I took a quick look at tty_io.c to see what noctty=1/0 does for 
us - that may be what init needs to do(?). No enlightenment yet (I'm not 
a good C programmer and not "oriented" in the kernel... don't expect too 
much).

The asmutils init does this:

sys_ioctl  [tty_fd], TCGETS, tty_termios
sys_ioctl  [tty_fd], TCSETSW, tty_termios

As a wild-asmed guess, I'm guessing we may want to tweak some flags in 
between. I need to study it some more, but that's the current theory...

I don't know if I know enough to help you with this, Bodo, but it's an 
"interesting puzzle".

Best,
Frank

