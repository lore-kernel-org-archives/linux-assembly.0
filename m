From: h-peter recktenwald <hp@lxhp.in-berlin.de>
Subject: Re: stack allocation for array
Date: Tue, 3 Dec 2002 19:05:06 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200212031913.gB3JD3QG028563@hirsch.in-berlin.de>
References: <OF1EA583A0.C585230F-ON65256C84.0013393E@lntinfotech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <OF1EA583A0.C585230F-ON65256C84.0013393E@lntinfotech.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sameer.Seth@lntinfotech.com, linux-assembly@vger.kernel.org

On Tuesday 03 December 2002 03:41, Sameer.Seth@lntinfotech.com wrote:

your question does not relate to assembly, it's a compiler issue.
gcc 'optimization' w. "-O3" might result to less unreasonable code 
("-O2" won't). you can receive a synchronuos asm listing from the 
real, compiled code w. AS listing switches, passed by "-Wa,...." in 
the CFLAGS variable - re AS docs.

best,
	hp

> hi,
>     could somebody help me out with this confusion. i wrote a C program and
> had an assembly output for that program by giving gcc -S option. the C
> program is something like this:
>
> int main()
> {
>         int  fd[3];
>         int pid = 0;
>         return 0;
> }
>
>
> +++++++++++++++=+++++++++++++++++++++++=++++++++++++++++++++++++++++++=++++
>+++++++++++++++++++++++++=+++++++++++++++++++++++== the .s file created is
> like this:
>         .file   "test_1.c"
>         .version        "01.01"
> gcc2_compiled.:
> .text
>         .align 4
> .globl main
>         .type    main,@function
> main:
>         pushl   %ebp
>         movl    %esp, %ebp
>         subl    $40,
> %esp-----------------------------------------------------> (why has the
> compiler allocated this much space for the
>                                           two local variables which would
> combinely would have taken 12 bytes)
>         movl    $0, -28(%ebp)
>         movl    $0, %eax
>         leave
>         ret
> .Lfe1:
>         .size    main,.Lfe1-main
>         .ident  "GCC: (GNU) 2.96 20000731 (Red Hat Linux 7.1 2.96-81)"
> ++++++++++++++++++=++++++++++++++++++++++++++++++++++++=+++++++++++++++++++
>+++++++++++++++++++++++++++++++++=+++++++++++++++++++
>
> please somebody let me know why has it done so. is it to keep some debug
> information and where can i get toread such protocols followed by compiler.
>
> regards
> sameer
>
>
>
>
>
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
