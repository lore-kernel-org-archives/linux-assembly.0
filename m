From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: new asmutils are on the way
Date: Wed, 08 Feb 2006 07:57:25 -0500
Message-ID: <43E9EAB5.2030405@comcast.net>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <opss5nv9y85khrlj@sucks.airplane.fire> <42CBC727.8060203@linuxassembly.org> <42CC3917.3020105@comcast.net> <42CD8095.8000109@linuxassembly.org> <43E98F15.8090808@linuxassembly.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <43E98F15.8090808@linuxassembly.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Konstantin Boldyshev <konst@linuxassembly.org>
Cc: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Konstantin Boldyshev wrote:
> Hello everyone!

Hi Konstantin!

Big thanks to you and your helpers for asmutils!

> Now that everybody thinks they are dead, here they are... :)

"They" say a lot of stuff is dead! :) Such as Nasm development (we're 
just in low gear!) You know it isn't true - we screwed up some of your 
code! Intel decided "pause" was a good name for an instruction, so Nasm 
added it. "truss.asm" uses (used) "pause" as an identifier... so that's 
broken - along with everybody else who used "pause". Blame Intel for 
that one!

The other thing we did, which breaks existing code, is the addition of 
'\' as a line-continuation character (0.98.25?). Any comment that ends 
with '\' causes the following line to be treated as a comment, too, 
introducing amusing and hard-to-find bugs. This is (they tell me) how 
the C equivalent works, and is "intended behavior". Sorry 'bout that. I 
don't recall if this is an issue with asmutils (I think not).

> asmutils are switching to the latest nasm (0.98.39 afaik) and will (try to)
> use its features, so that version will be required to compile the project.

About the only new "feature" in 0.98.39 is the removal of the 
(exploitable) buffer overruns. Perhaps this should be "required", but as 
a general rule, it would be nice if asmutils would build with "any 
version" (any "reasonable" version...). What new features are you 
actually counting on? I see the "cpu" directive (0.98.8, IIRC)... the 
"-g" switch (this was silently ignored prior to 0.98.37, our "first 
draft" of synbolic debug info - it was *royally* screwed up! You got 
debug info even without the "-g" switch, and it segfaulted at the drop 
of a hat. 0.98.37 was not a suitable version for *any* elf output!

> If there are any contributions, please send them asap (I hope
> to release new version during next weekend), but first check
> http://linuxassembly.org/asmutils/ChangeLog

I don't see any reference in the ChangeLog to "truss.asm" being fixed, 
but the CVS tree shows underscores being added (the day *after* 0.17 was 
released?). That'll fix the "pause" problem.

I've got a couple odds and ends that might be added to os_linux.inc - 
framebuffer stuff related to "VBLANK". It doesn't work on my machine - I 
don't think it's "supposed" to (matrox only?) - so it's untested. Want 
it anyway?

As you know, kernels <2.6.10 (or so) barf if they don't have a writeable 
section last. This affects asmutils that don't have a "UDATASEG". 
Perhaps add one, whether we need it or not, if KERNEL>??? ? Gas gives us 
a .data section, whether we asked for one or not... (towards the end of 
elf.inc, I guess?)

It's the *loader* that segfaults, not our program, when this happens. So 
we can claim it's a "kernel bug" and "not our problem" - but it'd be 
better to fix it. (IMO)

Anything else? That's all I can think of. I'm still a newbie to Linux, 
but I'm getting to know Nasm fairly well, and I'd be delighted to 
discuss any "version-related" problems you encounter. Thanks again for 
asmutils - even if it *were* dead, it'd be a tremendous help!

Best,
Frank

P.S. Here's what I've got. Untested - for "peer review". Can change 'em 
to "%assign", and maybe get a "diff" against 0.17 out of it, if you want...

; struct fb_vblank
struc fb_vblank
   .flags           resd 1    ; FB_VBLANK flags
   .count           resd 1    ; counter of retraces since boot
   .vcount          resd 1    ; current scanline position
   .hcount          resd 1    ; current scandot position
   .reserved        resd 4    ; reserved for future compatibility
endstruc    ; 32 bytes

%define FB_VBLANK_VBLANKING 0x001   ; currently in a vertical blank
%define FB_VBLANK_HBLANKING 0x002   ; currently in a horizontal blank
%define FB_VBLANK_HAVE_VBLANK 0x004 ; vertical blanks can be detected
%define FB_VBLANK_HAVE_HBLANK 0x008 ; horizontal blanks can be detected
%define FB_VBLANK_HAVE_COUNT 0x010  ; global retrace counter is available
%define FB_VBLANK_HAVE_VCOUNT 0x020 ; the vcount field is valid
%define FB_VBLANK_HAVE_HCOUNT 0x040 ; the hcount field is valid
%define FB_VBLANK_VSYNCING 0x080    ; currently in a vsync
%define FB_VBLANK_HAVE_VSYNC 0x100  ; vertical syncs can be detected

