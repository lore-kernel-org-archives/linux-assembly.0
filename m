From: Philip Jacob Smith <pj@evobsyniva.com>
Subject: Re: confused asm newbie
Date: Thu, 23 Oct 2003 11:50:23 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <oprxh599q8b2epmx@localhost>
References: <Law9-F40TZiqpJjmH4P000039ed@hotmail.com>
Reply-To: pj@evobsyniva.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law9-F40TZiqpJjmH4P000039ed@hotmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Thu, 23 Oct 2003 12:03:44 +0000, Jason Roberts <v3ct0r99@hotmail.com> wrote:

It looks like you're using NASM, so I'll try to help.

> add msg,3   adds 3 to pointer, so msg is now base+3, so  now [msg] should be 'c'

Yeah, except that you can't do that.  msg isn't an actual vairable, but rather it's a constant set at compile time (or more probably at linking time).  If the assembler/linker determines that the msg string is going to be at 0x82214334, then it goes through and writes this into the code, so that the above would be the same as: (if it were possible, that is)

add 0x82214334, 3

Which wouldn't make sense since the value isn't saved anywhere.  To do what you meant, you need to move that constant into a register.

mov eax, msg
add eax, 3

now eax == msg + 3 and [eax] == [msg+3] == 'c'

It's also perfectly valid to just use [msg+3] in instructions, as well as other things like [eax + msg + 3] and such.

> also, when I used edi to store string in _start (line 61)  I mov'ed 'string' without the brackets for some reason the use of brackets is neccessary in the case of
> msg (line 84) ...why so?

For scasb to work, edi needs to be a pointer to the string, since the string isn't going to fit into edi.  The registers only hold numbers.  On line 84, you're moving the string onto the stack, and so you need [msg] which reads the four bytes pointed to by msg into edi, and not just msg which would load the pointer to the bytes into edi.

> also, the stack issue:
> based on my knowledge the stack grows downward but reads upward, i.e. if I push
> edi then I have pushed 4 bytes onto stack-and so sp decrements 4 times and points
> at last item pushed.  Sp only points to top of stack and knows nothing about memory below
> unless we tell it too by explicityly moving it down,which is allocating space basically,
> malloc() for the C gang. Am I getting it?

I think malloc runs off of the brk system call, but I don't know C.  Only ordinary variables in C are allocated on the stack.  If you're using a structure in a pointer to some malloc memory, you're not using the stack.  At least I'm pretty sure that's how it works.

Basically, in Linux (32-bit intel mode), the stack will always push dwords even if you push words or bytes.  After you push a value, ESP points to that value, such that after a 'push eax', [esp] == eax.  The bytes are stored in the same order as if you had done 'mov [esp], eax'.  In fact, a push is the same as 'sub esp, 4' and 'mov [esp], value' except that what ends up on the stack if you push esp seems to change with each processor version, sometimes it's the value before the push, other times it's the value after the push.

> My only concern is this:
> what does edi look like after line 84???
> we have 6 bytes going into a 4-byte register...
> my guess is:
> 6162630a with the CR and NULL being ignored.

Actually, it's 0x0A636261, you have to remember that byte order is reverse reading order.

> If I'm right then what does the stack look like after the push?

Stack: 0x61, 0x62, 0x63, 0x0A, argument list array, dword 0, environment variable array, dword 0, null terminated arguments and environment variables, and that's it I believe except there's probably some alignment bytes tossed in there somewhere.

> From what I see the values in the registers are pushed from the low-byte up to high so
> that 61 is on top of stack, or worded differently, esp holds the address of where 61 is.

Yep, that's right...

> line 17:           jmp chk_edi

Should this have been a call?  I can't figure out how the scan function gets called otherwise.

Anyway, let me paraphrase how to find the length of a null terminated string.  (untested code warning)  Those string instructions are tricky to learn.

	cld
	xor eax, eax
	mov edi, string_pointer
	mov ecx, any_value_sure_to_be_larger_than_the_string
	repnz scasb
	sub edi, string_pointer
	dec edi ; unless you want to count the null byte in the length

That ought to do it, length will be edi.  Zero length strings are fine, as long as the null byte is at the end.  Basically, "repnz scasb" will compare the byte at [edi] to al, and if they're not equal it will loop.  Regardless of wether it continues to loop or not, it'll also increment edi and decrement ecx, and if ecx is zero, it'll stop looping as well.  So, if say the first byte is a letter, and the second is zero, at the end it'll have added 2 to edi.  Then we subtract edi's original value, so we're left with the 2.  Subtract 1 for the zero byte at the end (the one that matched al) and you have 1, the length of the string.  It works with null strings as well, since the first byte matches, edi has 1 added to it, and that 1 is decremented at the end.

I know what you mean about those assembly language books.  They try to teach assembly like it's a language, when it's not (despite the "assembly language" name), and so they actually end up teaching how to use one particular assembler (which is really what you would want to call a language) with one particular operating system, and usually just do a lot of "here's how you do it" stuff and not enough "here's how this works" type stuff.

