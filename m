From: Frank Kotler <fbkotler@comcast.net>
Subject: new behavior with kernels 2.6.10+
Date: Sun, 03 Jul 2005 10:15:50 -0400
Message-ID: <42C7F316.9040205@comcast.net>
References: <070320050307.12502.42C75678000A24E5000030D62205884484C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <070320050307.12502.42C75678000A24E5000030D62205884484C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: TheReader06@comcast.net, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

TheReader06@comcast.net wrote:
> Actually, yes (to the small programs not working).  A while ago (a month or so?) I tried running hello world, failed.. (that's no good)..  tried cat and a few other larger programs, worked fine..
> 
> weird.
> 
> Joshua

Hi Joshua,

I assume you intended to reply to the list ("reply all"), not just to me 
("reply") so I'll reply to the list...

What seems to have happened is that they've started checking return 
values from some routines called from the loader, which were previously 
ignored.

<http://www.uwsg.iu.edu/hypermail/linux/kernel/0410.3/0202.html>

(the most current code I've looked at, 2.6.12, actually sends SIGSEGV, 
not SIGKILL as is shown here)

Daniel wonders if they still segfault if they're recompiled on the new 
kernel... I'm less sure of that. The only kernel 2.6.11 I've actually 
got running is from "Blueflops", a two-floppy distro. It's a little too 
minimalistic to have much of a development environment :) I *have* got 
Fasm running on it, but not Nasm or (G)as - or ld! So my testing of 
anything "compiled" on 2.6.11 is limited to Fasm's "elfexe" output 
format (direct to executable - no linker involved... Fasm is the linker, 
if you look at it that way). Mostly I've been assembling with Nasm and 
linking with ld under 2.4.26, copying to "/blueflops/...", booting to 
the 2.6.11 kernel, and testing. PITA!

But I think I can see what's happening. You've gotta have a writeable 
section last. Exactly what that means depends on the tools we use. 
Suppose we do:

.globl _start

.text
_start:
movl $1, %eax
movl $42, %ebx
int $0x80

Doesn't appear to have a writeable section at all. But "objdump -h" says:

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .text         0000000c  00000000  00000000  00000034  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   1 .data         00000000  00000000  00000000  00000040  2**2
                   CONTENTS, ALLOC, LOAD, DATA
   2 .bss          00000000  00000000  00000000  00000040  2**2
                   ALLOC

Gas has added a ".data" section (writeable). And this works okay on 2.6.11.

OTOH, the "same code" in Nasm...

global _start

section .text

_start:
mov eax, 1
mov ebx, 42
int 80h

Results in:

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .text         0000000c  00000000  00000000  00000130  2**4
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   1 .comment      0000001f  00000000  00000000  00000140  2**0
                   CONTENTS, READONLY

Nasm *doesn't* add a ".data" section you didn't ask for... and, sure 
enough, it segfaults on 2.6.11. (Nasm *does* add that comment you didn't 
ask for...)

That's the simplest I can get it. Slightly more complicated, if you use 
the "trick" of putting constant data in the ".text" section to make the 
executable smaller, it'll segfault. If you put constant data in 
".rodata" instead of ".data" (and don't have a ".data" or ".bss" 
section), it'll segfault.

The "elfexe" example that ships with Fasm:

---------------
; fasm demonstration of writing simple ELF executable

format ELF executable
entry start

section readable writeable

msg db 'Hello world!',0xA
msg_size = $-msg

section readable executable

start:

	mov	eax,4
	mov	ebx,1
	mov	ecx,msg
	mov	edx,msg_size
	int	0x80

	mov	eax,1
	xor	ebx,ebx
	int	0x80
---------------

Segfaults. Moving the (writeable) data section to after the code section 
fixes it, as does marking the code section writeable.

Using Nasm, and ld, it appears that if our code section is named 
".text", ld moves it to first position - and makes it "READONLY", even 
if we marked it "write". If we "make up" a name for our code section, 
and mark it "write exec ...", ld seems to leave it alone...

I assume that'll work the same for Fasm...

Just some new things we need to watch out for. We needed that! :)

Best,
Frank

