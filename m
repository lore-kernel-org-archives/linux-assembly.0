From: Rick Hohensee <rhohen@linux01.gwdg.de> (by way of hp
	<lx@lxhp.in-berlin.de>)
Subject: Forreal.tgz
Date: Sat, 2 Aug 2003 18:36:37 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200308021836.37947.lx@lxhp.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I have a working demo of 386 Forreal Mode (32-bit "unprotected") up on the
net along with the Ha3sm osimplay devel environment that spawned it. I
JUST put it up in http://linux01.gwdg.de/pub/cLIeNUX/interim/Forreal.tgz

That's not the dir that can supposedly withstand the Slashdot Effect. If
you tell someone about Forreal.tgz tell them it should be up or up soon in

ftp://ftp.gwdg.de/pub/linux/install/clienux/interim

I don't have Usenet posting access at the moment. I was using
linux-kernel@vger.kernel.org as a backdoor to Usenet, but the
Transmicrosofties were watching.

Below is a synopsis of what's in the tarball. There are several items that
reflect a lot of work.

Rick Hohensee
Precision Mojo Engineer





This is the juicier parts of my /Ha3sm directory here at cLIeNUX0 bundled
up for distribution. Here's an underview...

code
code/~listing           post-assembly listing of the last run of osimplay
top
code/ABOUT              most directories have an ABOUT file. This one
                        talks a lot about branching the source tree on
                        16/32 and then by PE1/PE0.
code/clip               Linux util to clip osimplay binaries for
bootsectors
code/jig/               testing code and so on, mostly VGA burblers
code/16/                use16 code
code/32/                        use32 code
code/top                the top sourcefile of the pre-Ha3sm under
development

                This particular top demos Forreal Mode. ~clipped is
                a live Forreal Mode bootable. cp to /dev/fd0,
                reboot, be the first on your block to use the
                386 mode INTeL missed.

code/~clipped           a bootable binary of what top assembled to
code/c                  a cut/paste convenience script
code/global/            source stuff neither use16 or use32, or both

tool
tool/clip.osimplay      Linux-version osimplay source for clip
tool/clip
tool/osimplay           the current osimplay/shasm, no Linux goodies
tool/ABOUT
tool/table/
tool/old_clip
tool/Linux              osimplay with ELF and syscalls, "print" and so on
tool/test/
tool/outline            a script that makes outlines from file trees
tool/listing
tool/labels             a script to grep for osimplay labels
tool/trygas             script for running Gas verbosely interactively
                        e.g. ../tool/trygas "movl %eax,[%edx]" and the
                        as -a  listing is returned to the terminal.
doc
doc/386part1            my conversion of 386INTEL.TXT to 7-bit ASCII,
doc/386part2                    80-or-less columns, and osimplay-like
doc/386part3                    register names. Still INTeL
anti-mnemonics.
doc/386part4
doc/386part5
doc/actualmodes         Essay on the four actual basic modes of the 386
doc/ABOUT
doc/coding_style        why osimplay has "=" and "loadmachinestatusdual"
doc/shasm.1.html        shasm cLIeNUX seedoc, html with a man-ly flavour
doc/shasm.3.html        shasm implementation doc
doc/shasmx86.1.html     x86 specifics of shasm
doc/version
doc/why?                No shasm is not a joke. Yes C sucks. Really.
doc/osimplay.1.html     meta-assembler doc

design                  Ha3sm design rants
design/axioms
design/axiis
design/IVs.html         This stuff is JUST starting to flavor what I'm
doing
design/vihZ             at the 1200-byte bootable level
design/style
design/vs_unix.html
design/NOT
design/acronyring.html          LAAETTR, IWTBTW, BTTYRT, IOW
design/Ha3sm_vs_the_PC.html
design/realtime
design/timings
design/Timings
design/init
design/events.html
design/channels.html
design/accesslayers.html
design/allocator.html
design/pikeC_                   the current acting Pope of C on style
ABOUT


That's only 2 levels deep. There's a lot more code files, but most is
untested. What's missing for a complete PC OS devel environment is Ralf
Brown's, a unix shell prompt, and a pizza delivery phone number. And much
of Ralf is peppered about the sources.

This stuff works on Linux, uh,

:;uname -a

Linux cLIeNUX 2.4.0-test10 #10 Thu Nov 9 03:11:45 2000 i586 unknown
with

:;bash --version

GNU bash, version 2.02.0(1)-release (i486-pc-linux-gnulibc1)
Copyright 1998 Free Software Foundation, Inc.

:; cLIeNUX /dev/tty4  08:22:39   /Ha3sm/Forreal
:;

An actual
                osimplay top
                                doesn't use anything but Bash, but I also
use Lynx, Pico, ed, cat, grep, and a few others. Not much though. I only
trygas when I think I've got a bug in osimplay itself, which is getting
less frequent. A hex editor is handy. I use cLIeNUX binedit, which is a
tweak of bpe, but bpe needed the tweak badly.

Rick Hohensee

:;date

Sat Aug  2 08:23:06     2003

:; cLIeNUX /dev/tty2  08:23:06   /
:;

