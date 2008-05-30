From: Karsten Scheibler <laml@unusedino.de>
Subject: Re: init.asm - 0.03 (19-Jun-2002) - asmutils 0.18
Date: Fri, 30 May 2008 22:34:54 +0200
Message-ID: <20080530203539.AB96F7B24@gw.unusedino.de>
References: <4817406D.5000605@Giannone.de> <48198E19.7090605@verizon.net> <481B3754.7090000@Giannone.de> <481B7763.50605@verizon.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <481B7763.50605@verizon.net>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello,

>> If I use another type of sh, for example ash from busybox I get the
>> following error and no segfault: "can't access tty, job control turned 
>> off".
>
> From the Busybox FAQ:
>
> --------------------
> Why do I keep getting "sh: can't access tty; job control turned off" 
> errors?  Why doesn't Control-C work within my shell?
>
>     Job control will be turned off since your shell can not obtain a 
> controlling
>     terminal.  This typically happens when you run your shell on 
> /dev/console.
>     The kernel will not provide a controlling terminal on the /dev/console
>     device.  Your should run your shell on a normal tty such as tty1 or 
> ttyS0
>     and everything will work perfectly.  If you <em>REALLY</em> want your 
> shell
>     to run on /dev/console, then you can hack your kernel (if you are into 
> that
>     sortof thing) by changing drivers/char/tty_io.c to change the lines 
> where
>     it sets "noctty = 1;" to instead set it to "0".  I recommend you 
> instead
>     run your shell on a real console...
> -------------------

Bodo haven't you got my mail from april ?

i've sent you a test program in C to determine if the controlling tty 
stuff would fix the problem ... haven't got an answer so far from you



karsten
