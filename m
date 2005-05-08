From: "Randall Hyde" <randyhyde@earthlink.net>
Subject: HLA v2.0/ADK Update
Date: Sat, 7 May 2005 19:12:08 -0700
Message-ID: <003401c55373$56930fb0$6302a8c0@pentiv>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

Hi All,

I've posted an update to the Assembler Developer's Kit
(the basis for the HLA v2.0 assembler) on Webster at
http://webster.cs.ucr.edu/AsmTools/RollYourOwn/index.html
(ignore the dates, I've still got to update the HTML page
and the master file is on a laptop I don't have available
to me right now).

This version has a couple of major additions.

1. (The Biggie) The ADK now assembles and runs under Linux.

2. The regression test suite has also been ported to Linux
(no small feat, this port uncovered a bunch of bugs in
both the test suite and the assembler).

3. I've modified the test suite to generate the comparison
test data for the test from a known (good) version of the
assembler. This saves a bit of time when downloading the
files as you don't need copies of all the test data in the
ZIP file.

4. This version includes the "static variable placement
optimization" that I've discussed in other threads around
here. It does a half-way decent job of filling in gaps
between the variables at either end of a declaration
section.

Sooner or later I'll get around to posting a Linux-ized
version of all the source code. Actually, the Windows
sources compile just fine under Linux, the only catch is
that the makefiles make contain some superfluous carriage
returns (which GNU make rejects).

Cheers,
Randy Hyde



You can find this software at

http://webster.cs.ucr.edu/AsmT=ADools/RollYourOwn/index.html

or

http://webster.cs.ucr.edu/AsmT=ADools/HLA/hla2/0_hla2.html

Cheers,
Randy Hyde

As far as computer languages go, most assembly languages
have a fairly simple syntax. As a result, many programmers
 have actually written their own assembler. Though many
 open source assemblers exist and one could argue that
 there is no real reason for writing an assembler from
 scratch,  there are many benefits to doing exactly that.
 Among these  benefits include:

Writing an assembler will give a programmer a good
appreciation of the instruction encoding

Writing an assembler will let the programmer insert the
features they want into the assembler

Writing an assembler allows the author to design a syntax
for the assembly language that they prefer

Writing an assembler is a good medium-sized project that
many beginning to intermediate programmers can handle,
allowing them to sharpen their programming skills on a
practical  project.

Unfortunately, there are some disadvantages to writing an
assembler,  as well:

Creating a "hobby-quality" assembler isn't a difficult
task,  but creating a "commercial-quality" assembler with
a  professional feature set is a large project, often
requiring  skills that beginning to intermediate
programmers don't possess.

Creating a modern assembler requires a lot of advanced
compiler  knowledge, again that most beginning to
intermediate programmers don't  have.

Creating a fast assembler, one that others will want to
use,  requires a commanding knowledge of data structures
and algorithms.  It's easy enough to whip out a little
"toy" assembler that works fine  for  small projects; it's
a bit more difficult to create a high-performance  system
that handles large projects just as well as small
projects.

While writing code to process individual machine
instructions is fun  and interesting, a professional-
quality modern assembler requires a  lot of other code to
handle declarations, data types, macros, and other
advanced features. These features are not particularly
easy  or obvious to implement.

The purpose of the Assembler Developer's Kit is to provide
 documentation and source code to those individuals who
 are  interested in writing a professional quality
 assembler, without  all the work needed to create such a
 product from scratch.  Using the ADK will allow a
 programmer to concentrate on the  interesting and fun
 parts of writing an assembler (e.g., working  on the
 instructions and the encoding of those instructions)
 while  sparing themselves all the "grunt" work (e.g.,
 writing high-  performance symbol table management code,
 writing a lexical  analyzer, parsing declarations, and so
 on).

The ADK is based on the code written for the High-Level
Assembler V2.0 (or, perhaps, it's better to say that HLA
v2.0  is being written around the use of the ADK). This
code is written  in assembly language using good
algorithms. As such, it executes  very fast! Because the
ADK is designed to implement the HLA v2.0  feature set,
you'll find that the ADK provides a very rich set of
advanced assembler features. Because the ADK is written in
assembly  language using HLA (v1.x), the code is very easy
read and understand.  Here are some of the advantages of
writing an assembler based  on the ADK:

Assemblers designed around the ADK will be very fast
(most of the time-consuming algorithms you'll find in an
assembler  are already efficiently implemented in the
ADK).

The ADK contains over 85,000 lines of code that an
assembler  author will not have to write themselves.

The ADK is very modular. You can easily eliminate features
you don't want.

The ADK is based on the HLA v2.0 feature set, perhaps the
most advanced x86 assembler ever designed.

Unlike most open source assemblers, the ADK contains
documentation  that explains the internal operation of the
code, so you can more easily  figure out the internal
operation of the system in order to make  modifications.

If you decide to adopt an HLA-like syntax for
declarations,  you can use the ADK code almost as-is,
supplying only the  instructions needed to implement the
assembly of your instructions.

The ADK is being designed to be portable. Code will
compile  under Windows and Linux. If you exercise care
when writing your  portion of the assembler, you'll be
able to port your assembler to  different operating
systems with minimal effort.

Along with HLA v2.0, the ADK is under continuing
development.  Expect new features and facilities as time
passes.

The ADK is great for those who would like to create a
HLA-like  assembler for processors other than the x86
(actually, there's no  reason you can't use it to create
an x86 high-level assembler; that's  exactly what the ADK
was developed for in the first place.).

With some minor modifications, you could even use the ADK
as the basis for creating a high-level language compiler.

The ADK is planned to contain the following components:

A lexical analyzer module (scanner)

Symbol table management code

Declarations parsing code

A compile-time language/macro processor module

A set of object-code generation modules (for different
object code file formats)

Documentation for the internal operation of the ADK code

User-level documentation (that you can edit) that
describes  the user-visible features of the ADK components
 (to which you would add your specific assembler's
 documentation).

Not all of these components are in place at this time,
but a fair amount of code is currently available.  As
development proceeds on the HLA v2.0 project,  you can
expect to see the ADK's feature set grow.

Note that the ADK source code is written in HLA v1.x, so
you  will need to download and install a recent version of
HLA in  order to modify the ADK source code. Note that the
ADK  source code is very modular and uses standard calling
conventions,  so it is perfectly possible to write your
code using a different  assembler and link your code into
the ADK object code.  However, it's probably going to be
easier to maintain your  assembler if you write the whole
thing with HLA.

Note that the ADK project is public domain and open
source.  Anyone wishing to contribute may do so, as long
as they are  willing to release their code to the public
domain (of course,  anyone may contribute to the project
anyway they like, but  the "official" components of the
ADK must all be in the  public domain).

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
