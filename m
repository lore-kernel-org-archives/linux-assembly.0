From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: changing system time
Date: Tue, 05 Aug 2003 09:51:42 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F2F620E.E6875624@wp.pl>
References: <Law10-F122yL2m9lHiu0002bb96@hotmail.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Joshua Hudson wrote:
> 
> I have almost completed modifying date to permit changing the date.
> I'm not quite sure how to use the sys_settime system call.
> [edi] referrs to the number of seconds since the epoc in LOCAL time.

I think you are talking about sys_settimeofday, right? If so, it gets 2
ptrs as args: ebx - timeval struct, ecx - timezone struct. Or sys_stime?
it gets only one arg, in ebx & it measures in seconds from 0:0:0 __GMT__
01.01.1970.

-- 
Maciej Hrebien

