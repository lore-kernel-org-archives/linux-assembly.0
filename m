From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: 0x2e & 0x3e prefixes
Date: Sun, 07 Sep 2003 10:50:37 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F5AF15D.13183444@wp.pl>
References: <3F4727DF.AE1E2EDB@wp.pl>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Maciej Hrebien wrote:
> 
> p4 & xeon cpus (as part of the sse2 extension) have branch hints
> prefixes (0x2e, 0x3e). My question is: are there any mnemonics for it?

Forgotten post.. it's "jcc,pn" or "jcc,pt" (echo "l:.byte 0x2e;je
l;.byte 0x3e;je l"|as|objdump -x). 

-- 
Maciej Hrebien

