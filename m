From: "Daniel R. Blair" <joecamel@realcoders.org>
Subject: Re: 32-bit assembler::how to initialize segment registers
Date: Tue, 19 Oct 2004 21:57:37 -0400 (EDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20041019211937.G1387@codepoet.unixcoders.org>
References: <56005.10.0.0.20.1098162741.squirrel@mail.cusat.ac.in>
 <1098164458.4174a8ea294cc@imp6-q.free.fr>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1098164458.4174a8ea294cc@imp6-q.free.fr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: zebarbuc@free.fr
Cc: san@cusat.ac.in, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

On Tue, 19 Oct 2004 zebarbuc@free.fr wrote:

> I don't understand your question...
> You want to create your own assembler (like 'as86' prog), but you don't know how
> to make it? That's it?
> If yes, you'd better buy a related book, i'm afraid that we cannot answer all
> your futur requests.
> If not, please, explain a little bit your problem...

Selon,
 	Amen.. if you are not sure about something as elementary as that 
(which isn't elementary, but it is in the context (relatively)), then you 
really need to learn more about the x86 architecture, ELF binary format, 
etc.  There as stated above, this list is to help with specific things, 
assembler related, not to help people write assemblers =]  If you are 
using an assembler, and say, have a piece of code that *SHOULD* work, but 
doesn't, then post it and other eyes may see something/know something that 
you don't and can tell you "Oh, under protected mode that cannot be 
successfully completed, you must go through another register and access 
it indirectly" or something like that..

 	I suggest getting the source to HLA, or NASM, etc. and checking it 
out.  I know it's a lot to go through (both lines of code wise, as well as 
sheer technical data/routines), but, if you plan on writing your own 
assembler, optimized or not.. I am talking about just getting one to work 
and build an executable/binary that will run, based on either a sub-set of 
the x86 instruction set, or the entire x86 instruction set (preferably the 
later), then you need to know the "basics" about how an assembler works, 
how a linker works, parsers, lexical analyzers, etc.  This you need books, 
time, and knowledge, reference tables, etc.  Even to do a straight 
assembly language to machine code translation program.. and that isn't 
doing much.. but it still involves reading ahead, recognizing grammar(s), 
etc. and then acting on them (i.e. loop constructs, etc.)

 	All of this should be something that you already know... if you 
are attempting to write a working assembler in C.  If not, just stop 
writing your assembler now and either start reading, or write something 
else.  Again, NASM is a great, Open Source, x86 assembler that compiles 
under Unix (I run FreeBSD and use NASM, but I know it works on Linux too), 
and I think it even has a version and compiles under Windows as well..

 	HLA (High Level Assembler), which can be found by searching google 
for "HLA High Level Assembly Webster" (the site is called "Webster", not 
sure, but, it's something like www.webster.edu or webster.something.edu, 
etc.  it's not, to my knowledge, webster.com|net|org, so, you need to 
search for it, but, it will be the first thing that comes up I am sure), 
it not only has the HLA (High Level Assembly) language compiler, but, it 
is written by the author of the book, which I own, now that you can 
purchase it in print, rather than just read it online (although the Online 
version gets updated more frequently than the printed version, for obvious 
reasons) entitled "The Art of Assembly Language".  This book is a great 
reference for anyone learning assembly language, but also a great book to 
teach you how things operate, etc.  HLA is more of a cross between a 
high[er] level language and assembler, with things like mutable variables, 
procedures/functions/etc.
 	Check it out and recommend it to people who want to learn more 
about how the actual architecture works.. what are it's quirks, etc.  and 
then also, to ease people into assembly language programming from standard 
procedural languages as well.  Once you have learned how to program in 
HLA, you can take of the "training wheels" and write in pure assembler, 
which HLA can compile.. so.. you can start mixing your old code that used 
HLA constructs that aren't quite valid asm, or, shall I say, not "straight 
assembly language", but, damn close, and a lot more close than C/C++, 
etc., and then finally, you can be programming in pure assembly language 
code by itself, again, using HLA, and you are now capable of programming 
in ASM.

 	Now, even writing code using the HLA libraries and syntax, it is 
compiled, or shall I say, pre-processed, to be pure assembly language, 
before it's compiled, so, it's pretty close, and right on the money (in 
some cases), to what you would code (or would like to have written) by 
hand in a lot of places.  Some places are a *LITTLE* less effecient simply 
because you cannot interpret something dynamically (i.e. the syntax of a 
high level language), and turn it into optimized assembler code in the 
absolute best way, using the least amount of instructions, or cpu cycles 
(as lower instruction count doesn't nessecarily equal lower cpu cycle 
count.)  The HLA libraries are written in pure assembler I think, which is 
why it's so close to hand written assembler once it's been pre-processed, 
but, you get the idea.

 	You can download and/or read the book, The Art of Assembly (AoA) 
online, and it will show you from start to fnish how to write assembl 
langage code, using HLA, and also the differences in HLA and normal x86 
ASM.  It will show you everything you need to know.. and, as I stated, you 
can purchase this book by itself too (which comes with a CD-ROM and other 
things in the book.. like the sample code, sample apps, the book in PDF 
and HTML format, the RadHLA IDE for HLA, etc.)  But, if you buy the book, 
you will want to snag the newest version of the HLA distribution, and then 
you can follow along with the book.. just read the CHANGELOG to see if 
anything major has changed between versions (incompatibilities, etc.)

Hope this gets you started bro.. I applaud the effort in wanting to write 
an assembler, as it's a monumental task.. whether for a project or for a 
tool to be used by others, in place of the existing tools which are 
already mature, used by many, and supported on lots of architectures.  So, 
if you aren't doing this "just to do it", and you want people to start 
using it, etc.  You are going to need a lot of knowledge on your side to 
make yours better than what's already out there bro =]  If you are doing 
it as a C.S. project, than, go for it, and good luck.  If you honestly 
have the skills and the knowledge that it takes to write an assembler, and 
you have the time (which obviously you do, or at least think you do, or 
you wouldn't be attempting to write one), you might consider joining the 
NASM Open Source development team, or some other Open Source assembler 
team, and that way you can help aid in making an existing product perform 
better, rather than re-inventing the wheel and most likely (no offense to 
you meant at all) doing it worse than it already exists.. simply because 
the other projects have had time for user feedback, etc. and have improved 
because of knowledge gained during development, testing, and in other 
areas.. starting from scratch will give you a good feeling when you can 
compile your own "Hello, World!" program/binary and actually run it and 
have it work, but, adding to a project like NASM will benefit the 
community a lot more..

 	Hope some/any of this helped you, if not, at least I got it out in 
the open and perhaps it will be archived somewhere and come up on a search 
of older news group postings for some other pour soul seeking knowledge =]

Cheers,

Danny
                            = Daniel Blair =
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
- dblair@realcoders.org -                   [http://www.realcoders.org]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

