From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: PIII-IV SSE instructions set
Date: Mon, 04 Aug 2003 08:22:52 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F2DFBBC.77EBF446@wp.pl>
References: <20030804035830.22925.qmail@web11107.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@mlists.in-berlin.de, linux-assembly@vger.kernel.org

"Rodrigo F. Baroni" wrote:
> 
> 
>    Little correction, :
> 
> >         #;---- here starts the sse instructions
> >         #; a is loaded into xmm1
> >         #; b is loaded into xmm2
> >         mov %xmm0, %xmm1;
>               ^      ^
> >         mulps %xmm0, %xmm2;
>                 ^      ^

mov isn't sse instr! Try movaps.

-- 
Maciej Hrebien

