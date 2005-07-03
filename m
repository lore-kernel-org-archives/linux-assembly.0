From: jko@bsn1.net
Subject: Re: TT6: High-quality custom logos and business identities
Date: Sun, 3 Jul 2005 10:17:37 -0700
Message-ID: <200507031017.37918.jko@bsn1.net>
References: <200506292204.j5TM4mLj024638@zeus2.kernel.org> <42C34737.5070208@colannino.org> <20050701223155.GB3256@absinth.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050701223155.GB3256@absinth.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux assembly <linux-assembly@vger.kernel.org>

On 07/01/2005 03:31 pm, Steffen Solyga wrote:

> So we're at least four :-p

Most people just lurk on lists.  I suspect this list has
more than 4 people signed up <grin>.

I'm currently spending a lot of time writting assembly programs
and have a few close to release state.  The file manager (AsmMgr)
has had a major update and the library (AsmLib) has had lots
of bug fixes, it now has over 200 functions.  A disassembler engine
is close to completion.  The disassembler engine is designed for
reverse engineering and speed.  Hopefully it will be fast enough to
iterate over "c" programs and produce nasm source.  I'm hoping it
will identify data areas by brute force itteration.

In other areas the debugger Frank wrote has been a great help
and the latest kdbg now runs without crashing.

So... there is some activity in the assembly arena.  The problem
that probably reduces interest in assembly is lack of entry tools.
It is possible to solve many portability issues with tools and
also reduce the learning curve for new programmers.  At present
our tools are very limited when compared to "c" tools and some
of the IDE programs for other languages.  I wrote a help system
called AsmRef, but it only runs in x-terminals on x86 systems
with kernel 2.4+.  That's pretty limiting.  Oh well...  

I wonder what other programmers think the best path for
assembly portabilty would be?  There are two approaches
I know of:
  
  1. macros to translate kernel calls for each different platform
  2. library calls to interface with the kernel and work with each
      platform.

The macro approach has some additional portability issues but
has been implemented by linuxassembly.org.  HLA uses it's
own unique approach and tries to include some structure to
assembler.  What do assembly programmers want or prefer?

jeff
http://members.save-net.com/jko%40save-net.com/asm/
http://sourceforge.net/projects/asmref
http://sourceforge.net/projects/asmlib
http://sourceforge.net/projects/asmmgr
http://sourceforge.net/projects/asmedit
http://groups.yahoo.com/group/DesktopLinuxAsm

h

