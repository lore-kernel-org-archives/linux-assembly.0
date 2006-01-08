From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: hello again :D
Date: Sat, 07 Jan 2006 20:41:07 -0500
Message-ID: <43C06DB3.1070000@comcast.net>
References: <20060107110622.65f5623a.amerei@gmail.com>	<4b0d6e0d0601061940v6184e250xdb2c209f308ad969@mail.gmail.com>	<43BF4AF4.2010104@comcast.net> <20060108051726.74a33bc3.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060108051726.74a33bc3.amerei@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Niel A <amerei@gmail.com>
Cc: linux-assembly@vger.kernel.org

Niel A wrote:
> woah! lots of stuff to digest there! :D

And lots more where it came from. Fortunately, learnin' stuff is fun - 
'cause we've got a whole pile of fun ahead of us!

> and some new weird instructions too!
 > i've got most parts figured out except this line:
 > "and esp, -8" <- this is supposed to be the alignment
 > thingy you mentioned but i really can't see how
 > this works and why there is a need for one.
 > i always see a line similar to this in gcc -S dumps.

Well... it was kind of inspired by gcc dumps. Gcc has some strange ideas 
about how much to subtract from the stack for a given amount of local 
variables declared - experiment with it if you want to be amused and 
mystified. The basic idea is that we want to keep the stack aligned at 
least on a dword boundary, for reasons of speed. Some of the sse? 
instructions (I haven't learned the "exotic" instructions) require qword 
(64-bit) alignment - there are versions that will work on unaligned 
data, but they're slower. So to be "ready" for that, 8 byte alignment is 
good. We subtract 9 bytes for the code, so alignment after will be 
beneficial.

As for how it works, if you imagine that "-8" (or 0FFFFFFF8h) in binary, 
all the upper bits are set, and the lowest three are clear. A bitwise 
"and" of this with esp clears the three lowest bits, and leaves the 
upper bits just as they were - effectively truncating esp to the next 
lowest 8-byte boundary.

I wrote this to test the effect - less than I would have expected, 
actually, but you can see the difference. Presumably, the stack was 
"nicely" aligned when we found it. We deliberately misalign it by some 
amount defined on Nasm's command line.

; brain-dead demo of the effect of stack (mis)alignment
;
; assemble with "nasm -f elf myprog.asm -DDELTA=?"  0, 1, 2,...
; ld -s -o myprog myprog.o
; run as "time myprog"


global _start

section .text
_start:

     mov ecx, 10000000h
     sub esp, byte DELTA
top:
     push eax
     call dummy
     pop eax

     loop top

     mov eax, 1
     int 80h

dummy:
     ret
;---------------

> it took me a while to understand what
 > "mov dword [esp + target + 1 - move_me], 42"
 > does, but i think i got it after trying to
 > literally draw my way into how the stack
 > frame looked liked (pen and paper) at that moment.

Excellent idea! It isn't too easy to grasp, and you *do* want to have a 
good idea of "what's where" on the stack!

> i don't know what 42 means though.

"42" is "the answer" to "life, the universe, and everything. Joke from 
Douglas Adams' "Hitch-hiker's Guide to the Galaxy". (no one knows what 
the "question" was). When you do "echo $?", it chirps "42". Okay, I'm 
easily amused! :)

> i forgot that the stack grew downwards
 > (hi to low mem) and that esp points to
 > the stack's top :(

Yup. The "stack top" is at the "bottom", if you look at it that way. 
"Just like a stack of plates", they say. Okay... if I envision an 
"anti-gravity plate-stacker" that stacks plates from the ceiling down, I 
can almost get it. Well, we diagram "trees" with the "root" at the top, 
too :)

> i tried running the proggie you made but it segfaulted.

Oh, oh! What kernel? If a newer kernel (since 2.6.10, I think), did you 
uncomment the "section .data"? You might need to put a dummy byte in the 
(writeable!) data section. Newer kernels *require* a writeable section, 
and require it to be last. Gas users never encounter a problem with this 
- gas gives you a .data section whether you ask for it or not(!). Nasm 
(and Fasm) users get what we ask for... so we better remember to ask for 
it! (I keep forgetting it - that code that copies code to the stack 
should have a "cld" in it, too. Another one I keep forgetting!) Add a 
".data" section (Nasm knows that name, and will make it writeable and 
put it last) in the example above, too!

> so for now, i better hit the books again.

Well, if you're going to do it *that* way, yeah. :)

Best,
Frank

