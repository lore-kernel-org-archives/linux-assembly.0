From: Patrick Alken <cosine@newton.physics.drexel.edu>
Subject: new release of assembly debugger
Date: Sat, 11 Oct 2003 19:16:10 -0400 (EDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0310111902510.25095-100000@newton.physics.drexel.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello all,

  I have released a new version of ald (assembly language debugger) at:

http://dunx1.irt.drexel.edu/~psa22/ald.html

This release fixes some bugs and adds some minor features. Also, OpenBSD 
is supported again. I broke OpenBSD a while back when I added 
support for fpu registers, but now it compiles again. FPU support isn't 
100% on OpenBSD yet but the debugger is definitely usable.

Also, I have added the files TODO and BUGS which contain lists of bugs and 
features I want to add. Since I have lots of time constraints currently I 
am hoping to make it easy for others to get involved. Anyone who may be 
interested in contributing code feel free to look through these files to 
see if there is anything you'd want to work on.

From the Changelog:

  - "file secinfo" command can now output information on
    a.out sections

  - added TODO and BUGS files

  - fixed problems relating to changing values of fpu
    special purpose registers

  - added some missing SSE instructions to libDASM 

  - OpenBSD support is back: fixed compile programs relating to
    fpu code, tested on 3.3 release 

  - bug fixes in disassembling various MMX instructions
    (thanks to Peter Boettcher for patch)

  - changed library libDisasm to libDASM (Debugger's Assembler
    Library) in anticipation of its new capability to assemble
    instructions

  - added OSABI information to elf header parsing in libOFF
    (someone sent me a patch for this ages ago - sorry for
    taking so long!)

  - added -DNDEBUG to turn off assert() in out-of-the-box
    compiles

  - bug fix in a.out parser: now checks for QMAGIC binaries

  - "file symbols" command has changed to "file syminfo" and you
    can now use "file syminfo [symbol name]" to get information for
    a specific symbol

  - added libOFF to handle all the object file format stuff


Sincerely,
Patrick Alken

