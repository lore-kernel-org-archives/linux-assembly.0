From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: terminal echoing
Date: Sun, 15 Sep 2002 16:11:49 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D849525.DBC15D49@wp.pl>
References: <4.3.2.7.2.20020915103136.00bdd600@mail.ciudad.com.ar>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hernan wrote:
> 
> Anyone knows how can set the terminal echoing off to get a password using a
> system call or manipulating /dev/tty (?) ?
> 
> Thanks!

see /usr/include/bits/termios.h

do TCGETS ioctl, set the c_lflag using ECHO mask in received termios
struct, do TCSETS ioctl

-- 
Maciej Hrebien

