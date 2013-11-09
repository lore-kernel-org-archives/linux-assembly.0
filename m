From: Blake McBride <blake@arahant.com>
Subject: Need help doing a jmp rather than a call
Date: Fri, 8 Nov 2013 21:02:54 -0600
Message-ID: <l5k8kk$9kd$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

I am trying to get a simple piece of x64 assembly working on 64 bit 
linux and a Mac.  I am using GCC.

Let's say I have 4 (C language) functions.  Function fun1 calls fun2, 
fun2 calls fun3, and fun3 calls fun4.  I need fun 4 to operate and run 
as if it was called directly from fun1.  So, fun4 should see the 
arguments passed to fun2, and when fun4 returns it should return 
diretly to fun1 as if it was called by fun1.

Basically, this is an OO language that uses fun2 to calculate what fun4 
is.  fun3 is used to manipulate the stack so that when fun4 starts up 
it thinks it was called directly from fun1.  fin1, fun2, and fun4 are 
plain C code.  fun3 performs the magic.  I have been doing this easily 
on many different 32 bit machines for years but I haven't been able to 
get it going on 64 bit machines.


Typically fun3 would:

    1. create a new stack frame
    2.  call fun3
    3.  pop local call frame
    4.  return

What I need fun3 to do is:

    1.  either pop its stack frame or don't create one
    2.  pop the stack frame from fun2
    3.  jump to fun4

Then fun4 will start executing as if it was called from fun1.  I have 
sample (errant) C code for the entire process.  It will all work fine 
if fun3 (_jumpToMethod) is rewritten in assembler.

(What I did in the past was compile the C code for _jumpToMethod into 
assembly code, modify the code, and then use that assembly code.)

Here is the C code for fun1, fun2, and fun3:

#include <stdio.h>

char	*obj = "Some object pointer";

char	*GenObj = "Some Generic Object Pointer";

typedef	int	(*ofun)();


int	Method(char *self, int a, int b, int c)  /*  fun4  */
{
	printf("Method reached with args %s %d %d %d\n", self, a, b, c);
	return a + b + c;
}

ofun	FindMethod(char *obj, char *gen)
{
	return Method;
}

GenericFunction(char *self, ...)  /*  fun2  */
{
	_jumpToMethod( FindMethod(self, GenObj) );
}

main(void)  /* fun1  */
{
	printf("Method is at %lx\n", (long unsigned int) &Method);
	/* both calls to Method should look alike to Method  */
	int	r = Method(obj, 1, 2, 3);
	printf("Value returned from GenericFunction = %d\n", r);
	r = GenericFunction(obj, 1, 2, 3);
	printf("Value returned from GenericFunction = %d\n", r);
	return 0;
}


-----------------------------------------------------------------

Here is the C code for _jumpToMethod (fun3)


void	_jumpToMethod(void (*function) (/* ??? */))
{

/* 	pop_this_stack_frame;	*/

/* 	pop previous (generics) stack frame  */

 	(*function)();	/*  must be changed to jump instruction   */
 }



I think this would be easy for someone who knows this assembly 
language.  I have spent about 5 hurs on it and I am lost as I can be.  
Your help is greatly appreciated!

Thanks!

Blake McBride


