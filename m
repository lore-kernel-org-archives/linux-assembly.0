From: Konstantin Boldyshev <konst@linuxassembly.org>
Subject: Re: new asmutils are on the way
Date: Thu, 09 Feb 2006 01:22:11 +0300
Message-ID: <43EA6F13.3070000@linuxassembly.org>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <opss5nv9y85khrlj@sucks.airplane.fire> <42CBC727.8060203@linuxassembly.org> <42CC3917.3020105@comcast.net> <42CD8095.8000109@linuxassembly.org> <43E98F15.8090808@linuxassembly.org> <43E9EAB5.2030405@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <43E9EAB5.2030405@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Frank Kotler ?????:

> "They" say a lot of stuff is dead! :) Such as Nasm development (we're 
> just in low gear!) You know it isn't true - we screwed up some of your 
> code! 

As they say - "If you break a thing, it indicates that you use it!"

> The other thing we did, which breaks existing code, is the addition of 
> '\' as a line-continuation character (0.98.25?). Any comment that ends 
> with '\' causes the following line to be treated as a comment, too, 
> introducing amusing and hard-to-find bugs. This is (they tell me) how 
> the C equivalent works, and is "intended behavior". Sorry 'bout that. 
> I don't recall if this is an issue with asmutils (I think not). 

No, asmutils are not affected. However I guess DOS/Windows people admire 
this change :-)

> About the only new "feature" in 0.98.39 is the removal of the 
> (exploitable) buffer overruns. Perhaps this should be "required", but 
> as a general rule, it would be nice if asmutils would build with "any 
> version" (any "reasonable" version...). What new features are you 
> actually counting on? I see the "cpu" directive (0.98.8, IIRC)... the 
> "-g" switch (this was silently ignored prior to 0.98.37, our "first 
> draft" of synbolic debug info - it was *royally* screwed up! You got 
> debug info even without the "-g" switch, and it segfaulted at the drop 
> of a hat. 0.98.37 was not a suitable version for *any* elf output! 

They will build with any reasonable nasm (even 0.90 I guess) - as CPU 
directive can be disabled manually.
There will be just a warning suggesting to switch to the particular nasm 
version.

> I've got a couple odds and ends that might be added to os_linux.inc - 
> framebuffer stuff related to "VBLANK". It doesn't work on my machine - 
> I don't think it's "supposed" to (matrox only?) - so it's untested. 
> Want it anyway? 

Okay, I'll add it.

> As you know, kernels <2.6.10 (or so) barf if they don't have a 
> writeable section last. This affects asmutils that don't have a 
> "UDATASEG". Perhaps add one, whether we need it or not, if KERNEL>??? 
> ? Gas gives us a .data section, whether we asked for one or not... 
> (towards the end of elf.inc, I guess?) 

Already fixed - now .bss is forced for KERNEL=26 (only when ELF_MACROS 
are disabled).
Actually this started with 2.6.11 kernel. This is a bug, somone just 
needs to make patch and send it to Linus.

> Anything else? That's all I can think of. I'm still a newbie to Linux, 
> but I'm getting to know Nasm fairly well, and I'd be delighted to 
> discuss any "version-related" problems you encounter. Thanks again for 
> asmutils - even if it *were* dead, it'd be a tremendous help! 

Well, I am still wondering how -On works... If I get it right - it only 
produces
"byte" versions of instructions when possible (and does jump optimization)?

--
Regards,
Konstantin.


