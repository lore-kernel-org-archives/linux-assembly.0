From: linuxassembly@evobsyniva.com
Subject: Re: Keyboard and Mouse library
Date: Thu, 17 Jul 2003 15:26:53 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprsgyy3sclmcbdf@smtp-server.woh.rr.com>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com> <oprsdu2dzklmcbdf@smtp-server.woh.rr.com> <200307160746.30936.lx@lxhp.in-berlin.de> <oprsd8vhuulmcbdf@smtp-server.woh.rr.com> <3F16D2B1.129DF50B@wp.pl>
Reply-To: linuxassembly@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F16D2B1.129DF50B@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Thu, 17 Jul 2003 18:45:37 +0200, Maciej Hrebien <m_hrebien@wp.pl> wrote:

>> Doing an strace on stty reveals that it calls two mystery ioctls 0x5401 
>> and
>> 0x5403, and looking around the kernel source I figured out they are 
>> TCGETS
>> and TCSETSW, however I've been unsuccessful in tracking down any more
>> information than that.  The two ioctls lead to drivers/char/tty_ioctl.c,
>> which calls a function set_termios, which calls change_termios, which 
>> calls
>> ???.set_termios, and that's about where my ability to read C code comes 
>> to
>> an end.
>
> I don't know if i understand you right, but if want to switch off line
> buffering on terminal see man 3 termios routines or do ioctl on stdin.
> TCGETS gets the current termios structure, TCSETS sets. You modify
> c_*flag(s) and here you are. I also think c_lflag&=~ICANON may be
> usefull for you in this case. Is this what you wanted?

That's it.  I knew it was an ioctl, and that it was TCSETS, but I couldn't 
find that sturcture anywhere.  I just didn't know it was called termios, 
and so I didn't know what to look up in man.  
