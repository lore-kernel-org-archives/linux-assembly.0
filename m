From: jeff <jko@save-net.com>
Subject: Re: Does anyone code in assembler today?
Date: Thu, 18 Sep 2003 09:10:20 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200309180835.05190.jko@save-net.com>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br> <200309171020.17639.jko@save-net.com> <3F695140.60003@eprocess.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3F695140.60003@eprocess.fr>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly-admin@mlists.in-berlin.de, linux-assembly@vger.kernel.org
Cc: fmarmond@eprocess.fr

On Wednesday 17 September 2003 11:31 pm, Frederic Marmond wrote:
> I'm sad to say that assembly is baddly considered by most of 'new'
> programmers,

I think this is true of assembler programmers also.  Some think it is
difficult and use it for small projects.  Other programmers
find it easy and use it for big projects.

This difference is interesting.  What makes assembler useful
for some programmers and of limited use for others?  I know some
of the answers but it is a complicated question.  Here are some
facts that look accurate to me:

1. Assembly can easily turn into a nightmare of spaghetti
    code.  This requires functions and modules to be created
    carefully and at lower levels than other languages.
2. Most Assembler tools are awful and new programmers have
    not encountered good tools.
3. People are different and some people do not want to think
    about registers and such.
4. It is easy to make assembler difficult for others to understand.
   The use of macros and uncommented subroutines soon create a
    language only readable by the original programmer.
5. A good assembler library can make coding speed and results about
    the same as a high level language.  Now, this point will probably
    create some argument.  About the only way to prove it would be
    to have some timed trials.  I've done a few over the years and
    found it true but creating the library in the first place was a big job.
    
   It is interesting we now have thousands of languages and still people
   are working on new languages.  All these languages are not much different
   from assembler with different libraries.

Anyway, I found assembler under Linux to be a nighmare at first.  The tools
were awful and the documentation was scattered around and written for
"c" programmers.  Now, with kdbg and a working nasm things are better
but could be improved.  It would be nice to have a good editor that recognized
conditional statements and could show the code of interest.  I don't really
want to see code for Sun or AIX systems.  

Has anyone tried the new nasm 98.38 that was just released to fix ELF
problems.   It appears to still have the old problem of stuffing a zero in
the generated code.  Probably a memory leak in the "c" code.

I wonder if we keep creating new languages and tools if someday our
tools will become more complicated than the thing we are tying to code.
Today we have all these different ways of doing "make" files and
organizing projects.  Communication tools for programmers working
on the same project and tools to release programs.  Our source code
is full of conditional macros to support all the various flavors of UNIX.
We have thousands of languages.  On and on.. 

jeff (still looking for a asm project)


