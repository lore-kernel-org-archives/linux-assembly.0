From: Tavis Ormandy <taviso@sdf.lonestar.org>
Subject: Re: Question about GCC and stack
Date: Mon, 12 Sep 2005 19:09:26 +0100
Message-ID: <587AEB894BD33797BF0431A1@[10.0.0.1]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>, linux-assembly@vger.kernel.org

--On Sunday, September 11, 2005 23:50:43 -0700 James Colannino
<james@colannino.org> wrote:
> I understand that GCC, at least under Linux, has an unusual way of
> entering into a function (which, as I understand, is why it doesn't use
> the enter instruction.)

Actually, I believe the enter instruction is avoided as it's considerably
slower than manually opening the frame, there's no reason you cant
substitute the enter instruction into this fragment if you wanted to.

> Is it copying the address of the top of the stack ebp?  Why?

Yes, consider that as you manipulate the stack, accessing arguments and
local variables stored there can get complicated as you normally access
them  as offset to the sp, for example, sp+4, sp-16, etc.

Obviously some object at sp+4 will be at sp+8 if you push some value onto
the stack, as the stack pointer will have moved. In a complex function this
could become unmanageable (at least to a human programmer, gcc can handle
this in order to gain an extra free register, but at some sacrifice).

The function prologue backs up the %ebp from the caller, then copies the sp
onto it. Now stack variables and arguments are at fixed offsets from the
%ebp throughout, no matter what stack manipulation you perform.

If you try manipulating arguments/stack variables in the function and take
a look at the code generated, you will see how the frame pointer is used to
address them, eg movl -8(%ebp), %foo (for comparison, try compiling the
code with -fomit-frame-pointer).

> I then see
> that the instruction "subl $8, esp" subtracts 8 from the top of the
> stack's address.  I'm not sure however why this is done.
> I have no idea what the andl instruction is for other than it ANDs
> the bits (I'm very fuzzy on my understanding of bits.)  I know it's
> used to mask bits out, but again, I'm not sure why this would need
> to be done here.

This looks like gcc attempting to keep the stack aligned for performance
reasons. Check the gcc documentation for the -mpreferred-stack-boundary
option, which explains this behaviour.

>  The last
> two instructions before "leave" looks like they return a default integer
> value of 0, which I'd expect GCC to do.

Right, by convention the return value (if it fits) is placed into the %eax
register when the function returns to the caller, that's what it's doing.

The subl instruction is pointless, I dont know why it's inserted. It could
be just generic stub code that gcc always inserts for allocating stack
variables, but as in this case you dont use any, it allocates $0
bytes...I'm sure someone will correct me if there's a good reason for it :)

leave simply closes the stack frame, restoring the stack pointer (by
copying %ebp to %esp), then restoring the %ebp from the backup it made to
the stack when entering the function.

> I hope these questions aren't too stupid or uneducated.  I'm just
> beginning and have a lot to learn.  If you don't mind endulging a curious
> mind's questions I'd be very grateful :)  Thanks very much in advance.
> James


Hope this helps, 

Tavis.

-------------------------------------
taviso@sdf.lonestar.org | finger me for my gpg key.
-------------------------------------------------------

  
