From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Keyboard and Mouse library
Date: Thu, 17 Jul 2003 18:45:37 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F16D2B1.129DF50B@wp.pl>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com> <oprsdu2dzklmcbdf@smtp-server.woh.rr.com> <200307160746.30936.lx@lxhp.in-berlin.de> <oprsd8vhuulmcbdf@smtp-server.woh.rr.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

linuxassembly@evobsyniva.com wrote:
> 
> On Wed, 16 Jul 2003 07:46:30 +0100, hp <lx@lxhp.in-berlin.de> wrote:
> 
> > linuxassembly@evobsyniva.com am Mittwoch, 16. Juli 2003 04:09:
> >> On Wed, 16 Jul 2003 03:03:15 -0700, jeff <jko@save-net.com> wrote:
> >>
> >> There are some mysterious ioctls that control this as well, but they
> >> don't
> >> seem to be documented anywhere at all.  However, you can simply call the
> >
> > man 4 console_ioctl (or console_ioctls, old vers.)
> 
> The only thing I see that might apply is KDGKBENT and KDSKBSENT.  They
> might be related, but I can't tell, and suspect they are not.  There's no
> mention of anything that might remove the line buffering, or the byte 3
> leading to a sigkill thing.  As I mentioned, setting the keyboard in raw
> mode doesn't remove these things, it just mucks them up.  Instead of
> control-C sending a sigkill, it becomes the number 2 key, who's scan code
> is 3.
> 
> Doing an strace on stty reveals that it calls two mystery ioctls 0x5401 and
> 0x5403, and looking around the kernel source I figured out they are TCGETS
> and TCSETSW, however I've been unsuccessful in tracking down any more
> information than that.  The two ioctls lead to drivers/char/tty_ioctl.c,
> which calls a function set_termios, which calls change_termios, which calls
> ???.set_termios, and that's about where my ability to read C code comes to
> an end.

I don't know if i understand you right, but if want to switch off line
buffering on terminal see man 3 termios routines or do ioctl on stdin.
TCGETS gets the current termios structure, TCSETS sets. You modify
c_*flag(s) and here you are. I also think c_lflag&=~ICANON may be
usefull for you in this case. Is this what you wanted?

-- 
Maciej Hrebien

