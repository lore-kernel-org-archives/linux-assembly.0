From: Johann Oskarsson <myrkraverk@users.sourceforge.net>
Subject: Re: Preprocessing Assembly
Date: Wed, 30 Apr 2003 00:08:28 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3EAF13FC.4050402@users.sourceforge.net>
References: <3EAAA2CC.3000606@users.sourceforge.net> <200304262320.h3QNKcVN000848@hirsch.in-berlin.de> <3EAB45C0.7000706@users.sourceforge.net> <200304271030.h3RAUDPi013804@hirsch.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: hp <lx@lxhp.in-berlin.de>, linux-assembly@vger.kernel.org

Hi,

hp wrote:

>note also, that there are incompatibilities between binutils' versions and 
>cpp/cc. e.g, the quite annoying different treatment of blank spaces which 
>leads to unmangeable false evaluation of parameter lists to a '.macro' by 
>GASP after praeprocessing w. CPP; I had to catch those arbitrarily inserted 
>blanks with some short SED code in the makefile to overcome that silly 
>'feature' (example: http://www.lxhp.in-berlin.de/lhpf4.html). 
>
I'll try to look at this later.  Can you be a little more specific?

>single objection: binutils is available in any(?) linux distribution, thus 
>gasp could at least be compiled by a rsp. user - while 'masp' won't -?-
>
I'm using the autoconf tools and can build rpms, so I guess that won't 
be a problem.  Just a matter of down loading the package.  Although I 
may have damaged some of the portability.

>[...]
>
>some partial  praeprocessing - GASP un-useability seems a common problem.
>  
>
That's what masp is meant for :)

>>P.S. I was basically thinking of changing gasp directives from
>>.something to /something, any comments on that?
>>    
>>
>
>why? the leading dot is so common to many tools for internal commands.
>
My original need for something else than gasp is becouse it's directives 
conflict with mips directives. For example .end is eof in gasp but is 
used on mips systems to mark end of functions.  Cutting off the rest of 
the file at the end of the first function (not to mention making the 
object file undebuggable) is *not a nice thing*.

>particularly, "/" might conflict with the linux file-path names' delimiter.
>anyway, this should not impose any serious problems, with a proper keywords 
>interpreter. only conversion of other sources might be a bit annoying.
>
I've opted for \ now, should make life a little easier for some ppl. 
 I'll be adding a parameter to specify this character.  I've just made 
my first version and a release is on the way soon.

I'm not entirely understanding the following, what do you mean by 'rsp' 
and 'wrt' ??  (and I've got a headace and want to finish this email 
before going to sleep or something).

>imo, an assembly praeprocessor should leave as much as possible to the rsp. 
>programmer, it can not assume any 'common' convention wrt the asm text!
>reserved keywords and related required conventions may be un-avoidable but, 
>_any_ other imposed ones are just bad (inadequate) design.
>
>thus, a similar question which comes out of my Forth experiences: why not 
>leave the entire naming to the user, w.o. _any_ 'special' or 'forbidden' 
>characters (some more thaught required because of "C"-ish kewords decoding by 
>testing for the rsp. leading chars)?
>not easily implemented within the limitations of "C"-ish (etc) conventions 
>but more conevenient to use(?) - or not worth the effort?
>
>I gave up because I got my Forth systems which by definition of the language 
>know no 'special' characters. thaught of a praeprocessor in ANS-Forth - which 
>would be even more 'portable' than "C" and _very_ easy to handle. then, why 
>not be consequent and do the complete assembler in Forth? I'd experiment with 
>a Forth assembler but the source is not ANS, thus not a public project, yet.
>currently, I'm back to rf hardware design which is so different and time (& 
>interest) consuming that the asm projects won't be done, soon.
>
>
>regards,
>	hp
>  
>


