From: G Anna <drguruolai@eth.net>
Subject: Re: ld error
Date: 28 May 2002 10:57:56 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <m31ybwsuxv.fsf@wobble.eth.net>
References: <m3r8jygir3.fsf@wobble.eth.net>
	<200205272027.52371.alfred.cleve@t-online.de>
Reply-To: linux-assembly@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200205272027.52371.alfred.cleve@t-online.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alfred Cleve <Alfred.Cleve@t-online.de>
Cc: linux-assembly@vger.kernel.org


> Date: Mon, 27 May 2002 20:27:52 +0200
> From: Alfred.Cleve@t-online.de (Alfred Cleve)
> Subj: Re: ld error
> 
> Hi,
> 
> > I am working through 'Linux Assembly "Hello World" Tutorial, CS 200'
> > by Bjorn Chambless.  But I am unable to compile the program given in
> > that.  Kindly help me.
> 
> i suspect that exercise isn't a simple "hello world"-program. It
> seems to me as a nasty trap for lazy students :-))
> 
> The module "average" is a subroutine e.g. a "function" which should
> be linked to a given C-Program.

I don't think so, because the given assembly program has a main
function; and the tutorial has given a step by step procedure to
produce the executable.  

Inspite of my above statement, I am not very sure of the given
assembly program being complete, basically because it doesn't work!
But it does have a main function.

[ Added as an after-thought: Doesn't the function named 'main' have
any special significance in assembly language programs? ]

(begin-quote)

/* segment registers set up by linked code */
/* beginning of text(code) segment */
.text
        .align 4        /* set 4 double-word alignment */
.globl main             /* make main global for linker */
        .type main,@function    /* declare main as a function */
main:
     (definition of main snipped)

(end-quote)

If what you say is correct, then I don't think the tutorial serves its
purpose.  Already, I am pulling my hairs to understand what is going
on, and now I have got to put up with the caveats that the author
thought to be educational.  (No offence meant to the author, its just
my critique of the tutorial.)

> For my first step i'm looking for a readable tutorial to the
> "gas"-assembler.

Simply start from http://www.linuxassembly.org 

Cheers,
anna

-- 

(15) I will never employ any device with a digital countdown. If I find
     that  such  a  device  is absolutely unavoidable, I will set it to
     activate when the counter reaches 117 and the hero is just putting
     his plan into operation. - Peter Anspach in "The Top 100 Things 
     I'd Do If I Ever Became An Evil Overlord"

                                            http://www.eviloverlord.com

