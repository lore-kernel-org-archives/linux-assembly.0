From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: ELF binarry
Date: Tue, 14 Oct 2003 10:04:32 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16268.11424.66162.905157@eidolon.muppetlabs.com>
References: <20031014152812.24625.qmail@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031014152812.24625.qmail@linuxmail.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> with GDB or another debugger, can we look at highest memory address
> of ELF binarry.  if yes what is the command ?  where can i found
> some reference about it?

No, there is no gdb command for finding that.

For a typical ELF binary under Linux, the highest valid memory address
will be the space just above the top of the stack, 0xBFFFFFFF. This
space is used to stash the argv and envp array. The stack starts just
before that and grows downward. The actual program and other read-only
sections will be loaded at 0x08048000, followed by the read-write
sections and then the heap. Shared-object libraries tend to be loaded
from 0x40000000 on up.

None of this is written in stone, of course. But the vast majority of
Linux ELF binaries are laid out in this way.

Do be aware that just because 0xBFFFFFFF is valid doesn't mean that
every memory address less than that will be valid. In fact, most of
them won't be.

b
