From: Lawrence <law@cbf.chinese2000.net>
Subject: Error on Compiling libASM on RH9
Date: Fri, 14 Nov 2003 09:07:54 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB42AEA.9030508@cbf.chinese2000.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi Linux asm gurus,

Thanks Zad, Peter and Brian for your kindly reply and pragmatic
suggestions.  I'll certainly try them out when I've got my linux asm
development environment done.

I'm seriosuly thinking about to use the asmutils and the libASM as the
basis of our embedded Linux development platform, and would like to port
our fully asm-written DOS program on it.

However, when I started to configure;make libASM on my RH9, I got the
following error:

make[2]: Entering directory `/home/law/asmtool/libASM-0.0.18/src/misc'
../../tools/asm2mkh StartupCode.s -i../../src/include/
-d___KERNEL_VERSION___=2
-d___KERNEL_PATCHLEVEL___=4 -d___KERNEL_SUBLEVEL___=20 -d___libASM___
-w+orphan-labels -w+macro-params -d___VERBOSE_FLAG___ -d___686___
-d___MMX___ -d___3DNOW___
(null):1108546392: error: phase error detected at end of assembly.
make[2]: *** [StartupCode.mkh] Error 1
make[2]: Leaving directory `/home/law/asmtool/libASM-0.0.18/src/misc'
make[1]: *** [misc~all] Error 2
make[1]: Leaving directory `/home/law/asmtool/libASM-0.0.18/src'
make: *** [src~all] Error 2

How could I overcome the issue?  My nasm version is 0.98.22 compiled on
Sep 19 2003.

Again, I honestly thanks for all your time and wisdom.

Thanks and Regards,
Lawrence

