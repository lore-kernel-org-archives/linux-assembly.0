From: Blake McBride <blake@arahant.com>
Subject: Re: Need help doing a jmp rather than a call
Date: Sat, 9 Nov 2013 16:47:14 -0600
Message-ID: <l5me18$o1e$1@ger.gmane.org>
References: <l5k8kk$9kd$1@ger.gmane.org> <CAN0_x-KsbCkp7EEasjN7UFvKR5itJ65+7RCDK2x9vxr0ji0H0g@mail.gmail.com> <l5kra0$aj2$1@ger.gmane.org> <CAN0_x-KEFpmEKzAsAUKAYhGTP4QbMpBCQvwXCq9Hhit95TnwnA@mail.gmail.com> <CAN0_x-Jt-PJQeNHTbYACafxOHjSJN_3_BAZj5UbLo2dcns27aw@mail.gmail.com> <l5lftf$c89$1@ger.gmane.org> <20131109144246.GD5152@jeffraw> <l5lnau$mpa$1@ger.gmane.org> <20131109213023.GE5152@jeffraw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

On 2013-11-09 15:30:23 -0600, Rob said:

> On Nov 09, 2013, Blake McBride wrote:
>> 
>> I corrected your small %rdx typo above and tried the following.  It
>> doesn't work either though.  Knowing what I know now though, you
>> must be close.
>> 
>> .globl __jumpToMethod
>> __jumpToMethod:
>> LFB2:
>> 	pushq	%rbp
>> LCFI0:
>> 	movq	%rsp, %rbp
>> LCFI1:
>> 	movl	$0, %eax
>> //	call	*%rdi
>> //	leave
>> //	ret
>> 	// any free register that's not preserved across calls
>> 	movq %rdi, %r10
>> 
>> 	// forward call registers
>> 	movq %rsi, %rdi
>> 	movq %rdx, %rsi
>> 	movq %rcx, %rdx
>> 	movq %r8, %rcx
>> 	movq %r9, %r8
>> 
>> 	// return address is at (%rsp), so we can just jump
>> 	jmp *%r10
> 
> One thing to note, although I don't think it's the issue, is that the
> x86_64 ABI requires that %eax holds the number of sse registers (usually
> floating point arguments) for variadic or unspecified-argument functions
> [1] - I didn't touch eax in my code and you probably want to leave it
> alone in yours too.

I agree with what you said.  That code came from the compiler though.

> 
> You want to get rid of the first three instructions in your code - the
> push and mov especially, as you don't want to alter the stack at all.
> If you need to do operations, you want to save the stack and restore it
> before forwarding on, for example:
> 
> .globl __jumpToMethod
> __jumpToMethod:
> 	// save frame
> 	pushq	%rbp
> 	movq %rsp, %rbp
> 
> 	// save eax for variadic functions, etc
> 	pushq %rax
> 
> 	/* figure out what function to forward to - let's pretend the address
> 	 * ends up in %rax */
> 	...
> 
> 
> 	// get the function pointer into r10
> 	movq %rax, %r10
> 
> 	// restore original rax and rbp
> 	popq %rax
> 	popq %rbp
> 
> 	// then the code I posted earlier
>  	movq %rsi, %rdi
>  	movq %rdx, %rsi
>  	// etc etc...
>  	jmp *%r10

I must not calculate the method in this function.

> 
> 
> 
> This is sort of going the way of C++ virtual method calls, and it might
> be simpler on your side if you change how your objects work. For
> example, instead of
> 
> void forward(char *object, int arg1, int arg2, ...)
> {
> 	lookup_method(object)(arg1, arg2);
> }
> 
> You could do:
> 
> struct cool_object
> {
> 	void (*method1)(struct cool_object *, int, int);
> 	void (*method2)(struct cool_object *, char *);
> 	void (*method3)(struct cool_object *, long);
> };
> 
> Then you can say:
> 
> obj->method1(obj, 2, 3);
> obj->method2(obj, "hello");
> 
> 
> This is both faster and more typesafe, at the cost of your objects being
> more heavy-weight in memory. To get around this (and carrying on the
> theme of C++ virtual methods) you can use a vtable.
> 
> 
> struct cool_object_vtable
> {
> 	void (*method1)(struct cool_object *, int, int);
> 	void (*method2)(struct cool_object *, char *);
> 	void (*method3)(struct cool_object *, long);
> };
> 
> struct cool_object
> {
> 	struct cool_object_vtable *vtable;
> };
> 
> obj->vtable->method1(obj, 2, 7);

I do some stuff like this but I can't do exactly what C++ does.  Unlike 
C++, my system is run-time dynamic and has a full metaobject protocol.  
You can't do this in vanilla C++.

Also, my system has been in production use for over 15 years.  I really 
don't want to re-architect it.  I just want to port that one piece of 
assembly.

Thanks for going back and forth with me on this.  I appreciate your time.

Blake



> 
> 
> Now your objects only need a single pointer, at the cost of one level of
> indirection.
> 
> 
> 
> HTH again!
> Rob
> 
> 
> [1]: e.g.
> 	int f(int a, ...);
> 	int g();
> will have %eax set, whereas:
> 	int f(int a, int b);
> 	int g(void);
> will not.



