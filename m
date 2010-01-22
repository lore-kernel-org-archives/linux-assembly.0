From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Troubles with JIT compiler
Date: Thu, 21 Jan 2010 21:26:15 -0800
Message-ID: <1264137975.1983.30.camel@bob-desktop>
References: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <cb4d391b1001212012l654d2a93qe8d05187f8f5ecf0@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Sibley <sisibley@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Thu, 2010-01-21 at 22:12 -0600, Scott Sibley wrote:
> I'm debugging a script engine. The engine compiles expressions into
> asm instructions, assigns that data to a function pointer, and
> executes the function, passing one argument.
> 
> I'm new to assembly, and pretty much stuck on the first issue I ran into.
> 
> Here are the function's instructions for a basic assignment operation:
> 
> 0x8067990:    push   %ebp
> 0x8067991:    mov    %esp,%ebp
> 0x8067993:    sub    $0x8,%esp
> 0x8067999:    fnstcw (%esp)
> 0x806799c:    mov    (%esp),%eax
> 0x806799f:    or     $0xc00,%eax
> 0x80679a4:    mov    %eax,0x4(%esp)
> 0x80679a8:    fldcw  0x4(%esp)
> 0x80679ac:    flds   0x806793c
> 0x80679b2:    fsts   0x805f014
> 0x80679b8:    fstps  0x8067954
> 0x80679be:    fldcw  (%esp)
> 0x80679c1:    add    $0x8,%esp
> 0x80679c7:    emms
> 0x80679c9:    leave
> 0x80679ca:    ret
> 
> Well, it appears to be crashing at the first instruction. Here are the
> values of ebp and esp.
> 
> (gdb) x/x $ebp
> 0xbffff168:    0xbffff188
> (gdb) x/x $esp
> 0xbffff14c:    0x0804e481
> 

An immediate problem I see is that the stack pointer is not properly
aligned. This is 32-bit code, and the Intel manual says that the stack
should be aligned at 32-bit addresses. That is, the least significant
digit in esp should be 0, 4, 8, or c.

I also note that the values in ebp and esp are very far apart.
Typically, they contain similar values -- addresses somewhere in the
stack.

I would look at how the stack was set up in this program.

--Bob


