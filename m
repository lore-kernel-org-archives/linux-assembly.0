From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: jmp instruction
Date: Sun, 2 Feb 2003 06:33:40 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15933.11332.927221.312389@eidolon.muppetlabs.com>
References: <2338DB4A-36AF-11D7-92D5-000A27B17C58@ticino.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <2338DB4A-36AF-11D7-92D5-000A27B17C58@ticino.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> I need to go 10 bytes forward from main+8 (because 18-8=10) to skip mov 
> $0x4,%eax, so i wrote jmp 0xa. Unfortunately the program causes a 
> segmentation fault (core dumped), and I don't understand why.

Did you try using stepi while you were in the debugger to see what
actually happened at your jmp instruction? If so, you would have seen
that you had also jumped over the mov $0x0,%ebx instruction. Jumps are
calculated from the end of the jump instruction, not the beginning.

b
