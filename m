From: Kircsi Tibor <tkircsi@gmail.com>
Subject: Re: Current break round up
Date: Wed, 01 Oct 2008 21:03:25 +0200
Message-ID: <1222887805.9248.15.camel@kirilla-desktop>
References: <1222802784.8421.10.camel@kirilla-desktop>
	 <48E37E93.3080101@verizon.net>
	 <61990392562924881677723846250054653396-Webmail2@me.com>
	 <48E3BFF0.6060900@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=ANuGpztlbKEZu+nww+3yBb+IF0s8qY0IW01J0MA5zUI=;
        b=Iqn92plbeJt0hXWbdY9eJ3GXf89LcRTshiM0sJeMdPbs5n+1UKQXRrswPUFbg4gcmh
         0aopHfeX9/NqG923pSUhmbU6OpJBfkAQOWMT9zYlDg5o42JCrWP7XEzW3cySDonjZ9qm
         Spusi9mGfppW2LvGpoM4VHWbEZaDHFy1Zj4Gc=
In-Reply-To: <48E3BFF0.6060900@verizon.net>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@verizon.net>
Cc: linux-assembly@vger.kernel.org

Hi,

I may have misunderstood what you wrote, but I took a probe: (debugged
with cgdb)

.include "../sharedlibs/linux.s"

.section .text
        .globl  _start
_start:
        movl    %esp, %ebp

        # 1st brk call
        movl    $0, %ebx                # %ebx = 0, get the current
curret_break
        movl    $SYS_BRK, %eax
        int     $INT                    # %eax = address of
current_break

        # 2nd brk call
        addl    $0x1002, %eax           # add 4098 to current
current_break
        movl    %eax, %ebx              # %ebx = the address of the new
current_break
        movl    $SYS_BRK, %eax
        int     $INT

        # 3rd brk call
        movl    $0, %ebx
        movl    $SYS_BRK, %eax
        int     $INT

        # 4th brk call
        movl    $SYS_BRK, %eax
        int     $INT

        # 5th brk call
        movl    $SYS_BRK, %eax
        int     $INT

        # sys_exit
        movl    $0, %ebx                # set the return value of the
program
        movl    $SYS_EXIT, %eax
        int     $INT

addresses:
1st - 0x8049000 it's OK, because linux loads programs into the 0x8048000
virtual address space, so this is the first page
2nd - 0x804a002 not aligned to 0x804b000
3rd - 0x804a002 same
4th - same
5th - same

That's ok, after the 2nd brk I just always ask for the current break
with %ebx = 0. So, it seems unaligned return after the 4th call too.

regards,
Tibor

On Wed, 2008-10-01 at 14:22 -0400, Frank Kotler wrote:
> Randall Hyde wrote:
> > Almost everything I've read about SYS_BRK says "don't use it."  It's an obsolete memory-management technique that has been left in the kernel to support legacy code. I'm not at all surprised to find that it isn't being maintained as well as it should as the kernel developers probably don't even think about it anymore. The correct way to do memory management under *NIX is to use anonymous memory-mapped files.
> 
> Dunno what you've been reading. Reading the output of "strace" gives me 
> a different impression. For example, "strace hla" reads like so:
> 
> execve("/usr/hla/hla", ["hla"], [/* 37 vars */]) = 0
> uname({sys="Linux", node="reltok1", ...}) = 0
> brk(0)                                  = 0x80ba544
> brk(0x80db544)                          = 0x80db544
> brk(0x80dc000)                          = 0x80dc000
> write(2, "Usage: hla options filename(s)\n\n"..., 199Usage: hla options 
> filename(s)
> 
> HLA (High Level Assembler - GAS back end, LD linker)
> Version 1.103 build 20424 (prototype)
> 
>    -?        Display help message.
>    -license  Display license information.
> ) = 199
> exit_group(1)                           = ?
> Process 14016 detached
> 
> (note, Kircsi, the unaligned return until the third call)
> 
> 'Course, ya can never tell what those high-level languages are gonna do! :)
> 
> Best,
> Frank
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

