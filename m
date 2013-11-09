From: Blake McBride <blake@arahant.com>
Subject: Re: Need help doing a jmp rather than a call
Date: Sat, 9 Nov 2013 08:13:13 -0600
Message-ID: <l5lftf$c89$1@ger.gmane.org>
References: <l5k8kk$9kd$1@ger.gmane.org> <CAN0_x-KsbCkp7EEasjN7UFvKR5itJ65+7RCDK2x9vxr0ji0H0g@mail.gmail.com> <l5kra0$aj2$1@ger.gmane.org> <CAN0_x-KEFpmEKzAsAUKAYhGTP4QbMpBCQvwXCq9Hhit95TnwnA@mail.gmail.com> <CAN0_x-Jt-PJQeNHTbYACafxOHjSJN_3_BAZj5UbLo2dcns27aw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Thanks for the help.  The way I typically do this is to take the C code 
to fun3 (_jumpToMethod), compile it to assembler, modify the assembler, 
and use that.  In 32 bit, I have done the following successfully:

From:
    call *%eax
    leave
    ret

To:
    leave
    leave
    jmp *%eax

Or, more recently, to:

    addl $32, %esp
    jmp *%eax

I spent a few hours on the 64 bit stuff with no success.  I checked on 
the Internet and found that the parameter passing style for x64 is to 
pass the first 6 arguments in registers.  Argumens are passed in order:

arg1:  %rdi
arg2:  %rsi
arg3:  %rdx
arg4: %rcx
arg5: %r8
arg6: %r9

This means you can't simply adjust the stack pointer.  When I ran it 
through a debugger I saw that, in fact, the aruments have shifted the 
registers they use becasue of the additional function layer.

So, it seemed to me that if _jumpToMethod didn't create a stack frame, 
and if it didn't touch anything, it could just do one "leave" and a 
jump.  I tried this:

 From:

.globl __jumpToMethod
__jumpToMethod:
LFB2:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	subq	$16, %rsp
LCFI2:
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movl	$0, %eax
	call	*%rdx
	leave
	ret


To:

.globl __jumpToMethod
__jumpToMethod:
LFB2:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	subq	$16, %rsp
LCFI2:
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdx
	movl	$0, %eax
	leave
	leave
	jmp *%rdx

Doesn't work.  I then figured I would have it not touch anything so 
there is nothing to clean up.  I tried:

.globl __jumpToMethod
__jumpToMethod:
LFB2:
LCFI0:
LCFI1:
LCFI2:
	leave
	jmp	*%rdx

Even worse.

I can't disassemble fun4 becasue fun4 is often a different function 
with vastly different arguments and different return types.  Remember 
in C you can pass around a pointer to a function all you want and 
execute it with different arguments at different times (so long as it 
is typecast and the cast matches the function signature).  C does it 
without knowing the specifics becasue it does know the standard 
agreement between caller and callee.

This has got to be the most trivial piece of code possible.  I am just 
not an assembler programmer, and I already know more about this than I 
want to.

Thanks!

Blake




On 2013-11-09 05:00:14 -0600, Sofiane Akermoun said:

> of course at the fourth line of my preivous mail i would mean "in
> func3 you have to write the function Epilogue" and not prologue
> 
> Sofiane Akermoun
> 
> 2013/11/9 Sofiane Akermoun <akersof@gmail.com>:
>> Yes it is easy.
>> I am just asking because you started it in C, and mixing C and
>> assembly is not really a good idea.
>> But anyway, in  func3 you have to write the function prologue of func3
>> himself and func2 that will delete 2 stack frames, and of course you
>> have to prepare the stack for func4 before jumping into the code
>> location of func4 by passing the argument needed.
>> 
>> 1) Delete Stack frame func3:
>> leave
>> //else use the classical frame erasing (intel syntax)
>> mov esp, ebp
>> pop ebp
>> 
>> 2) Delete stack frame of func2:
>> leave
>> //else use the classical frame erasing (intel syntax)
>> mov esp, ebp
>> pop ebp
>> 
>> Now you have your stack frame exactly as when you called func2.
>> And you have to prepare a manage a new  stack frame usable by func4
>> 
>> 
>> 3)Pass argument of func4 to the stack
>> The best is to disassemble func4 and to check how it get its parameters.
>> As you know function code is compiled and fixed addresses into the
>> stack will be used
>> Usually parameters for functions are pushed or moved into the stack by
>> the caller, and the function get it back from esp or ebp register as a
>> reference + an offset.
>> Actually esp address contains the right return address, and the next
>> upper addresses contains the parameters passed to func2.
>> Unless func4 has the same parameter as func2 and func4 get its
>> parameters as func2 does then you can now jump directly to func4.
>> Else you have to disassemble disassemble func4 and check where to copy
>> the params into this stack frame in the uper addresses above esp.
>> This depends on your compiler options/optimisation/alignement of course.
>> 
>> Sofiane Akermoun
>> 
>> 
>> 
>> 
>> 
>> 
>> 2013/11/9 Blake McBride <blake@arahant.com>:
>>> Thanks for your input.  The system I am refering to (Dynace OO extension to
>>> C) already does what you describe by default.  It has support for an
>>> alternate "assembly language" mechinism that operates faster becasue of the
>>> redused number of contexts to pop and returns to execute.  This mechinism is
>>> a core component of some very large systems that perform this operation tens
>>> to hundreds of thousands of times per second.  So a small gain is a large
>>> gain.
>>> 
>>> Although I used assambly language many years ago, that world keeps changing.
>>> These days my only use of assembly is this one piece of code.  I believe
>>> this is a trivial task for someone who uses it regularly, so I really
>>> appreciate the help.
>>> 
>>> Incidently, in addition to being able to solve this problem in C only,
>>> Dynace implements threads (the kind where multiple C functions can share the
>>> same OS thread), and a mark-and-sweep garbage collector all in C too.  So
>>> there is a lot that can be done without assembler.  (Note, in addition to
>>> the above, Dynace also supports native/true threads and other GCs like the
>>> Boehm-Demers-Weiser collector).
>>> 
>>> Thanks.
>>> 
>>> Blake McBride
>>> 
>>> 
>>> 
>>> 
>>> On 2013-11-09 00:19:34 -0600, Sofiane Akermoun said:
>>> 
>>>> Do you really need assembly to perform this?
>>>> 
>>>> Why func2 doesn't return a pointer on func4 to the caller func1?
>>>> This way func2 do this job, and return to func1 a pointer on a
>>>> function to call func4.
>>>> A very little, simple and naive simple:
>>>> 
>>>> #include <stdio.h>
>>>> 
>>>> void func4(char *str)
>>>> {
>>>> printf("%s", str);
>>>> }
>>>> 
>>>> void (*func2(void))(char *)
>>>> {
>>>> //we can imagine here some work on func2 that will decide what
>>>> function  to return
>>>> return func4;
>>>> }
>>>> 
>>>> void func1(char *str)
>>>> {
>>>> //Here func2 return func4 pointer and
>>>> //it is used ny func1 to call func4 function with "str" argument
>>>> func2()(str);
>>>> }
>>>> 
>>>> int main(int argc, char *argv[])
>>>> {
>>>> func1("Hello world!");
>>>> return 0;
>>>> }
>>>> 
>>>> It is what you need?
>>>> 
>>>> kind regards,
>>>> Sofiane Akermoun
>>>> 
>>>> 2013/11/9 Blake McBride <blake@arahant.com>:
>>>>> 
>>>>> I am trying to get a simple piece of x64 assembly working on 64 bit linux
>>>>> and a Mac.  I am using GCC.
>>>>> 
>>>>> Let's say I have 4 (C language) functions.  Function fun1 calls fun2,
>>>>> fun2
>>>>> calls fun3, and fun3 calls fun4.  I need fun 4 to operate and run as if
>>>>> it
>>>>> was called directly from fun1.  So, fun4 should see the arguments passed
>>>>> to
>>>>> fun2, and when fun4 returns it should return diretly to fun1 as if it was
>>>>> called by fun1.
>>>>> 
>>>>> Basically, this is an OO language that uses fun2 to calculate what fun4
>>>>> is.
>>>>> fun3 is used to manipulate the stack so that when fun4 starts up it
>>>>> thinks
>>>>> it was called directly from fun1.  fin1, fun2, and fun4 are plain C code.
>>>>> fun3 performs the magic.  I have been doing this easily on many different
>>>>> 32
>>>>> bit machines for years but I haven't been able to get it going on 64 bit
>>>>> machines.
>>>>> 
>>>>> 
>>>>> Typically fun3 would:
>>>>> 
>>>>> 1. create a new stack frame
>>>>> 2.  call fun3
>>>>> 3.  pop local call frame
>>>>> 4.  return
>>>>> 
>>>>> What I need fun3 to do is:
>>>>> 
>>>>> 1.  either pop its stack frame or don't create one
>>>>> 2.  pop the stack frame from fun2
>>>>> 3.  jump to fun4
>>>>> 
>>>>> Then fun4 will start executing as if it was called from fun1.  I have
>>>>> sample
>>>>> (errant) C code for the entire process.  It will all work fine if fun3
>>>>> (_jumpToMethod) is rewritten in assembler.
>>>>> 
>>>>> (What I did in the past was compile the C code for _jumpToMethod into
>>>>> assembly code, modify the code, and then use that assembly code.)
>>>>> 
>>>>> Here is the C code for fun1, fun2, and fun3:
>>>>> 
>>>>> #include <stdio.h>
>>>>> 
>>>>> char    *obj = "Some object pointer";
>>>>> 
>>>>> char    *GenObj = "Some Generic Object Pointer";
>>>>> 
>>>>> typedef int     (*ofun)();
>>>>> 
>>>>> 
>>>>> int     Method(char *self, int a, int b, int c)  /*  fun4  */
>>>>> {
>>>>> printf("Method reached with args %s %d %d %d\n", self, a, b, c);
>>>>> return a + b + c;
>>>>> }
>>>>> 
>>>>> ofun    FindMethod(char *obj, char *gen)
>>>>> {
>>>>> return Method;
>>>>> }
>>>>> 
>>>>> GenericFunction(char *self, ...)  /*  fun2  */
>>>>> {
>>>>> _jumpToMethod( FindMethod(self, GenObj) );
>>>>> }
>>>>> 
>>>>> main(void)  /* fun1  */
>>>>> {
>>>>> printf("Method is at %lx\n", (long unsigned int) &Method);
>>>>> /* both calls to Method should look alike to Method  */
>>>>> int     r = Method(obj, 1, 2, 3);
>>>>> printf("Value returned from GenericFunction = %d\n", r);
>>>>> r = GenericFunction(obj, 1, 2, 3);
>>>>> printf("Value returned from GenericFunction = %d\n", r);
>>>>> return 0;
>>>>> }
>>>>> 
>>>>> 
>>>>> -----------------------------------------------------------------
>>>>> 
>>>>> Here is the C code for _jumpToMethod (fun3)
>>>>> 
>>>>> 
>>>>> void    _jumpToMethod(void (*function) (/* ??? */))
>>>>> {
>>>>> 
>>>>> /*      pop_this_stack_frame;   */
>>>>> 
>>>>> /*      pop previous (generics) stack frame  */
>>>>> 
>>>>> (*function)();  /*  must be changed to jump instruction   */
>>>>> }
>>>>> 
>>>>> 
>>>>> 
>>>>> I think this would be easy for someone who knows this assembly language.
>>>>> I
>>>>> have spent about 5 hurs on it and I am lost as I can be.  Your help is
>>>>> greatly appreciated!
>>>>> 
>>>>> Thanks!
>>>>> 
>>>>> Blake McBride
>>>>> 
>>>>> 
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
>>>>> in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>> 
>>>> 
>>>> 
>>>> 
>>>> --
>>>> Sofiane AKERMOUN
>>>> akersof@gmail.com
>>> 
>>> 
>>> 
>>> 
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 
>> 
>> 
>> --
>> Sofiane AKERMOUN
>> akersof@gmail.com
> 
> 
> 
> -- 
> Sofiane AKERMOUN
> akersof@gmail.com



