From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Someone should correct me when I'm wrong.
Date: Fri, 16 Sep 2005 22:10:32 -0400
Message-ID: <op.sw75nudbnro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org


> Your program is loaded a little bit above address 0x80000000,

I can't believe no one caught that...  Linux programs load a little bit above 0x08000000, not 0x80000000.

The exact address is 0x08048080.  Thus there's almost 3GB of space between the program and the stack.

Hopefully that's all that I got wrong.
