From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: switching to real mode?
Date: Fri, 25 Jul 2003 19:20:24 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F2166D8.65AE79D8@wp.pl>
References: <Pine.LNX.4.33.0307251536460.25632-100000@technix.oeh.uni-linz.ac.at>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Wolfgang Huber wrote:
> 
> Hi!
> 
> I know this question sounds a bit silly...
> How would one switch to real mode in Linux, are there any caveats?
> 
> Wolfgang

For what purpose you need it? From linux x86 users point of view: you
just can't, or am i wrong? ;) Generally once you switch to protected
mode you don't need real one and if you want to run some code written
for real mode you just run it in vm86 mode rather than switching it back
(as i remember dosemu does something like this). If you are interested
in "hard" switch i suggest to read ie. intel's "software developers
manual vol. 3, system programming", chapter 8 "processor management and
initialization", point 8 "mode switching" (1999 version).

Correct me linux-assemblers if i'm wrong!

-- 
Maciej Hrebien

