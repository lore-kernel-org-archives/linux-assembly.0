From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: stack contents at function call
Date: Mon, 01 Mar 2004 10:42:10 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40430572.1000702@eprocess.fr>
References: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>	<4042F610.9080307@eprocess.fr> <20040301141225.479aa4d5.vadiraj@mail.cyberneme.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040301141225.479aa4d5.vadiraj@mail.cyberneme.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>
Cc: linux-assembly@vger.kernel.org

Vadiraj C S wrote:

>Mr Fred
>
>  
>
>>Convention for C on x86 (I guess you are on this arch) is to pass 
>>arguments to stack. So, if you respect this convention from assembly, 
>>the sequence is the same.
>>
>>    
>>
>   Yes I'm in x86 arch..
>  
>
>>>Cos I noticed difference with gcc(GNU compiler) and icc (Intell compiler)
>>> 
>>>
>>>      
>>>
>>Can you give example? Be more precise...
>>    
>>
>
>
>void Func_call(unsigned long *a, unsigned shor int b, unsigned short int c)
>{
> 
>        asm volatile ("pushl %esi");
>        asm volatile ("pushl %edi");
>        asm volatile ("pushl %ebp");
>        asm volatile ("pushl %ebx");
>
> This below code works different in gcc and in icc
>    {
>        asm volatile ("movl 28(%esp),%esi");   
> 
>        asm volatile ("movw 32(%esp),%dx");
>
>        asm volatile ("movl 36(%esp),%ebx");
>
>    }
>      
>
>  Thought  it should be, 16 bytes for the pushed values, and 4 bytes for return address
>so 24th byte should be the pointer to the first parameter a, GCC points to the perfect 
>with 28th being referrenced to the first parameter. How is this...
>  
>
I agree it seems strange.
But:
- can you give the entire function?
    If you use any temporary data in your function, its memory will be 
reserved on the stack (and then, be inserted before your first "pushl %esi")
- can you create a helloworld.c that contains this function, called in 
the main, and compile it with the '--save-temps' option?
    With gcc-3.x, it will create a helloworld.s file, that is the 
assembly generated file from your helloworld.c
    We will see better what append

>
>
>and icc (intell compiler) it is what we expect it to be. esi is having the b value...
>
>It was strange..
>
> 
>      asm volatile ("movl %esi,%ebp");
>
>	  does ebp store any thing important, cos when  this statement is executed the parameter values get changed
>while tracing from GDB. Please throw some light regarding ebp..
>  
>
The function of ebp is to keep track of the local data on stack.
Generaly, you set ebp to esp when entering the function, and use it to 
reference your local data.
Then, if you push/pop things (affect esp) the data will be always at the 
same place regarding ebp.
for exemple:
    push %ebx
    push %edx
    call foo_function
    ...
foo_function:
    mov %esp,%ebp
        4(%ebp)   => refer to pushed edx
       4(%esp)    => refer to pushed edx
    push   %eax
        4(%ebp)     still refer to the pushed edx
        4(%esp)   doesn't refer to pushed edx anymore

>Thanks for the support Fred
>  
>
You're welcome, I'm at work and have nothing to do for now...
boring! ;)

Fred

>
>  
>


