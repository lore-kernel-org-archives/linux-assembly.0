From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: new asmutils are on the way
Date: Fri, 10 Feb 2006 19:51:36 -0500
Message-ID: <43ED3518.6070206@comcast.net>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <opss5nv9y85khrlj@sucks.airplane.fire> <42CBC727.8060203@linuxassembly.org> <42CC3917.3020105@comcast.net> <42CD8095.8000109@linuxassembly.org> <43E98F15.8090808@linuxassembly.org> <43E9EAB5.2030405@comcast.net> <43EA6F13.3070000@linuxassembly.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <43EA6F13.3070000@linuxassembly.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Konstantin Boldyshev wrote:

...
[line continuation character]
> No, asmutils are not affected. However I guess DOS/Windows people admire 
> this change :-)

:) Well, I know what you mean. But I think Linux programmers might 
appreciate it too, when it comes to...

sys_open myfilename, O_RDRW | O_CREAT | O_TRUNCATE | O_LARGE ...

And X Windows... I think the asm file I possess with the most "\"s in it 
is an X Windows thing. They, too, suffer from "large name for small 
integer" syndrome! :)

...
> There will be just a warning suggesting to switch to the particular nasm 
> version.

That sounds good.

[new kernels]
> Already fixed - now .bss is forced for KERNEL=26 (only when ELF_MACROS 
> are disabled).

Good.

> Actually this started with 2.6.11 kernel. This is a bug, somone just 
> needs to make patch and send it to Linus.

I haven't got his address - you send it to him! :) Seriously, there are 
"channels" for bug reports... First off, what's the desired behavior 
here? Older kernels sent the last section off to be zero-filled, and the 
return from this operation was completely ignored. That isn't very 
sound, and I wouldn't want to argue for a return to it. Perhaps we check 
the flags for the last section, and send it off to be zero-filled only 
if it's intended to be writeable? Or do we need to "remember" the flags, 
make it writeable, zero-fill the end of it, and change the flags back? I 
don't fully understand the purpose of the function that's failing, so I 
don't know how it "should" be fixed. Issuing a better diagnostic than 
SIGSEGV (it was originally SIGKILL, I think) might be some help, but 
AFAIK, those "problem" files *do* fall within the ELF spec...

...
> Well, I am still wondering how -On works... If I get it right - it only 
> produces
> "byte" versions of instructions when possible (and does jump optimization)?

Right. The usage of the "signed byte" form of the instructions that have 
one, when the operand fits, *should* be the default - it is for most 
assemblers - but the original authors, for reasons unknown, made the 
dword (or word) form the default - and documented it so! The only 
program I'm *aware* of that would be bleeped up by changing the defaults 
is Brian's "true.asm"... and *it* would run if it would load, but it won't.

The "-O1" option gives the signed-byte forms where appropriate, but 
doesn't enable the multi-passes needed to do jump displacement 
optimizations. Conditional jumps to "forward" targets are made near, to 
be safe (no "jump out of range" errors). Jumps to targets that have been 
seen are "as needed".

Higher numbers enable that number of "optimization" passes. The original 
code had "-O2" and "-O3" special-cased to 10 and 15 passes (so "-O4" was 
actually less). Somewhere along the line, it was decided that 
special-casing these options was "bad practice" and it was removed. So 
now, you get the number of passes you specify. "-O2" and "-O3" are not 
*nearly* enough. "-O2" (at least) will silently produce bad code!!! The 
workaround to this bug is simply to use a good big number - I use 
"-O999" (when I use "-O" at all) - even bigger wouldn't hurt - it's a 
*maximum* number of extra passes - Nasm stops when it's done. If Nasm 
*can't* resolve all the jump displacements within the number of passes 
you specify, it burps up the "phase error" message. The appearance of 
this message when *any* symbol error occurs is a "bonus"... okay, that's 
a bug, too...

Adding "v" to the parameter - "-O999v" - causes Nasm to report how many 
passes it actually took (not that useful...).

Where asmutils is "hand optimized", it probably isn't much use - 
although you might use it as a "test" to see if Nasm can find anything 
you missed... sometimes finds things *I* miss...

I don't know what lies ahead for the "-O" switch (or when)... maybe 
we'll roll it back to special-case "-O2" and "-O3"... Maybe it should be 
a bit-flag, so you can turn signed-byte and jump displacement on and off 
seperately... No real need that I can see to specify a maximum number of 
passes - if your code doesn't resolve in... however long you're willing 
to wait... just hit control-c. The future's a mystery...

Best,
Frank

