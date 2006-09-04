From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: argc argv  example included
Date: Sun, 03 Sep 2006 21:30:25 -0400
Message-ID: <44FB81B1.10204@comcast.net>
References: <000701c6cf77$b1f7c220$6ca2e150@gary>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <000701c6cf77$b1f7c220$6ca2e150@gary>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: john david gray <johndgray2003@tiscali.co.uk>
Cc: linux-assembly@vger.kernel.org

john david gray wrote:
> Hi,
> 
> I am doing a bit of assembly - for conversion of a Pascal compiler
> I'm doing {PQC 68000} . I did some work on it in it's original
> Pascal, and have since converted it into C , though it still
> currently produces 68k assembler. I have it running in linux {gcc}.
> I started doing some x86 assembler using nasm , and then swapped
> to as {gas} for its att mode.

No accounting for taste! :)

> There seems to be a problem with argc {or is it just me?}
> where an offset has to be manually adjusted to give the correct
> number {length of args}.

I'm not sure what you're trying to do here. It looks like you're 
expecting there to be a return address on the stack when we start up. 
There is not. "_start" is jumped to, not called...

> I'm using Slackware9.1 with gcc 3.2.3

(strictly speaking, it's your binutils version that's relevant here - we 
don't actually use gcc)

[big snip]
> _start:                 # get argc args
>       push  %ebp

Okay, but our "caller" isn't using it.

>       mov   %esp,%ebp
> 
>       mov   $emsg3,%eax
> #emsg3: .ascii "name abcdefghijklmnopqrstuvwxyz ,count missing\n\0"
>       push  %eax              #
>       call  _ewritestr        #
>       add   $4,%esp           #
>       call  _nl               #and adjust 0xb5c
>                               #
> #     movl  $0xb59,%eax       # qwertyuio
> #     movl  $0xb5c,%eax       # qwertyui
> #     movl  $0xb5e,%eax       # qwertyu
> #     movl  $0xb61,%eax       # args08 rand10
> #     movl  $0xb64,%eax       # kat09
> #     movl  $0xb6a,%eax       # qwe
> #     movl  $0xb6d,%eax       # qw
> #     movl  $0xb70,%eax       # q
>       movl  $0xb5c,%eax       #
>       movl  $0xb5c,%eax       # B73 - (namelen *3)

What in hell are these "magic numbers"???

>       movl  8(%ebp),%ebx      # so where can I get namelength? jdg.

If you're looking for "argc", it's at 4(%ebp). At "_start", argc was the 
first thing on the stack - 0(%esp) - we pushed %ebp, then moved %esp to 
%ebp... so 4(%ebp). What you've got is the address of "argv[0]", the 
program name.

>       andl  $0xfff,%ebx
>       subl  %ebx,%eax
>       cmpl  $1,%eax           #strlen args
>       jl    .strt7   #less
>       push  %eax

... so, whatever this is supposed to be doing, it isn't. :)

>       mov   12(%ebp),%eax     # argstr

Now... if we gave arguments, this is the address of the first of them. 
If not, it's the array-terminating zero (environment strings follow). 
Segfault (at "movb (%esi), %cl")! I think you probably want 8(%ebp) - 
address of program name.

Making those changes, it doesn't segfault if given no arguments. Prints 
its name, and arguments if any... and a bunch more garbage. I didn't 
count 'em, but I'd bet on 255 bytes! :)

Hope that helps.

Best,
Frank


-- 
VGER BF report: U 0.50004
