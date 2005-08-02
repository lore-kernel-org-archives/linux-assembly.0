From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: read key from keyboard
Date: Tue, 2 Aug 2005 19:12:49 +0200
Message-ID: <200508021755.00768.hitoc_mail@yahoo.it>
References: <opsjckfebuuqea3r@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <opsjckfebuuqea3r@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Cooper <generic@xersedefixion.com>
Cc: Linux Assembly <linux-assembly@vger.kernel.org>

On Tuesday 21 December 2004 08:29, Richard Cooper wrote:
> I just found this in the archive.  No one else answered it, so I guess I
> will.  It's quite the pain to figure out really.  I remember spending
> hours if not days trying to learn enough C that I could figure it out from
> the kernel source.  I really hate C.
>
> > How can I read a key from the keyboard when the key is available?
>
> You have to call TCSETSW, which sadly is like the most undocumented IOCTL
> ever...
>
> This code is copy & pasted out of my program Softer.  The assembly syntax
> is different, but I'm sure you can figure it out.  It also makes the I/O
> completely raw, meaning you'll receive 127 instead of 8 for backspace, and
> you'll receive 13 instead of 10 for enter.  This is more than you want if
> you're just looking to read the characters as they are typed, but I don't
> remember how I ever figured out the correct values to get it to do what I
> wanted.  However, if you also want scancodes, then this is exactly what
> you want.
>
> First you need to save the current settings which are creating the line
> buffering and other nonsense so that you can put them back when your
> program is done.
>
> sys sys_ioctl, 0, TCGETS, old_termios
>
> This requires a little structure to save into...
>
>    old_termios
>      .c_iflag resd 1
>      .c_oflag resd 1
>      .c_cflag resd 1
>      .c_lflag resd 1
>      .c_cc resb 19
>
> Then you call another function to set the new mode...
>
>    sys sys_ioctl, 0, TCSETSW, new_termios
>
> And of course this requires another structure...
>
>    new_termios
>      .c_iflag dd 0
>      .c_oflag dd ONLCR | OPOST
>      .c_cflag dd B38400 | CS8 | CREAD | HUPCL
>      .c_lflag dd 0
>      .c_cc db $0, $3, $1c, $7f, $15, $4, $0, $1
>            db $0, $11, $13, $1a, $0, $12, $f, $17
>            db $16, $0, $0

Ok. What are the meaning of this constants?
I suppose that with this type of ioctl function, I can have more
control over the keyboard.. Where I can find the documentation of
this constants?


>
> And finally when your program is finished you need to put things back like
> they were...
>
>    sys sys_ioctl, 0, TCSETSW, old_termios
>
> And those nice constants are:
>
> sys_ioctl = 54
> TCGETS = 0x5401
> TCSETSW = 0x5403
> ONLCR | OPOST = 5
> B38400 | CS8 | CREAD | HUPCL = 0x4BF

Yes, very nice! Why have you choosen B38400 | CS8 | CREAD | HUPCL ?
In an aonther example I found this: ICANON | ECHO | ISIG

Thanks,
HIToC

-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
