From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: PIII-IV SSE instructions set
Date: Sun, 03 Aug 2003 16:22:31 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F2D1AA7.81469078@wp.pl>
References: <20030803044232.97466.qmail@web11108.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

"Rodrigo F. Baroni" wrote:
> 
> Hello all,
> 
>     Does anybody knows if is possible to code in a
> linux enviroment using the PIII-IV SSE (Stream SIMD
> Extend) instructions set ?

Yes, it's possible if you have a kernel configured/compiled right so you
won't get "illegal instruction" while running your code and a cpu with
sse ;)
 
-- 
Maciej Hrebien

