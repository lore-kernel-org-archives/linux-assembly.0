From: jeff <jko@bsn1.net>
Subject: AsmIDE development snapshot
Date: Wed, 16 Mar 2005 14:46:31 -0800
Message-ID: <20050316144631.66aa9050.jko@bsn1.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

The AsmIDE project has reached another milestone and
may be of interest.  It is far from complete, but usable
and much improved from earlier versions.  The usabable
components are:

  AsmRef - extensive menu driven help system.
           This is a much improved version with
           about 30 files of interest to assembly
           programmers.
 

  AsmMgr - a "mc" style file manager which has been
           configured for smIDE.  It will do normal
           file minipulation and kick off compilers,
           etc.  This is the front end for the AsmIDE
           family of programs.
    

  AsmLib - Library of about 160 functions for Linux
           x86 programming (console or terminal).
           (the library had 3 bugs and is now approaching
            200 functions)

  AsmEdit - A general purpose editor with hooks for
           assembly programmers.  This version has a
           few bug fixes, and some reorginization.

  AsmFunc - General functions to enhance AsmEdit and
           AsmMgr.  Also, a few general programs that
           did not fit anywhere else.

  AsmPlan - This an alpha program that will be redesigned
           soon.  It is mostly a place holder for now,
           but it does provide a somewhat useful todo
           program.

All of these programs are on the web page at:
  http://members.save-net.com/jko%40save-net.com/asm/

Any feedback is appreciated.  

 all the best, jeff  
