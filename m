From: Deepak Pandey <deepak.pandey@wipro.com>
Subject: Unable To Jump To Undefined Symbol
Date: Tue, 14 Mar 2006 19:16:30 +0530
Message-ID: <4416C936.2010403@wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hi,
  I got a compilation problem saying UNABLE TO JUMP TO UNDEFIND SYMBOL 
while compiling a code in which I tried to jump to a symbol(symbol_name) 
from a different file by an assembly instruction (j symbol_name).However 
I also declared the symbol as global(.globl symbol_name) but still it 
didnot worked.
The Symbol was defined as follows:
         LEAF(symbol_name)
     /*some assembly instructions*/
     END(symbol_name)
Thanks in Advance.
