From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: More about stacks
Date: Tue, 20 Sep 2005 03:45:06 +0200
Message-ID: <20050920014506.GA26987@MAIL.13thfloor.at>
References: <432892CD.3090907@colannino.org> <op.sw37qhgynro9m0@winfuck>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <op.sw37qhgynro9m0@winfuck>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cooper <peajay@funrestraints.com>
Cc: James Colannino <james@colannino.org>, linux-assembly@vger.kernel.org

On Wed, Sep 14, 2005 at 07:07:04PM -0400, Richard Cooper wrote:
> On Wed, 14 Sep 2005 17:14:53 -0400, James Colannino <james@colannino.org> wrote:
> 
> > First, I just wanted to ask and see if anyone here on the list has any
> > reading recommendations to help me understand the stack in detail as
> > well as the details about how memory is addressed and interacted with
> > via 386 32-bit protected mode.
> 
> I don't think there is much to know, but then I know it so it's hard
> for me to imagine what you're asking for, so you might ask again if I
> don't give the right answer.
>
> In protected mode, the OS is free to create virtual memory spaces for
> each process, so whatever memory address you access might actually be
> anywhere in real memory, but that's all stuff that the OS has to deal
> with. From an application perspective, you can forget about that. All
> you really need to know is that Linux will only put memory belonging
> to your process in your address space, so that there's no possible
> way you can overwrite memory belonging to the kernel or to another
> process.
>
> In Linux, you just have a 32-bit address space, the segment registers
> aren't used at all, they are all set to the same value and you never
> need to change them. So you basically just forget about segment
> registers because they don't matter anymore.
>
> Your program is loaded a little bit above address 0x80000000, and the
> top of your stack is somewhere around 0xC0000000, so SP is usually
> something like 0xBFFF1234. I don't know that the addresses above
> 0xC0000000 are ever used for anything.

this largely depends on the memory split, typical
linux split is 3/1 (i.e. 3GB userspace, 1GB kernel
space) so the kernel resides @ 0xC0000000 ...

if you change that to a 2/2 split, you would not
be able to get/see addresses above 0x80000000

> Calls to mmap (to map files into memory, or just to allocate more
> memory) seem to return pointers beginning at 0x40000000. I've never
> done more than one so I don't know how it spaces them, it might put
> them end to end beginning at 0x40000000, or try to space them out in
> the area below 0x80000000 so that calls to resize them are more likely
> to succeed.
>
> In any event, mmap can't return an address above 0x80000000 because
> negative return values indicate an error. I guess that's why the
> program and stack are loaded above 0x80000000, because that space is
> otherwise useless for mmap.

that's wrong, because the syscall wrapper does
check for a specific range (like -500 - 0) and 
outside that, the return value is a valid one
(unsigned long)

> I imagine Linux never puts anything at address 0x00000000, since NULL
> = 0 and it's used to specify when you're not supplying a pointer.

yep, the zero page is reserved and protected,
so that any access there will cause a trap

> As for the stack, you seem to already know that it expands downwards,
> I think that's all there is to know about it.
> 
> > The question I wanted to ask the list was that I know when you want to
> > expand the stack to make room for more data (particularly when you're
> > setting up local variables in C) you simply do a sub on %esp, but my
> > question is, how do you know when you do this that you aren't violating
> > data from some other process, or maybe even data belonging to other
> > sections of your code, .data for example.  Thanks :)
> 
> Since your entire address space is yours, the stack you have access
> to is entirely your own as well, so you won't interfere with other
> processes.
>
> As for your program code, there's about a gigabyte between where your
> program loads and where your stack is, so as long as your program size
> plus your stack size doesn't approach 1GB, then you've got nothing to
> worry about. And like I said, calls to mmap to allocate memory return
> pointers below 0x80000000, so memory allocated that way won't be in a
> place where it can get overwritten by the stack.

best,
Herbert

> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
