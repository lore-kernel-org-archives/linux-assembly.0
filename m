From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: changing system time - 'struct' implementation in asm
Date: Wed, 06 Aug 2003 09:53:12 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F30B3E8.E9D401C9@wp.pl>
References: <20030806014904.406.qmail@web11409.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Slack Traq wrote:
> 
> How do you make a struct in assembly????

<gas in .data or .bss>

timv: .long 0  # tv_sec
      .long 0  # tv_usec

<gas locally on stack>

# ...

pushl $0  # tv_usec
pushl $0  # tv_sec

# ...

$timv or %esp points to your timeval struct. If you want timv to be not
local, write .globl/.global timv.

-- 
Maciej Hrebien

