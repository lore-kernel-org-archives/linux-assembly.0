From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: sys_swapon & NFS question
Date: Wed, 20 Aug 2003 10:38:04 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F43336C.B5785BEE@wp.pl>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi there,

why sys_swapon doesn't work on files via NFS? S_ISREG(..) gives me 0, so
bad_swap jmp take place & EINVAL is what i receive. Does anyone of you
know why, cause i can't figure this out? ( politics: because my "swap
host" may be switched off at any time? )

-- 
Maciej Hrebien

