From: Lope De Vega <lope.vega@yahoo.com>
Subject: Re: how to return a pointer to pointer
Date: Mon, 8 Oct 2007 09:36:26 -0700 (PDT)
Message-ID: <770091.72921.qm@web45514.mail.sp1.yahoo.com>
References: <1191689132.5718.11.camel@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1191689132.5718.11.camel@ubuntu>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Plantz <plantz@sonoma.edu>
Cc: linux-assembly@vger.kernel.org


--- Robert Plantz <plantz@sonoma.edu> wrote:

> >From "System V Application Binary Interface"
> 
>      Integral and pointer return values appear in
> %eax. A function that
>      returns a struct or union value places the
> address of the result
>      in %eax. Otherwise this is a scratch register.
> 
> Pointers to anything, even other pointers, are
> returned in eax.
> 
> Of course, the object it points to must not be in
> the stack frame, which
> as you point out, is deleted when the function
> returns. (I'm using
> "object" in the general sense here, not as in
> "object-oriented
> programming.")
> 
> I try to design my code such that the function that
> creates and object
> is the only one that can delete it. That is, I try
> not to write a
> function that allocates memory, then returns a
> pointer to it. I allocate
> the memory in the calling function, then pass a
> pointer to this memory
> area to the function that will do something to the
> memory.
> 
> Perhaps if you can provide more details about what
> you need to do we can
> give more advice.
> 
> Bob
> 

Hello, thanks.

Well, what I'm doing is a keyword-tree, where the
function I mentioned intern keys on it, and the reason
to return a pointer to a pointer is that I can  then
use it for either intern and lookup-on-intern at the
same time (so keys doesn't get overwritten): if it
returns null, then key hasn't been interned, if it
doesn't return null but the nested pointer is null,
key exists, but no data has been attached (or was
removed from it), if both pointers come non-null this
key exists and is currently bound to something.

How I finally did was:

pushl $0
pushl key
pushl keyword-tree
call function
addl $8, %esp

Then I use the %esp slot where I pushed 0 from within
the function I call to return the value, which as you
said mentioned, needs to be copied to eax as well, so
after the bit above I did this:

cmpl $0, %eax  /* key doesn't exist */
jz   somewhere

cmpl $0, (%eax)  /* non-zero means this key is already
bound */
jz   somewhere_else

/* if we get here, key exists but but hasn't got any
data attached to it */

somewhere_else:
/* and if we get to here, key is bound already, but
still can do whatever we think appropiate, if any at
all */

addl  $4, %esp /* so as to discard returned value,
which I didn't do in the last addl because %eax points
to it */

So that's what I've been up to, perhaps I'm in the
wrong approach, but it's the better I could think of.
Any comments are welcome anyway.

Thanks.




       
____________________________________________________________________________________
Moody friends. Drama queens. Your life? Nope! - their life, your story. Play Sims Stories at Yahoo! Games.
http://sims.yahoo.com/  

