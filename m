From: Jani Monoses <jani@iv.ro>
Subject: Re: booting a new kernel from an already running kernel
Date: Tue, 3 Sep 2002 18:00:18 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020903180018.16f8b110.jani@iv.ro>
References: <3D74C936.5070907@eprocess.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D74C936.5070907@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fmarmond@eprocess.fr
Cc: linux-assembly@vger.kernel.org

look at the end of that __asm__ statement.
Some of the values after the semicolons are substituted for %0,%1,etc
So it is not pure assembly and some parts are filled in by gcc.
the order of the instructions you write is not guarranteed to be preserved
either.
info as or a look at www.linuxassembly.org should clarify this to you :)


> hi dear all...
> 
> I try to boot a kernel from an already running kernel.
> I use 'monte' 
> (http://www.scyld.com/products/beowulf/software/monte.html), which was 
> designed for 2.2 kernels.
> After adapting it to 2.4 (...), it do something...
> of course, it is not what i wanted.
> Some questions for ATT syntax guru:
> 
> a bit of C source code
>   __asm__ __volatile__
>       (/* Grab the args for our memcpy off the stack now while we still
>     * have page tables. */
>        "    movl %0, %%ebx           \n" /* Arg storage: memlist -> EBX */
>        "    movl %1, %%edx           \n" /* Arg storage: entry   -> EDX */
>        "    movl %2, %%ebp           \n" /* Arg storage: flags   -> EBP */
> 
>        /* Turn off paging, leave protected mode turned on. */
>        "    movl %%cr0, %%eax        \n" /* Turn off paging (bit 31 in 
> CR0) */
>        "    andl $0x7FFFFFFF, %%eax  \n"
>        "    movl %%eax, %%cr0        \n"
>        "    xorl %%eax, %%eax        \n" /* Flush the TLB (write 0 to 
> CR3) */
>        "    movl %%eax, %%cr3        \n"
> 
> what I have in dessasemble (ldasm) for this function:
> 
> :00000763 8b5d08                 mov  ebx, ptr [ebp+8]
> :00000766 8b550c                 mov  edx, ptr [ebp]
> :00000769 8b6d10                 mov  ebp, ptr [ebp+10]
> :0000076c 0f20c0                 mov  eax, cr0
> :0000076f 25ffffff7f             and  eax, 7fffffff
> :00000774 0f22c0                 mov  cr0, eax
> :00000777 31c0                   xor  eax, eax
> :00000779 0f22d8                 mov  cr3, eax
> 
> My main question is:
> what "movl %0,%%ebx" is supposed to do?
> reading at ebp+8 ('local variables' + 8)?
> Why %0, %1 and %2 are not compiled in the good order (like ebp+0x8, 
> ebp+0xc, and ebp+0x10 ?)
> 
> 
> if any idea/known about the general problem (booting a kernel from a 
> running system, like $re-run bzImage-foo.bar).
> 
> thanks for futur answers.
> 
> Fred
> 
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
