From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: stack contents at function call
Date: Fri, 05 Mar 2004 10:00:09 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <40484199.5040401@eprocess.fr>
References: <20040301131824.02c597f0.vadiraj@mail.cyberneme.com>	<4042F610.9080307@eprocess.fr>	<20040301141225.479aa4d5.vadiraj@mail.cyberneme.com>	<40430572.1000702@eprocess.fr>	<40482BB8.5040201@eprocess.fr> <20040305135011.3ac14610.vadiraj@mail.cyberneme.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040305135011.3ac14610.vadiraj@mail.cyberneme.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>, linux-assembly@vger.kernel.org

Vadiraj C S wrote:

>  the displace which is given above is specific to gcc and in windows it would 
>be something else, I dint get time to research on this much but the difference is
>that, I had to change it 24, 28 and 32 to make it work on icc. 
>
> And yes this asm code is call from an insline asm itself the sequence of code before 
>the call is this
>
>  asm volatile ("push %ebx") //which is the last parameter to Func_call
>  asm volatile ("push %edx") // which is the middle one b
>  asm volatile ("push %esi") // which is the address of a
>  asm volatile ("call Func_call") ;
>
>
> I'm sorry for the delay in response, I would appreciate if you can put some information
>on this at your free time..
>
>
>  
>
Hum, if you send your code parts to parts, it is a bit difficult to see 
what you are doing...
If I understand the (very few) parts you gave, the 4 bytes added by gcc 
to stack are the 'Func_call'.
You can check it be compiling with -save-temps and see the assembly 
generated code.

If you really want me to confirm, please, create a simple hello-world 
that reproduce this behaviour, compil it with -save-temps option, and 
send me both the .c and the .s files.
Then, I think I would have enough data to tell you exactly what appens 
(and how change it if you want the same code to work the same in windows 
and linux)

Fred
(PS: and please, keep reply to the community, as your problem and its 
solution may be usefull for somebody in the futur. Thanks)




Vadiraj C S wrote:

> Mr Fred,
>
>
>  
>
>>Hi,
>>Did you find the problem?
>>I would appreciate feed-backs, as I don't see what may differ from intel 
>>and gcc...
>>    
>>
>
>   Yes there is difference in the displacement from the ebp at call values 
>in gcc and intel.
>
>
>  
>
>>If you find the explanation, it would be nice to share it!
>>And if you didn't find, just send me the generated assembly (see at the 
>>end of my last reply) I may be in some help...
>>
>>    
>>
>
>
>void Func_call(unsigned long *a, unsigned shor int b, unsigned short 
>  
>
>>>>int c)
>>>>{
>>>>
>>>>       asm volatile ("pushl %esi");
>>>>       asm volatile ("pushl %edi");
>>>>       asm volatile ("pushl %ebp");
>>>>       asm volatile ("pushl %ebx");
>>>>
>>>>This below code works different in gcc and in icc
>>>>   {
>>>>       asm volatile ("movl 28(%esp),%esi");  
>>>>       asm volatile ("movw 32(%esp),%dx");
>>>>
>>>>       asm volatile ("movl 36(%esp),%ebx");
>>>>
>>>>   }
>>>>
>>>>        
>>>>
>
>
>  the displace which is given above is specific to gcc and in windows it would 
>be something else, I dint get time to research on this much but the difference is
>that, I had to change it 24, 28 and 32 to make it work on icc. 
>
> And yes this asm code is call from an insline asm itself the sequence of code before 
>the call is this
>
>  asm volatile ("push %ebx") //which is the last parameter to Func_call
>  asm volatile ("push %edx") // which is the middle one b
>  asm volatile ("push %esi") // which is the address of a
>  asm volatile ("call Func_call") ;
>
>
> I'm sorry for the delay in response, I would appreciate if you can put some information
>on this at your free time..
>
>
>  
>


