From: Slack Traq <slacktraq@yahoo.com>
Subject: Re: changing system time - 'struct' implementation in asm
Date: Tue, 5 Aug 2003 18:49:04 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030806014904.406.qmail@web11409.mail.yahoo.com>
References: <3F2F620E.E6875624@wp.pl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F2F620E.E6875624@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


--- Maciej Hrebien <m_hrebien@wp.pl> wrote:
> Joshua Hudson wrote:
> > 
> > I have almost completed modifying date to permit
> changing the date.
> > I'm not quite sure how to use the sys_settime
> system call.
> > [edi] referrs to the number of seconds since the
> epoc in LOCAL time.
> 
> I think you are talking about sys_settimeofday,
> right? If so, it gets 2
> ptrs as args: ebx - timeval struct, ecx - timezone
> struct. Or sys_stime?
> it gets only one arg, in ebx & it measures in
> seconds from 0:0:0 __GMT__
> 01.01.1970.
> 
> -- 
> Maciej Hrebien
> 

How do you make a struct in assembly????
Thanks,
                                               Slack

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
