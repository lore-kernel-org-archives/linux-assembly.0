From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: sparc assembly mnemonic
Date: Mon, 21 Jun 2004 23:16:52 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40D75044.99C7F390@wp.pl>
References: <Pine.LNX.4.58.0406211231500.25030@ns.isi.ulatina.ac.cr> <20040621132143.2420ab01.davem@redhat.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

"David S. Miller" wrote:
> 
> On Mon, 21 Jun 2004 12:34:25 -0600 (CST)
> Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr> wrote:
> 
> > what are the sparc assembly  equivalent of the following instructions:
> >
> >     __asm__ __volatile__ ("fsave %0\n" : : "m"(fpubuf));
> >     __asm__ __volatile__ ("frstor %0\n" : : "m"(fpubuf));
> 
> You have to save each and every register by hand, unlike x86 there
> isn't a specific instruction which saves everything for you.

What about save/restore mechanism (tmp purposes)? Does it work only for
alu registers (not fpu)? I'm just curious - never played with sparc :(

-- 
Maciej Hrebien

