From: "Randall Hyde" <aoax86@earthlink.net>
Subject: Re: Nasm v/s Gas
Date: Tue, 3 Dec 2002 22:07:30 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <001c01c29b5b$6dc2fe20$6801a8c0@rhyde>
References: <A8FBDFE1-0748-11D7-91BF-003065A88832@sonoma.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Plantz <plantz@SONOMA.EDU>
Cc: linux-assembly@vger.kernel.org


----- Original Message ----- 
From: "Robert Plantz" <plantz@SONOMA.EDU>
To: "Randall Hyde" <aoax86@earthlink.net>
Sent: Tuesday, December 03, 2002 9:24 PM
Subject: Re: Nasm v/s Gas


> Randy,
> 
> Thank you for your very thoughtful comments. I have consulted your
> online book often and appreciate your expertise in this area.
> 
> I really should take the time to learn NASM
> so I can make a better informed decision. (We have a 12 unit
> teaching load every semester (no TAs), so it's a struggle just
> to keep up.)
> 
> One thing to note is my parenthetical comment:
> 
> >> (The whole point of our class is to teach
> >>     what is going on at the asm level when programming in C/C++.)
> 
> which I should have placed at the beginning.
> 
> We decided many years ago that it was not important for our
> students to learn assembly language programming. Our course
> was renamed "Computer Organization: Software". We really do
> try to show approximately what the compiler is generating.
> We are trying to demystify the machine operations going on
> behind C. Within this context, the course serves as sort of
> an introduction to computer architecture.

Well, that makes sense, then.  A machine organization course
could easily get by with Gas since the purpose of teaching assembly
in such a course is not to teach students how to write programs in
assembly code, but to teaching them how to write HLL code that
generates decent assembly.

> 
> It's also important to note that I am at a CSU campus, not
> a UC. Our courses are probably not quite as ambitious.

Actually, when I taught at CSU (Cal Poly Pomona), we actually
got *farther* along in assembly than at UC.  The reason was simple:
the students took a "digital electronics" course prior to the assembly
course.  It wasn't really an electronics course (though they did wire
up a few simple projects).  It really was a machine organization
course where the students learned about numbering systems, digital
logic, and a ton of other things that wind up consuming half the term
in an assembly course without such a prerequisite.  It was great because
I could get much farther in the assembly course.  At UCR, the
"Machine Organization and Assembly Language Programming" course
spent about 3-4 weeks covering all that prerequisite material prior to
getting into the actual assembly programming.  With just six or seven
weeks to teach assembly, you can't get very far, which is why I've always
worked at figuring out how to make the process more efficient.


> I fully understand that many people (including some of my
> best friends  :-) ) do not agree with this philosophy.

Actually, if you'd just said that it was a Computer Organization course,
I probably would have agreed with the approach right from the start.
Indeed, I'm currently working on a new book that attempts to teach
Machine Organization using HLLs as much as possible (and the last chapter,
which I'm currently working on, covers HLL->machine code translation by
a compiler).  Although it's obvious that a programmer who knows assembly
language really well makes a good HLL programmer, I've never been convinced
that you have to become an accomplished assembly programmer in order to
write good HLL code.  I believe that by studying machine organization really
well, it's quite possible to write the same quality HLL code that someone who
know assembly would be capable of writing.  We'll see if this text I'm working
on takes people a little bit closer to that goal.
Randy Hyde


