From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: stack contents at function call
Date: Mon, 01 Mar 2004 09:36:32 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <4042F610.9080307@eprocess.fr>
References: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>
Cc: linux-assembly@vger.kernel.org

Hi,
Vadiraj C S wrote:

>  Hello Assembly Gurus
>
>   I'm working on Assembly programming under linux from few days, here are some issues
>
> 1.When a function call is made the parameters are pushed on to the stack and a a call
>to the function is made. 
>  
>
right in most systems compilators (x86 works that way, for example)

> Now the top of the stack is the return address, Please correct me if I'm wrong here,
>and the parameters above it is the first parameter sent and so on..
>
> 1. Is this OS dependent, or compiler dependent? 
>
It depends... ;)
Sure, it is NOT OS dependent. On Linux, for exemple, this may work 
different from hardware to an other.
For exemple, on x86, as there is not a lot of registers, all is passed 
on a single stack.
But on other architectures, wich have more registers, functions 
parameters are splitted in registers (integers and float registers) and 
in stack when there are no register free.
Now, if you want a program to interact with others, you may respect 
calling conventions.
Since it is most likely to occurs (programs call each others), you may 
guess compilers works the same way on a arch/OS.

> 2. Does this sequence change when call from C language and call from assembly.
>  
>
In Assembly, you can use what method you want to pass parameters. Look 
at interrupts, for exemple. They only use registers as parameters. So, 
you may create functions that only need registers as inputs, and other 
functions that need stack copying. It's up to your choice. But if you 
want to interract with other programs, you must respect the arch/OS 
convention.
Convention for C on x86 (I guess you are on this arch) is to pass 
arguments to stack. So, if you respect this convention from assembly, 
the sequence is the same.

But for C++ compilers, its a bit different (object's methods need a 
pointer to the instance, 'this').

You must also take care of alignement in stack.
C/C++ may align 32bits data. And most likely for 64bits data (long long, 
double).

>Cos I noticed difference with gcc(GNU compiler) and icc (Intell compiler)
>  
>
Can you give example? Be more precise...

>
> Help is needed urgent, 
>  
>
I'm ready to answer quickly today (french time)

Fred

>Thanks in advance...
>
>
>
>  
>


