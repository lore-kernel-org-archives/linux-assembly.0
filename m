From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: problem with printchar
Date: Wed, 24 Apr 2002 09:27:16 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <aa5mop$d8c$2@main.gmane.org>
References: <web-5620564@m1.plasa.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-5620564@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ssams <ssams@telkom.net>
Cc: linux-assembly@vger.kernel.org


Yes...
Because in ecx should be address (pointer) to char.
Kernel silently ignores bad address so there is no output.
You can use strace utility to watch whats going on

$strace ./program1

execve("./program1", ["./program1"], [/* 30 vars */]) = 0
write(1, ptrace: un: Input/output error
0x61, 1)                       = -1 EFAULT (Bad 
addreexit(0)                                = ?

uh... the solution: you have to declare somewhere in memory a byte where 
you will store that char.

This is not "as" syntax but hope you will get an idea

mov ecx,my_char
mov [ecx],'a' ;you can cachnge it "on-line"

.....

DATASEG
my_char DB 'b' 

Happy assembling,
    
      Regards

		Rudolf


On Wed, 24 Apr 2002, ssams wrote:

> Date: Wed, 24 Apr 2002 14:18:57 +0700
> From: ssams <ssams@telkom.net>
> To: linux-assembly@vger.kernel.org
> Subject: problem with printchar
> 
> i have this code
> .globl mulai
> mulai:
>    movl $4,%eax
>    movl $1,%ebx
>    movl $'a',%ecx
>    movl $1,%edx
>    int   $0x80
>    xorl  %eax,%eax
>    movl  $1,%eax
>    xorl  %ebx,%ebx
>    int   $0x80
> then i compile with
> as program1.s -o program1.o
> ld program1.o -o program1
> 
> by this code i want print one char but there is no output.
> can anybody help me why..?
> 
>  
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 


