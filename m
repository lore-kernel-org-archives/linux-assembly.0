From: lynx.abraxas@freenet.de
Subject: How to push PIC reg before seven input operands get loaded?
Date: Sat, 24 Mar 2007 01:25:51 +0100
Message-ID: <20070324002551.GA15079@drago.uni-regensburg.de>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hallo!


I got a bit further with my problem. Now I'm stuck on how to save the register
used when -fPIC is enabled to  the  stack  before  my  seven  input  operands,
needing  all  registers, get loaded. Is that somehow possible? I couldn't find
any examples on the net. It seems not to be necessary in the original code for
MSC.

Also I wonder which -f option that comes with -O2 makes gcc stop reporting:
error: can't find a register in class 'LEGACY_REGS' while reloading 'asm'

Thanks.
Lynx



