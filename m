From: "J.S.Souza" <jssouza@pacbell.net>
Subject: Re: ld error
Date: Tue, 28 May 2002 05:54:35 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200205281254.FAA16891@gold.he.net>
References: <m3r8jygir3.fsf@wobble.eth.net> <200205272027.52371.alfred.cleve@t-online.de> <m31ybwsuxv.fsf@wobble.eth.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <m31ybwsuxv.fsf@wobble.eth.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

No, "main" doesn't have any special significance in assembly and is NOT 
required.  However, the assembler _does_ look for a procedure named "_start", 
but this also is not required because it will default to something else and 
just give you a warning about it if it's not included.  BTW, I understand how 
you feel about pulling your hair out, but this is the best way to learn _any_ 
language.  Also, all you really need to do to assemble and link a program is 
the following:
as -o hello.o hello
ld -o hello hello.o
All the other stuff is just extra.  I usually assembly my programs with 
--gstabs so that I can debug them with gdb, but it's not necessary for the 
program to assemble.  --gstabs is the same as the -g when compiling C 
programs.

			Cheers,
			Jeff Souza

On Monday 27 May 2002 10:27 pm, G Anna wrote:
> > Date: Mon, 27 May 2002 20:27:52 +0200
> > From: Alfred.Cleve@t-online.de (Alfred Cleve)
> > Subj: Re: ld error
> >
> > Hi,
> >
> > > I am working through 'Linux Assembly "Hello World" Tutorial, CS 200'
> > > by Bjorn Chambless.  But I am unable to compile the program given in
> > > that.  Kindly help me.
> >
> > i suspect that exercise isn't a simple "hello world"-program. It
> > seems to me as a nasty trap for lazy students :-))
> >
> > The module "average" is a subroutine e.g. a "function" which should
> > be linked to a given C-Program.
>
> I don't think so, because the given assembly program has a main
> function; and the tutorial has given a step by step procedure to
> produce the executable.
>
> Inspite of my above statement, I am not very sure of the given
> assembly program being complete, basically because it doesn't work!
> But it does have a main function.
>
> [ Added as an after-thought: Doesn't the function named 'main' have
> any special significance in assembly language programs? ]
>
> (begin-quote)
>
> /* segment registers set up by linked code */
> /* beginning of text(code) segment */
> .text
>         .align 4        /* set 4 double-word alignment */
> .globl main             /* make main global for linker */
>         .type main,@function    /* declare main as a function */
> main:
>      (definition of main snipped)
>
> (end-quote)
>
> If what you say is correct, then I don't think the tutorial serves its
> purpose.  Already, I am pulling my hairs to understand what is going
> on, and now I have got to put up with the caveats that the author
> thought to be educational.  (No offence meant to the author, its just
> my critique of the tutorial.)
>
> > For my first step i'm looking for a readable tutorial to the
> > "gas"-assembler.
>
> Simply start from http://www.linuxassembly.org
>
> Cheers,
> anna
