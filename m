From: Lorenzo <lollo_c@alice.it>
Subject: Re: Very newbie question...
Date: Sat, 12 Nov 2005 08:34:22 +0100
Message-ID: <43759AFE.8000904@alice.it>
References: <000301c5e715$e7a90370$619f3b80@NMAPod505BTLR>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <000301c5e715$e7a90370$619f3b80@NMAPod505BTLR>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

I have tried to do a program like yours and all is ok.
The "Hello World" work well but i don't want to use this method.
In the same page,

http://asm.sourceforge.net/articles/linasm.html, there is another thing:

" Syscalls whos number of args is greater than five still expect the
syscall number to be in %eax, but the args are arranged in memory and the
pointer to the first arg is stored in %ebx."

I know that "Hello World" is composed of less then five args but i want to know both methods (put all in eax,ebx,ecx,edx,esi,edi registers or put the syscall in eax, push the others and put the pointer to the stack in ebx).
Thx :)



John Rodriguez wrote:

>I am still newbie myself, but one thing that I noticed is that you pass some
>parameters via registers and others via the stack pointer.
>
>The write sys call takes 3 param (as you prob already know), the file
>descriptor (1 = stdout), the pointer to the buffer, and its size.
>
>The write sys call itself is syscall 4.
>
>According to http://asm.sourceforge.net/articles/linasm.html
>"For all syscalls, the syscall number goes in %eax. For syscalls that have
>less than six args, the args go in %ebx,%ecx,%edx,%esi,%edi in order. The
>return value of the syscall is stored in %eax."
>
>Here is my own example that I wrote about a year ago.
>
>section .data
>hello   db  'Hello, World!', 0Ah
>len     equ $-hello
>
>section .text
>global  _start
>_start:
>mov     edx, len
>mov     ecx, hello
>mov     ebx, 1
>mov     eax, 4
>int     80h
>mov     ebx, 0
>mov     eax, 1
>int     80h
>
