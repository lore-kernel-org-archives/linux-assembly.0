From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Keyboard and Mouse library
Date: Thu, 17 Jul 2003 22:11:21 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F1702E8.87C00F83@wp.pl>
References: <E19cPhx-0000W5-00@mail.tv-sign.ru> <200307160303.16120.jko@save-net.com> <oprsdu2dzklmcbdf@smtp-server.woh.rr.com> <200307160746.30936.lx@lxhp.in-berlin.de> <oprsd8vhuulmcbdf@smtp-server.woh.rr.com> <3F16D2B1.129DF50B@wp.pl> <oprsgyy3sclmcbdf@smtp-server.woh.rr.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

linuxassembly@evobsyniva.com wrote:
> 
> > I don't know if i understand you right, but if want to switch off line
> > buffering on terminal see man 3 termios routines or do ioctl on stdin.
> > TCGETS gets the current termios structure, TCSETS sets. You modify
> > c_*flag(s) and here you are. I also think c_lflag&=~ICANON may be
> > usefull for you in this case. Is this what you wanted?
> 
> That's it.  I knew it was an ioctl, and that it was TCSETS, but I couldn't
> find that sturcture anywhere.  I just didn't know it was called termios,
> and so I didn't know what to look up in man.

For sure: <asm/termbits.h>

Regards,

-- 
Maciej Hrebien

