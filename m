From: hp <lx@lxhp.in-berlin.de>
Subject: Re: Preprocessing Assembly
Date: Sun, 27 Apr 2003 12:29:36 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200304271030.h3RAUDPi013804@hirsch.in-berlin.de>
References: <3EAAA2CC.3000606@users.sourceforge.net> <200304262320.h3QNKcVN000848@hirsch.in-berlin.de> <3EAB45C0.7000706@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3EAB45C0.7000706@users.sourceforge.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johann Oskarsson <myrkraverk@users.sourceforge.net>, linux-assembly@vger.kernel.org

Johann Oskarsson am Sonntag, 27. April 2003 03:51:
	[...]
> this, but am thinking of a more general solution.  What I'd like to do
> is to take gasp and create a separate tool called masp.  It'll be
> platform independent and therefore not backwards compatible with gasp,
				^^^^^^^^^^^^^^^^^^^^^^^^^^^^
not a problem, i.e. almost nobody seems to care about the gasp...

note also, that there are incompatibilities between binutils' versions and 
cpp/cc. e.g, the quite annoying different treatment of blank spaces which 
leads to unmangeable false evaluation of parameter lists to a '.macro' by 
GASP after praeprocessing w. CPP; I had to catch those arbitrarily inserted 
blanks with some short SED code in the makefile to overcome that silly 
'feature' (example: http://www.lxhp.in-berlin.de/lhpf4.html). 

> but will of course include the same functionality.  An added bonus will
> be that it'll be officially supported :)  Now is anyone interested in
					^^^^^^^^^^^^^^
	ME!

single objection: binutils is available in any(?) linux distribution, thus 
gasp could at least be compiled by a rsp. user - while 'masp' won't -?-


> this?  I may need a little encouragement in order to go through with this.
		^^^^^^^^^^^^^^^^
which?

> >> Do you generally use cpp, or is there a better tool out there?
> >
> >I don't know of any such tool which wouldn't be worse - or self-made.
>
> Worse than what, please be a little more specific?

'worse' than CPP; because, I'd resist to writing 'better' since CPP is some 
useable, even helpful tool, but I wouldn't call it 'good', so 'better' was 
not applicable.

'self made' because eventually I saw several helper sripts (bash, perl) for 
some partial  praeprocessing - GASP un-useability seems a common problem.

>
> Johann
>
> P.S. I was basically thinking of changing gasp directives from
> .something to /something, any comments on that?

why? the leading dot is so common to many tools for internal commands.
particularly, "/" might conflict with the linux file-path names' delimiter.
anyway, this should not impose any serious problems, with a proper keywords 
interpreter. only conversion of other sources might be a bit annoying.

imo, an assembly praeprocessor should leave as much as possible to the rsp. 
programmer, it can not assume any 'common' convention wrt the asm text!
reserved keywords and related required conventions may be un-avoidable but, 
_any_ other imposed ones are just bad (inadequate) design.

thus, a similar question which comes out of my Forth experiences: why not 
leave the entire naming to the user, w.o. _any_ 'special' or 'forbidden' 
characters (some more thaught required because of "C"-ish kewords decoding by 
testing for the rsp. leading chars)?
not easily implemented within the limitations of "C"-ish (etc) conventions 
but more conevenient to use(?) - or not worth the effort?

I gave up because I got my Forth systems which by definition of the language 
know no 'special' characters. thaught of a praeprocessor in ANS-Forth - which 
would be even more 'portable' than "C" and _very_ easy to handle. then, why 
not be consequent and do the complete assembler in Forth? I'd experiment with 
a Forth assembler but the source is not ANS, thus not a public project, yet.
currently, I'm back to rf hardware design which is so different and time (& 
interest) consuming that the asm projects won't be done, soon.


regards,
	hp
-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
   pse, reply to << lxhp -at- lxhp -dot- in-berlin -dot- de >>
