From: Martin <asmfreshmeat@gmx.de>
Subject: GAS/GCC Assembler Code Modification
Date: Sat, 15 May 2004 11:28:07 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040515112807.579e4d89@deepblack>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi folks,

I have a question regarding GAS and GCC. 
Does the GAS modify the Assembler Code? If I try to assemble (for example) the following line:

popl %esi 

the gas changes that to

pop %esi 

Ok I guess this is ok, because the ESI Register is 'only' 32 Bit. So movw (= mov) would be ok. 

Next example:

If I try to assemble

movl $0xb,%eax 

the gas changes that to

mov $0xb,%eax

How can I tell gas that I dont want him to optimize the code?

Best regards,
Martin

PS: Sry for my poor english.

