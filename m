From: Lawrence <law@cbf.chinese2000.net>
Subject: linux system call for allocation of memory
Date: Thu, 13 Nov 2003 16:14:12 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FB33D54.9000605@cbf.chinese2000.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi Linux asm gurus,


I would like to know if the linux kernel has the syscall for memory
manipulation(allocation, release and resize) that synonymous with DOS
48H of INT 21.  I've read some documents saying that these are
implemented in C library.

I know that I can use the flat memory model, but I would like to take
the allocaion/release approach, for easy porting my current DOS program
to Linux.

Thanks
Lawrence

