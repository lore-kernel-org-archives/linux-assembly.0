From: Frank Kotler <fbkotler@verizon.net>
Subject: Re: Current break round up
Date: Wed, 01 Oct 2008 16:27:29 -0400
Message-ID: <48E3DD31.5030300@verizon.net>
References: <1222802784.8421.10.camel@kirilla-desktop>
 <48E37E93.3080101@verizon.net>
 <61990392562924881677723846250054653396-Webmail2@me.com>
 <48E3BFF0.6060900@verizon.net> <1222887805.9248.15.camel@kirilla-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <1222887805.9248.15.camel@kirilla-desktop>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kircsi Tibor <tkircsi@gmail.com>
Cc: linux-assembly@vger.kernel.org

Kircsi Tibor wrote:
> Hi,
> 
> I may have misunderstood what you wrote, but I took a probe: (debugged
> with cgdb)
> 
> .include "../sharedlibs/linux.s"
> 
> .section .text
>         .globl  _start
> _start:
>         movl    %esp, %ebp
> 
>         # 1st brk call
>         movl    $0, %ebx                # %ebx = 0, get the current
> curret_break
>         movl    $SYS_BRK, %eax
>         int     $INT                    # %eax = address of
> current_break
> 
>         # 2nd brk call
>         addl    $0x1002, %eax           # add 4098 to current
> current_break
>         movl    %eax, %ebx              # %ebx = the address of the new
> current_break
>         movl    $SYS_BRK, %eax
>         int     $INT
> 
>         # 3rd brk call
>         movl    $0, %ebx
>         movl    $SYS_BRK, %eax
>         int     $INT
> 
>         # 4th brk call
>         movl    $SYS_BRK, %eax
>         int     $INT
> 
>         # 5th brk call
>         movl    $SYS_BRK, %eax
>         int     $INT
> 
>         # sys_exit
>         movl    $0, %ebx                # set the return value of the
> program
>         movl    $SYS_EXIT, %eax
>         int     $INT
> 
> addresses:
> 1st - 0x8049000 it's OK, because linux loads programs into the 0x8048000
> virtual address space, so this is the first page
> 2nd - 0x804a002 not aligned to 0x804b000
> 3rd - 0x804a002 same
> 4th - same
> 5th - same
> 
> That's ok, after the 2nd brk I just always ask for the current break
> with %ebx = 0. So, it seems unaligned return after the 4th call too.

Hi Tibor,
(sorry I called you "Kircsi")
I didn't mean that sys_brk aligned itself "automatically" by repeated 
calls. I ASSume that, unseen in the "strace" output, %ebx is being 
aligned "by hand" to a page boundary before that last sys_brk.

>> Randall Hyde wrote:

BTW, Randy, I ASSumed that you intended to reply to the list. Ya gotta 
hit "reply all" or it goes just to the sender...

I don't disagree that sys_mmap (or sys_mmap2?) is a better bet for 
allocating memory, but it isn't much use for "exploring" sys_brk...

Best,
Frank


