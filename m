From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: Unable to access memory address.
Date: Fri, 25 Mar 2005 04:46:01 -0500
Message-ID: <4243DDD9.98DE04A5@comcast.net>
References: <Pine.LNX.4.21.0503242354490.1652-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

"J." wrote:
> 
> Thursday, March 24 23:54:49
> 
> Hello,
> 
> I am totally new to asm and have a question.

Hehe! More than one, I'll bet! :)

> I trying the following
> nasm program from the document http://www.leto.net/writing/nasm.txt .

Nice tutorial. I like it. But reading over it again, I
notice that Jonathan doesn't mention the linking stage.
After assembling with "nasm -f elf myprog.asm", you've got
"myprog.o". This needs to be linked to an executable with
(for programs like Jonathan shows) "ld -o myprog myprog.o".
Now "myprog" should be an executable we can run...

> section .text
>  global main
> 
> main:

As TheReader06 observes, you've changed Jonathan's "_start:"
label to "main:". What's the difference? Well, ld knows
"_start" as the default entrypoint - where your code starts
executing. In asm, "main" isn't anything special, but it
*is* special to C, of course. In a C program, the "_start"
entrypoint occurs in the "startup code" - which does some
stuff and then calls "main". The "_start" label is jumped
to, not called. What's the difference? The stack is in a
different condition when your code begins. Jonathan's tut
assumes the entrypoint is in our code - it won't work if
we've been called by C startup code!

Having changed "_start" to "main", if you link with "ld -o
myprog myprog.o", I would expect ld to complain about not
being able to find the entrypoint - but it'll produce an
executable... which may segfault. You could link with "ld -o
myprog myprog.o --entry main" - I would expect that to work.
Or, you could link with "gcc -o myprog myprog.o". Since
there's no .c file to compile, gcc just calls ld - but with
a command line that links with the "startup code"... which
calls "main". So far, so good, but the code Jonathan shows
will pop the return address off the stack, instead of the
expected "argc", etc. Hilarity ensues.

>  pop     ebx
>  dec     ebx
>  pop     ebp

So far, so good... we've popped the argument count,
decremented it to skip over "argv[0]" - the program name,
and popped the (pointer to a zero-terminated string) program
name.

>  pop     ebp

If the victim... "user", I mean... started the program
without any command-line arguments, we really wouldn't want
to pop this (it would be zero, and attempting to do anything
with it would be an error!). We should have checked to see
if the "dec ebx" resulted in zero ("jz we_done"). If so, we
don't want to try to pop any more arguments!

As TheReader06 also observes, you need an "exit" of some
kind (HLLs provide this for you automatically). The CPU
doesn't know to "stop", and just keeps fetching instructions
and trying to execute them. This is likely to result in an
error of some kind in short order... but it *could* do real
damage first, so we like to avoid it!

mov ebx, ???
mov eax, 1 ; __NR_sys_exit
int 80h

What goes in ebx is the "exit code" returned to the OS.
Traditionally, zero indicates "no error". Since we aren't
going to do anything about an error, if one occurs, we might
as well return zero. If a sys_call fails, the error-code is
returned in eax (as a negative number) so we might want to
return that - "mov ebx, eax" instead of zero. You *can*
return anything you please, but zero is probably best. So
the above code isn't really suitable for a "runnable"
executable, as it's given.

> When I try to execute it this is what happends.
> ~: ./program 12 7
> Illegal instruction

I've never seen that exact error-message, but for one or
another of the reasons above, it's not too surprising.

> Some searches on the Internet the only clou's turned up are type of `howto
> bufferoverflow' ... Hmmzz.. :( 

Hope it was howto avoid 'em, not howto exploit 'em! The
"professionals" produce plenty of software with buffer
overflows. *We* want to try to avoid 'em!!!


> So I decided to use GDB.

There are a couple things you should do, if using gdb, and
(at least) one thing you shouldn't do. You should be using a
recent version of Nasm - at least 0.98.38 (debugging info
for ELF output was introduced in 0.98.37, but it's *badly*
broken! Earlier versions silently ignore the "-g" switch),
preferably 0.98.39 (earlier versions include those infamous
buffer overflows!). You should add the "-g" switch to the
Nasm command line. You should start your code with a "nop" -
right after the "_start:" label.

You shouldn't add the "-s" switch to the ld command-line. I
didn't show that above, but it results in a much smaller
executable - it removes some symbol information that isn't
strictly necessary, *including* the debug info (if any) that
you want for gdb. This will make gdb much happier!

> The debugger says:
> Cannot access memory at address 0x6d6f682f

I don't know just where in your code this is happening, but
it's a sure sign the program has gotten "twisted" - probably
for one or another of the reasons above, and is trying to do
something we don't intend.

> What am I doing wrong and how do I make sure that I use the right memory
> addresses ?

You shouldn't need to worry about "numeric" memory
addresses. If you either swap back to "_start" or tell ld
"--entry start", and add a proper "exit", you should be
okay. I personally think it's "potentially misleading" to
use "main" if it isn't a "C-style main" - but perhaps you've
got your reasons to do it. It's perfectly legitimate to
write your "main" in asm and link it with C startup code,
too, but you need to follow different rules, and access the
command line parameters in a different way. If that's what
you want to do, let us know.

Popping "argc" etc. off the stack works okay, but once
they're popped they're no longer available for "future
reference", unless you save 'em. Here's a slightly different
way to access the command-line parameters - and it goes on
to show environment strings (which are on the stack above
the args, separated by a NULL pointer) - which leaves them
in place. This'll scroll off the screen, so you probably
want to run it as "./cmdline 12 7 | less". There's lots of
room for improvement, but this "worksforme".

Best,
Frank

;-----------------------------------
; fetches command-line parameters off stack
; and displays them
;
; nasm -f elf cmdline.asm [-g]
; ld -o cmdline cmdline.o [-s] (but not both)
;------------------------------

global _start   ; default entry point used by ld

section .data
    msg1 db 'The program "',0
    msg2 db '" was invoked with parameters:',0Ah,0
    newline db 0Ah,0

section .text

_start:

    nop                ; parking place for gdb
    mov ebx, esp
    mov ecx, [ebx]     ; count of command-line parameters

    mov esi, msg1      ; "program"
    call putz

    add ebx, byte 4
    mov esi, [ebx]     ; first one is program name
    call putz

    mov esi, msg2      ; "parameters"
    call putz

get_clparam:        ; fetch parameters and display
    dec ecx
    jz get_env         ; 'til done
    add ebx, 4
    mov esi, [ebx]
    call putz
    mov esi, newline
    call putz
    jmp get_clparam

get_env:
    mov esi, newline
    call putz
    call putz
    add ebx, 4
more_env:
    add ebx, 4
    mov esi, [ebx]
    or esi, esi
    jz exit
    call putz
    mov esi, newline
    call putz
    jmp short more_env

exit:

    mov eax, 1      ; system call number (sys_exit)
    xor ebx, ebx    ; return value
    int 80h         ; call kernel
;-------------------------------------------

;-------------------------------------------
; expects - esi poined to zero-terminated string
; returns - nothing
;--------------------------------------------
putz:
        push eax
	push ebx
	push ecx
	push edx

	mov eax, 4	; system call number (sys_write)
	mov ebx, 1	; file descriptor (stdout)
	mov ecx, esi	; message to write
	mov edx, esi
getlen:
	test byte[edx], 0FFh
	jz gotlen
	inc edx
	jmp getlen
gotlen:
        sub edx, esi     ; length to write
        int 80h          ; call kernel

	pop edx
	pop ecx
	pop ebx
	pop eax

        ret
;------------------------------------------------
