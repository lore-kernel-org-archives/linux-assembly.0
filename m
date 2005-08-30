From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: Using C Libraries From Assembly
Date: Tue, 30 Aug 2005 10:23:17 -0400
Message-ID: <op.swbrk3zbnro9m0@sucks.airplane.fire>
References: <4314324D.10853.4AFFDB1@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4314324D.10853.4AFFDB1@localhost>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Stephen Pelc <stephen@mpeltd.demon.co.uk>
Cc: linux-assembly@vger.kernel.org

> The next task is to set up signal handlers from assembly.

That's not too difficult.  From your guide, it looks like you've got it  
mostly figured out already.

   %idefine sys_signal 48
   %idefine SIG_SEGV 11

   mov eax, sys_signal
   mov ebx, SIG_SEGV
   mov ecx, signal_handler
   int 0x80

   signal_handler
     printf "We crashed!!!\n";
   ret

Well, actually, you wouldn't want to return with SIG_SEGV, but...as long  
as you don't re-register the handler, I imagine returning would terminate  
your program.

One thing you have to keep in mind that I didn't see in your guide is that  
you have to re-register the signal hander every time the signal gets  
called.  Also, if your program recieves a signal that it doesn't have a  
handler set up for it will be terminated "kill -9" style.

The real trick is figuring out the register contents at the time of the  
crash.

   pushfd; pop dword [r.flags]; cld
   mov eax, [esp + 13 * 4]; mov [r.eax], eax
   mov eax, [esp + 10 * 4]; mov [r.ebx], eax
   mov eax, [esp + 12 * 4]; mov [r.ecx], eax
   mov eax, [esp + 11 * 4]; mov [r.edx], eax
   mov eax, [esp +  7 * 4]; mov [r.esi], eax
   mov eax, [esp +  6 * 4]; mov [r.edi], eax
   mov eax, [esp +  8 * 4]; mov [r.ebp], eax
   mov eax, [esp +  9 * 4]; mov [r.esp], eax
   mov eax, [esp + 16 * 4]; mov [r.eip], eax

Since I'm using pushfd, I guess I didn't find the flags saved anywhere.

Took me a while to figure that out.  There's another set of registers on  
the stack in front of that set, but they aren't the right ones, and where  
they come from, I have no idea.  I also have no idea if that works on any  
kernel other than my own.

I'll have to have a look at that third argument to the signal handler some  
time, if it points to where I'm getting the registers from now, then I'll  
go ahead and use it.
