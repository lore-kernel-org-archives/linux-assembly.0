From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: LinuxAsmTools Announcement
Date: Thu, 18 Dec 2008 20:36:24 -0800
Message-ID: <18763.9416.687634.712515@eidolon.muppetlabs.com>
References: <200812131056.00246.linuxasm@gmail.com>
	<d6b7c4190812181950o6bc5d5ebv3196ee2a0cf9b575@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d6b7c4190812181950o6bc5d5ebv3196ee2a0cf9b575@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pei lin <telent998@gmail.com>
Cc: jeff <linuxasm@gmail.com>, linux-assembly@vger.kernel.org

> when i disassemble *.o object file on x86 machine and find
> instruction "call 0xFCFFFFFF",because not link,but why this address
> 0xFCFFFFFF not 0xFFFFFFFF or others?

First of all, the value is not 0xFCFFFFFF, it's 0xFFFFFFFC
(little-endian), which is the 32-bit equivalent of -4.

And the reason for the -4 is that it's an offset. When the linker
fills in the real address, it will subtract the subroutine's absolute
address from the address of the -4 value to get a relative address,
which it will then add to the existing -4 to get the correct relative
address for the call instruction. And, the reason that 4 needs to be
subtracted is that when the call is executed, it will actually jump
from the end of the call instruction, which is 4 bytes ahead of where
the relative address is stored.

b

