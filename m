From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: how to return a pointer to pointer
Date: Mon, 08 Oct 2007 16:38:57 -0700
Message-ID: <1191886737.5693.22.camel@ubuntu>
References: <770091.72921.qm@web45514.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <770091.72921.qm@web45514.mail.sp1.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lope De Vega <lope.vega@yahoo.com>
Cc: linux-assembly@vger.kernel.org


On Mon, 2007-10-08 at 09:36 -0700, Lope De Vega wrote:
> Hello, thanks.
> 
> Well, what I'm doing is a keyword-tree, where the
> function I mentioned intern keys on it, and the reason
> to return a pointer to a pointer is that I can  then
> use it for either intern and lookup-on-intern at the
> same time (so keys doesn't get overwritten): if it
> returns null, then key hasn't been interned, if it
> doesn't return null but the nested pointer is null,
> key exists, but no data has been attached (or was
> removed from it), if both pointers come non-null this
> key exists and is currently bound to something.
> 
> How I finally did was:
> 
> pushl $0
> pushl key
> pushl keyword-tree
> call function
> addl $8, %esp
> 
> Then I use the %esp slot where I pushed 0 from within
> the function I call to return the value, which as you
> said mentioned, needs to be copied to eax as well, so
> after the bit above I did this:
> 
> cmpl $0, %eax  /* key doesn't exist */
> jz   somewhere
> 
> cmpl $0, (%eax)  /* non-zero means this key is already
> bound */
> jz   somewhere_else
> 
> /* if we get here, key exists but but hasn't got any
> data attached to it */
> 
> somewhere_else:
> /* and if we get to here, key is bound already, but
> still can do whatever we think appropiate, if any at
> all */
> 
> addl  $4, %esp /* so as to discard returned value,
> which I didn't do in the last addl because %eax points
> to it */
> 
> So that's what I've been up to, perhaps I'm in the
> wrong approach, but it's the better I could think of.
> Any comments are welcome anyway.
> 
> Thanks.
> 

It's still not completely clear to me. I'm not sure what you
mean by "intern."

If I understand your code correctly, I would write something
like

I think the real question is if you wish to write assembly
language functions that obey C rules so that they can
be called by a C function. The function you wrote does
not follow C rules.

    pushl $flag
    pushl key
    pushl keyword-tree
    call function
    addl $12, %esp
    cmpl $0, %eax  /* key doesn't exist */
    jz someplace
    movl flag, %eax  /* get flag value */
    cmpl $0, %eax   /* any data attached? */
    jz somewhere_else /* no */
          /* if we get here, key is bound and has data attached. */

somewhere_else:
         /* if we get here, key is bound but has no data attached. */


Further general notes:
(I am writing this for a 32-bit x86 platform. Other architectures
follow different rules, even the 64-bit x86.)

In C there are two ways to get inputs into a function:
1. Pass by value; a copy of the data is pushed onto the stack.
2. Pass by address; the address where the data is located is
   pushed onto the stack. This is typically used when the data
   object is large. For example, an array is usually large. Passing
   an array by address is so common, the C syntax does not
   even require you to use the "address-of" operator (&).

There are two ways to get ouputs from a function:
1. The return value, which is in the eax register.
2. Pass by address; the address where the data is to be stored is
   pushed onto the stack.

One approach you could take is to write your function in C. Then
compile it with gcc using the -S option. (Notice that this is upper-
case S.) This will produce the assembly language file, foo.s from
the C file, foo.c. (Be careful that you do not use the same name
as the assembly language file you have already written. This
process would write over that file. I suggest doing this exercise in
a "temp" directory.) Then you can see how the compiler "writes"
assembly language. From there, you can write your own (better)
assembly language function.


