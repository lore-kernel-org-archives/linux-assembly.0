From: hp <lx@lxhp.in-berlin.de>
Subject: Re: Preprocessing Assembly
Date: Wed, 30 Apr 2003 08:32:25 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200304300633.h3U6XA9L031703@hirsch.in-berlin.de>
References: <3EAAA2CC.3000606@users.sourceforge.net> <200304271030.h3RAUDPi013804@hirsch.in-berlin.de> <3EAF13FC.4050402@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3EAF13FC.4050402@users.sourceforge.net>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johann Oskarsson <myrkraverk@users.sourceforge.net>
Cc: linux-assembly@vger.kernel.org

nachricht  vom Mittwoch, 30. April 2003 01:08:

Hi,

> hp wrote:
> >note also, that there are incompatibilities between binutils' versions and
> >cpp/cc. e.g, the quite annoying different treatment of blank spaces which
> >leads to unmangeable false evaluation of parameter lists to a '.macro' by
> >GASP after praeprocessing w. CPP; I had to catch those arbitrarily
> > inserted blanks with some short SED code in the makefile to overcome that
> > silly 'feature' (example: http://www.lxhp.in-berlin.de/lhpf4.html).
>
> I'll try to look at this later.  Can you be a little more specific?

simple example:

#define page_shift 12
#define page_size 1<<page_shift

some versions of CPP insert a blank after "<<".
thus you can't use a '#define'd string which contains multiple text elements 
as a macro argument w. GASP because of it's  (imho) very silly delimiting 
convention which takes a comma as well as a blank space for the .macro 
arguments delimiter but provides no means to pass a parameter which consists 
of more than a single piece of text. NO way round! no bracees, brackets... 

or, 
defined in the Makefile and passed with the CFLAGS-variable:

ifneq ($(ILIBDIR),)
CCFLGS          +=      -Dilibdir="$(ILIBDIR)"
endif 

and used, for instance, as:

libdirc: .sdatac ilibdir
        .byte 0                                                               

blank space will be inserted immediately after the expanded variable, before 
the <nul>-byte - probably by CC because CPP called via execution of the 
c-compiler ?


which can be 'fixed' with the additional the piece of text '%NWSP%' (or any 
other which will not coincide with a defined keyword &c) and, in Makefile:

---
# the <sed> command eliminates blanks after #defined operations
# without which # pre-2.12 binutils or gcc 2.95 or gasp won't 
# orderly evaluate the AS macroes!                                        
%.s:    %.S scdata $(wildcard a/*)
	$(CC) $(CCFLGS) $(SRCDIR)/$< |sed -e 's| *%NWSP% *||g' >$(BINDIR)/$@
---
then the modified lines read:
	#define page_size 1<<%NWSP%page_shift
and:
	libdirc: .sdatac ilibdir%NWSP%

>
> I'm not entirely understanding the following, what do you mean by 'rsp'
> and 'wrt' ??  (and I've got a headace and want to finish this email
> before going to sleep or something).
	^^^^^^^^^^^^^^^^^^^^^^^^ ...good luck!

sorry if I bothered you with my laziness:
	rsp	respective(ly)
	wrt	with respect to


further, the temporary radix setting of GASP is un-useable. 
	movl $H'12345,eax	(I tried any possible variant)
either, it works with cpp and gasp but triggers an error with AS or, cpp 
enamates the error message or gasp or... (stupid thing!)

similar errors result if a single character is passed as a numeric value, e.g.
	movb 'X,al

also, the string functions won't do anything useful, because they work on 
explicite arguments but not on variables, i.e. can't be processed afterwards.

variables defined by the assembler within/outside of macroes are handled 
inconsistently, often can't be used for calculations or arguments passing.

imho, due to bad design:
macro args can't be addressed by their numeric position in the arguments list.
no means to analyzing the addressing mode of an argument.
no cross-ref listing (something similar, which most often is quite useless).

...(more in the list included in the F4 archive)...

just mentioned. I'll leave that for later...


best,
	hp
-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  pse, reply to << lxhp -at- lxhp -dot- in-berlin -dot- de >>
