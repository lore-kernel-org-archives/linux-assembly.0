From: "Randall Hyde" <randyhyde@earthlink.net>
Subject: HLA v1.71 is now available
Date: Tue, 19 Oct 2004 13:09:58 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <005801c4b617$9b8abb80$6501a8c0@pentiv>
References: <56005.10.0.0.20.1098162741.squirrel@mail.cusat.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi all,

HLA v1.71 is now available on Webster at the HLA download page:
http://webster.cs.ucr.edu/AsmTools/HLA/dnld.html

This is a maintenance release, containing the following minor
changes:

 * Corrected a syntax error in the arrays.hhf header file
   (extra parentheses occuring in the test for floating-point
    types)

 * Fixed a problem with the indexing into REAL80 arrays in
   the arrays.hla module in the standard library.

 * Fixed a problem with the mem.isInHeap function.

 * Changed FASM output to use conditional assembly to
   "protect" extrn symbols in case the symbols weren't
   accessed in the file.

I also modified the HLA.DLL code in the "examples"
download to compile correctly when using FHLA.

----------------------------------------------------

HLA, the High-Level Assembler, is a powerful macro
assembly language development system that runs under
Windows and Linux operating systems. Carefully-written
applications are portable between both operating systems
with nothing more than a recompile of the source file.

From a features point of view, HLA is one of the most
powerful assemblers ever written. It's macro and
"compile-time language" facilities far exceed those found
in other assemblers.

HLA was specifically designed to make learning and writing
assembly language as easy as possible. HLA is fully supported
by tons of documentation, example code, and other things
that beginning and advanced programmers will find useful.
The 32-bit edition of "The Art of Assembly Language"
(No Starch Press) teaches introductory assembly language
programming using HLA and is one of the most often-cited
textbooks on the subject.  You can read "The Art of Assembly"
on-line at http://webster.cs.ucr.edu/AoA/index.html.

The HLA system also includes the HLA Standard Library,
a collection of hundreds of ready to use library routines that
simplify assembly language programming and provide (among
other things) a usable interface to the underlying operating system.
Full source code to the Standard Library is available.

The HLA compiler and standard library are public domain and
can be used anyway you see fit.

Cheers,
Randy Hyde


