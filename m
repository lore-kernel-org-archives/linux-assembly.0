From: Fabio <fabio@crearium.com>
Subject: Linux sparc assembly misc questions
Date: Sat, 19 Feb 2005 17:43:24 -0600
Message-ID: <1108856603.700.44.camel@0003ba16bccc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello,

I am trying to code a small asm program that store 0x1 on a register and increment it.

how to translate this:

ladd #$01
inca

to linux sparc assembly?

2. what are the implications of sparc register windowing when you program if you used to program on intel or 68hc11 ?

thanks.


