From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: new asmutils are on the way
Date: Mon, 13 Feb 2006 19:40:36 +0300
Message-ID: <43F0B684.9030705@linuxassembly.org>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <opss5nv9y85khrlj@sucks.airplane.fire> <42CBC727.8060203@linuxassembly.org> <42CC3917.3020105@comcast.net> <42CD8095.8000109@linuxassembly.org> <43E98F15.8090808@linuxassembly.org> <43E9EAB5.2030405@comcast.net> <43EA6F13.3070000@linuxassembly.org> <43ED3518.6070206@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <43ED3518.6070206@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Frank Kotler ?????:

>> Actually this started with 2.6.11 kernel. This is a bug, somone just 
>> needs to make patch and send it to Linus.
>
> I haven't got his address - you send it to him! :) Seriously, there 
> are "channels" for bug reports... First off, what's the desired 
> behavior here? Older kernels sent the last section off to be 
> zero-filled, and the return from this operation was completely 
> ignored. That isn't very sound, and I wouldn't want to argue for a 
> return to it. Perhaps we check the flags for the last section, and 
> send it off to be zero-filled only if it's intended to be writeable?

Yes, I think this would be the best solution. AFAIK ELF standard doesn't
force *any* section to be present, and does not force any section order.

But I discovered that ld starting from some version adds empty .bss section
even if was not present in the object file. So, it's also kind of a "fix" :)

> Higher numbers enable that number of "optimization" passes. The 
> original code had "-O2" and "-O3" special-cased to 10 and 15 passes 
> (so "-O4" was actually less). Somewhere along the line, it was decided 
> that special-casing these options was "bad practice" and it was 
> removed. So now, you get the number of passes you specify. "-O2" and 
> "-O3" are not *nearly* enough. "-O2" (at least) will silently produce 
> bad code!!! The workaround to this bug is simply to use a good big 
> number - I use "-O999" (when I use "-O" at all) - even bigger wouldn't 
> hurt - it's a *maximum* number of extra passes - Nasm stops when it's 
> done. If Nasm *can't* resolve all the jump displacements within the 
> number of passes you specify, it burps up the "phase error" message. 
> The appearance of this message when *any* symbol error occurs is a 
> "bonus"... okay, that's a bug, too...
>
> Adding "v" to the parameter - "-O999v" - causes Nasm to report how 
> many passes it actually took (not that useful...).

Thanks, this clarifies a lot of things.
During tests, all asmutils code was assembled in 4-5 passes :-)

>
> Where asmutils is "hand optimized", it probably isn't much use - 
> although you might use it as a "test" to see if Nasm can find anything 
> you missed... sometimes finds things *I* miss... 

Well, of course I would like to get rid of that "optimization macros",
since a macro can just can't handle all cases correctly.

As for jump displacements, I think it's a good idea to turn them on and 
off separately,
for instance add another switch for them with number of passes (-Jn ?). 
Just an idea.

--
Regards,
Konstantin.


