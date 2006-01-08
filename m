From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: hello again :D
Date: Sun, 08 Jan 2006 11:19:56 -0500
Message-ID: <43C13BAC.6020504@comcast.net>
References: <20060107110622.65f5623a.amerei@gmail.com>	<4b0d6e0d0601061940v6184e250xdb2c209f308ad969@mail.gmail.com>	<43BF4AF4.2010104@comcast.net>	<20060108051726.74a33bc3.amerei@gmail.com>	<43C06DB3.1070000@comcast.net> <20060108132150.0c5ea4b4.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060108132150.0c5ea4b4.amerei@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Niel A <amerei@gmail.com>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Niel A wrote:
> wow! thanks! i think i understand it now a little! actually, i re-read your email a couple of times, then resorted to whipping up something in c before finally seeing some light.
> 
> -----------------------------------------
> 	sub esp, move_end - move_me
> 	and esp, -8
> -----------------------------------------
> 
> you allocated space on the stack

By subtracting something from esp.

> but fall back on the next lowest 8 byte boundary. but that would mean that the stack is now a little short on space for the size of the function that you wanna copy on it right?

No, that gives us a little extra!
                                          (low 8 bits)
Suppose the stack starts at   0xBFFFF780 ...10000000
subtract 9 bytes for our code 0xBFFFF777 ...01110111
                            (and -8)      ...11111000
                                          ------------
and esp, -8 (0xFFFFFFF8)      0xBFFFF770 ...01110000

So we've got a full 16 bytes "reserved".

> is this ok?  i'm so sorry. *gomen*. still a bit blurry. perhaps i'm just thinking about it so much.

I've been known to confuse myself by thinking too much about the fact 
that the stack "grows down". I can get to thinking that my whole memory 
is "upside down". It isn't, of course, the stack uses pefectly ordinary 
memory. The stack *pointer*, esp, moves "downward" (smaller value) when 
we add something to the stack with a push or call. This is called the 
"top" of stack... Previous values on the stack remain at the same 
address (of course), but with respect to esp, they're at a bigger 
*negative* offset as we add more to the stack.

How do we diagram/envision memory? With high numbers at the top, I 
suppose, and zero at the bottom. This way, the stack "grows down", but 
the "top of stack" is at the bottom. Another natural way would be 0, 1, 
2, 3 with zero at the top. This is the way our source code reads... 
instructions at the top go into lower memory, and as we read "down" 
instructions are going into higher addresses. In this orientation, "top 
of stack" is at the top, but the stack grows "upward"... as it works 
into lower addresses. No wonder we're confused!

I'm not sure that helps... or otherwise. Observing C output may help. 
Stepping through your code in a debugger might be better. I like ald 
(available at SourceForge) better than gdb. Actually, I use an older 
version of ald - reminds me more of DEBUG (how's *that* for faint 
praise? :) For debugging, use the "-g" switch for Nasm, and *don't* use 
the "-s" switch to ld. It helps a *lot* if you start off with a "nop" 
(right after "_start:") - gives gdb someplace to set a breakpoint, so 
you can step through your code from the beginning. Seems to matter less 
with ald.

Hang in there!

Best,
Frank

