From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: OSS ioctls...
Date: Wed, 22 Dec 2004 22:45:03 +0100
Message-ID: <41C9EADF.6A4143AD@wp.pl>
References: <41C988EB.9CC568EF@comcast.net> <opsje7k0wruqea3r@sucks.airplane.fire>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Richard Cooper wrote:
> 
> The only thing I could think might be wrong is that the ioctl numbers are
> wrong, but I looked in soundcard.h and it says SNDCTL_DSP_GETFMTS is ('P',
> 11) which best I can figure has to be $500B.

OK, i have had time to check it... SNDCTL_DSP_GETFMTS is eq to
_SIOR('P',11,int) which evaluates to:

((int)(SIOC_OUT|((sizeof(t)&SIOCPARM_MASK)<<16)|(x<<8)|y))
where x='P', y=11, t=int

Look soundcard.h for more details. Hope this helps and sorry for 3 posts
-
somethimes it happens ;)

-- 
Maciej Hrebien

