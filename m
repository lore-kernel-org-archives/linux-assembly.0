From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Info for System Call Implementation.
Date: Mon, 08 Sep 2003 12:19:25 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F5C57AC.2C7907F1@wp.pl>
References: <8EA11405E59BD611BA7100104B93C2600208D99A@exdel01.del.mgsl.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Harmeet Uppal wrote:
> 
> Hi All,
> 
> I am interested in writing my own system call  for Linux. I had read
> somewhere this is possible. can this be implemented via a module program or
> I would need to recompile the complete kernel for this ( this would be
> certainly be possible). What is the -syscall3 thing?

There is a short description in khg how to add your own syscall, it's in
syscall86.html file. _syscall3 is a macro for doing int $0x80 with 3
args, see asm/unistd.h.

-- 
Maciej Hrebien

