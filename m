From: Sameer.Seth@lntinfotech.com
Subject: causes of system hang
Date: Thu, 25 Apr 2002 11:02:05 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <OFE10BEF2C.288AC37E-ON65256BA6.001CEE4F@lntinfotech.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi all,
         there is a big confusion. it is related to the system hang. my
understanding about the system hang is that processor is not responding to
any of the interrupts. by saying this i mean: all the interrupts are
disabled thats why scheduling cannot take place. this may happen in the
kernel mode when the interrupts are disabled before entering the critical
regions like modifyng the kernel data structures which are shared by many
processors . if the interrupts are disabled and there is a tight loop or
dead lock situation in the critical regions of the code after this, the
system will not respond to the interrupts generated. and eventually system
will hang. are there any other ways by which system may hang. kindly let me
know.
regds
sameer

