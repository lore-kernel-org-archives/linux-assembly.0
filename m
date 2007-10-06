From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: how to return a pointer to pointer
Date: Sat, 06 Oct 2007 09:45:32 -0700
Message-ID: <1191689132.5718.11.camel@ubuntu>
References: <414158.21344.qm@web45509.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <414158.21344.qm@web45509.mail.sp1.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lope De Vega <lope.vega@yahoo.com>
Cc: linux-assembly@vger.kernel.org

From "System V Application Binary Interface"

     Integral and pointer return values appear in %eax. A function that
     returns a struct or union value places the address of the result
     in %eax. Otherwise this is a scratch register.

Pointers to anything, even other pointers, are returned in eax.

Of course, the object it points to must not be in the stack frame, which
as you point out, is deleted when the function returns. (I'm using
"object" in the general sense here, not as in "object-oriented
programming.")

I try to design my code such that the function that creates and object
is the only one that can delete it. That is, I try not to write a
function that allocates memory, then returns a pointer to it. I allocate
the memory in the calling function, then pass a pointer to this memory
area to the function that will do something to the memory.

Perhaps if you can provide more details about what you need to do we can
give more advice.

Bob

On Sat, 2007-10-06 at 04:28 -0700, Lope De Vega wrote:
> Hi list!
> 
> I'm wondering how do you guys use to do when you need
> to return a pointer to a pointer from within a
> function?
> 
> if I use local storage it get's swept out during
> function's return.
> 
> I've though on pushing $0 onto the stack after or
> before such a function's arguments, so I could either
> store on it during this function's execution and then
> moving it to eax at it's end so it will be visible
> 
> Any hints or comments?
> 
> Thanks.
> 
> 
> 
> 
>        
> ____________________________________________________________________________________
> Be a better Globetrotter. Get better travel answers from someone who knows. Yahoo! Answers - Check it out.
> http://answers.yahoo.com/dir/?link=list&sid=396545469
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

