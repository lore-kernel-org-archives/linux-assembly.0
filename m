From: "Randall Hyde" <aoax86@earthlink.net>
Subject: Re: Nasm v/s Gas
Date: Tue, 3 Dec 2002 19:35:29 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <005501c29b46$319639e0$6801a8c0@rhyde>
References: <D57E92F8-0706-11D7-B534-0030657C1952@sonoma.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert G. Plantz" <plantz@SONOMA.EDU>, ruxyz@yahoo.com
Cc: Assembly Linux <linux-assembly@vger.kernel.org>

Interesting.
In my experience Gas is probably the worst assembly to use
in an educational environment (no pedagogy).  I'm surprised you're
as happy with it as you are.  
(comments follow below).

----- Original Message ----- 
From: "Robert G. Plantz" <plantz@SONOMA.EDU>
To: <ruxyz@yahoo.com>
Cc: "Assembly Linux" <linux-assembly@vger.kernel.org>
Sent: Tuesday, December 03, 2002 1:33 PM
Subject: Re: Nasm v/s Gas


> I thought about this issue a lot when we moved to a linux
> platform for teaching assembly language. I chose gas because:
> 
> 1. It already exists on almost all linux systems.

Yes, in particular it exists on all non-x86 platforms as well (though
I don't know if this was your main consideration).
Most distributions also ship NASM (and have been for the past
year or so, so this is hardly a consideration).  Since almost everyone
has internet access, I seriously doubt this is an important consideration
today since anyone can download NASM, HLA, or just about any other
Linux-compatible assembler today.

> 2. The interface between gas and C/C++ is very good in the gnu
>     environment. (The whole point of our class is to teach
>     what is going on at the asm level when programming in C/C++.)

About the only advantage that Gas has over NASM or HLA in this
environment is that GCC's in-line assembly syntax is based on Gas (definitely
not the same, but similar).  NASM produces ELF files that link with
C/C++ just fine.  HLA is actually a compiler that emits Gas code (much like
GCC emits Gas code), so clearly HLA shares any advantages that Gas
has in this area.


> 2a. One can easily generate assembly language from a C/C++
>      source with gcc, which provides a valuable learning tool.

Depends, I guess, on what kind of assembly you want your students
writing.  While I have employed this very trick in the past (using
Windows compilers, which tend to generate much more readable
assembly code), the truth is that compilers don't produce the kind
of code a normal human being would write.  And if you're teaching
students to write code that way (that is, in the same style that a compiler
produces), there really is no need to learn assembly language programming
at all since a compiler would produce that kind of code for them (with a
whole lot less work).


> 3. Students need to learn the concepts, and the minor syntax
>     differences actually reinforce this.

Although I am not a big fan of Intel syntax, and, in fact, most people
would believe that HLA's syntax is closer to Gas than, say, to NASM,
I really don't agree with the second part of your statement.  The "minor"
syntax differences always raise the question of "why are we learning this
rather than the 'standard' way?"  For Gas, the reason for the "minor"
syntax differences was because Gas' authors wanted a single assembly
syntax for all the processors;  the mere fact that Gas now supports the
".intel_syntax" directive should suggest the ultimate popularity of that
approach.  Now there are good reasons for going with a different syntax
for your assembler (which I've done with HLA), but Gas' syntax is
not justified by any of those good reasons.  Gas' syntax was chosen
to fit the syntax of an existing assembler;  not a good design decision IMHO.

I do agree, though, that learning the concepts is the most important thing.
Whether a student learns NASM, Gas, HLA, MASM, TASM, SpASM,
or whatever, if they really learn the assembly paradigm, they can master the
syntax of some other assembler within a week or two, if the need arises.


> I have not taken the time to learn NASM to see if any of
> my arguments also apply to NASM. After using gas for four
> years, though, I do not regret my decision. It is working
> very well for us.

Again, I find this amazing.  Every class I've seen that uses an AT&T syntax
assembler has been a disaster in terms of teaching, really teaching, assembly
language programming.

> Please note that my comments apply to a teaching environment.
> I can easily imagine that other assemblers would be preferable
> in a productions environment.

I would find just the reverse to be true.  Gas may be okay in certain
production environments, but for educational environments the lack of
good documentation and pedagogy is a real issue.
It doesn't help that Gas isn't very robust (that is, it assumes that the code
you feed it is perfect and doesn't have very helpful diagnostics when fed
code containing the types of errors that students seem to produce).
Randy Hyde

