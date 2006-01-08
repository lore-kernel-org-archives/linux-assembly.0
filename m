From: Niel A <amerei@gmail.com>
Subject: Re: hello again :D
Date: Sun, 8 Jan 2006 05:17:26 +0000
Message-ID: <20060108051726.74a33bc3.amerei@gmail.com>
References: <20060107110622.65f5623a.amerei@gmail.com>
	<4b0d6e0d0601061940v6184e250xdb2c209f308ad969@mail.gmail.com>
	<43BF4AF4.2010104@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <43BF4AF4.2010104@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

woah! lots of stuff to digest there! :D and some new weird instructions too! i've got most parts figured out except this line: "and esp, -8" <- this is supposed to be the alignment thingy you mentioned but i really can't see how this works and why there is a need for one. i always see a line similar to this in gcc -S dumps.

it took me a while to understand what "mov dword [esp + target + 1 - move_me], 42" does, but i think i got it after trying to literally draw my way into how the stack frame looked liked (pen and paper) at that moment. i don't know what 42 means though. i forgot that the stack grew downwards (hi to low mem) and that esp points to the stack's top :(

i tried running the proggie you made but it segfaulted. so for now, i better hit the books again.

tidings
-niel

On Sat, 07 Jan 2006 00:00:36 -0500
Frank Kotler <fbkotler@comcast.net> wrote:

> joy merwin monteiro wrote:
> > Hi,
> > 
> > Yes, you cannot write to code memory, it will be read only.
> > what you could do is write a dummy function, call it and overwrite
> > the return address on the stack, which is in data memory to return to
> > a different place
> > ie, after t1.
> > IIRC, that will be 4(2?) bytes below top of stack in the function,
> > after the frame pointer.
> > 
> > mov (sp - 1), bye;
> > ret ;
> > 
> > might work ?? opinions ???
> 
> It'd work better with esp :) If you had a stack frame (push ebp) the 
> return address would be at [esp + 4], I think. Without  it, right at 
> [esp]. Haven't tried this, but it sounds like it should work.
> 
> I've also heard of copying code onto the stack, and modifying and 
> running it there. Hadn't tried this, but I just gave it a shot, and it 
> seems to work.
> 
> I'm not sure this is good for anything (legitimate).
> 
> Best,
> Frank
> 
> 
> ; self modifying code - on stack
> 
> global _start
> 
> section .text
> _start:
>      nop				; parking place for gdb
> 
> ; we don't need to save/restore esp here, but do it,
> ; as if we were going on to do something :)
>      mov ebp, esp
> 
> ; make some space on stack, align it, and copy some code there
>      sub esp, move_end - move_me
>      and esp, -8
>      mov edi, esp
>      mov esi, move_me
>      mov ecx, move_end - move_me
>      rep movsb
> 
> ; modify code on the stack
>      mov dword [esp + target + 1 - move_me], 42
> 
> ; ... and call it
>      call esp
> 
> ; restore esp
>      mov esp, ebp
> 
> ; exit with ebx set in our modified (?) code
>      mov eax, 1
>      int 80h
> 
> move_me:
>      nop				; fiddle and diddle - just
>      nop				; so our target won't be first
>      nop				; too easy!
> target:
>      mov ebx, 0
>      ret
> move_end:
> 
> ; uncomment for kernels > 2.6.10 !!!
> ;section .data
> ;----------------------------
> 
> 
