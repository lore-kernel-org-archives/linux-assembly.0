From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: paddw vs paddb
Date: Sat, 25 Dec 2004 11:40:42 +0100
Message-ID: <41CD43AA.B89C81AD@wp.pl>
References: <20041225072142.80563.qmail@web52908.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Ankit Jain wrote:
> 
> thanks
> 
> but if u can solve one more problem
> 
> 'a' is uint8_t type and i want to extract only 4 int
> and store it as a word in mmx register
> 
> i am not able to understand that because movq is
> extracting 8 bytes at a time.
> 
> actually the problem is overflow. saturation is not
> tht helpfull

I don't know if i understand your question right but for
32-bit transfers (4 bytes) you have MOVD instruction.

-- 
Maciej Hrebien

