From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: Re: paddw vs paddb
Date: Wed, 29 Dec 2004 12:12:44 +0000 (GMT)
Message-ID: <20041229121244.27226.qmail@web52908.mail.yahoo.com>
References: <41CD43AA.B89C81AD@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <41CD43AA.B89C81AD@wp.pl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl
Cc: assembly <linux-assembly@vger.kernel.org>

hi

i know about movd but i want to move 16bit atr a time

thanks
--- Maciej Hrebien <m_hrebien@wp.pl> wrote: 
> Ankit Jain wrote:
> > 
> > thanks
> > 
> > but if u can solve one more problem
> > 
> > 'a' is uint8_t type and i want to extract only 4
> int
> > and store it as a word in mmx register
> > 
> > i am not able to understand that because movq is
> > extracting 8 bytes at a time.
> > 
> > actually the problem is overflow. saturation is
> not
> > tht helpfull
> 
> I don't know if i understand your question right but
> for
> 32-bit transfers (4 bytes) you have MOVD
> instruction.
> 
> -- 
> Maciej Hrebien
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
>  

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
