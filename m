From: Vadiraj C S <vadiraj@mail.cyberneme.com>
Subject: Re: stack contents at function call
Date: Mon, 1 Mar 2004 14:12:25 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040301141225.479aa4d5.vadiraj@mail.cyberneme.com>
References: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>
	<4042F610.9080307@eprocess.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4042F610.9080307@eprocess.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fmarmond@eprocess.fr
Cc: linux-assembly@vger.kernel.org


Mr Fred

> Convention for C on x86 (I guess you are on this arch) is to pass 
> arguments to stack. So, if you respect this convention from assembly, 
> the sequence is the same.
> 
   Yes I'm in x86 arch..
> 
> >Cos I noticed difference with gcc(GNU compiler) and icc (Intell compiler)
> >  
> >
> Can you give example? Be more precise...


void Func_call(unsigned long *a, unsigned shor int b, unsigned short int c)
{
 
        asm volatile ("pushl %esi");
        asm volatile ("pushl %edi");
        asm volatile ("pushl %ebp");
        asm volatile ("pushl %ebx");

 This below code works different in gcc and in icc
    {
        asm volatile ("movl 28(%esp),%esi");   
 
        asm volatile ("movw 32(%esp),%dx");

        asm volatile ("movl 36(%esp),%ebx");

    }
      

  Thought  it should be, 16 bytes for the pushed values, and 4 bytes for return address
so 24th byte should be the pointer to the first parameter a, GCC points to the perfect 
with 28th being referrenced to the first parameter. How is this...



and icc (intell compiler) it is what we expect it to be. esi is having the b value...

It was strange..

 
      asm volatile ("movl %esi,%ebp");

	  does ebp store any thing important, cos when  this statement is executed the parameter values get changed
while tracing from GDB. Please throw some light regarding ebp..

Thanks for the support Fred


-- 

		With knowledge comes power, and with power comes responsability.

 Regards
 Vadiraj C S


