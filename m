From: Frank Kotler <fbkotler@comcast.net>
Subject: Sorta announce - Nasm 0.98.39 sorta available
Date: Thu, 20 Jan 2005 18:39:33 -0500
Message-ID: <41F04135.4D7AA316@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: clax-submit@crayne.org, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>, "luxasm-devel@lists.sourceforge.net" <luxasm-devel@lists.sourceforge.net>, "nasm-devel@lists.sf.net" <nasm-devel@lists.sf.net>, "aoaprogramming@yahoogroups.com" <aoaprogramming@yahoogroups.com>, linux-nasm-users@yahoogroups.com, win32-nasm-users@yahoogroups.com, "DesktopLinuxAsm@yahoogroups.com" <DesktopLinuxAsm@yahoogroups.com>, nasm-devel@yahoogroups.com, nasm-users@lists.sf.net, "D. J. Bernstein" <djb@cr.yp.to>

Nasm 0.98.39 is available - but not on SourceForge quite
yet... they're having some "transitional difficulties" at
the moment. We'll get copies up there as soon as the release
system seems stable - couple days, probably.

Meanwhile:

http://www.kernel.org/pub/software/devel/nasm/

The "binaries" are not complete, but win32, djgpp, and Linux
are available, plus, of course, a source package. 0.98.39
goes from C89 to C99, which apparently is causing some build
problems with some compilers. If you need/want to build Nasm
from source, and you can't figure it out, holler for help.
If you *can* figure it out, *post* some help, please.

For djgpp, you need the "beta 2.04" version, for example
(Thanks to Bart Oldeman for that tip). The Makefile created
by "configure" in Linux (and rdoff/Makefile) needs "std=c99"
removed. (Mkfiles/Makefile.unx seems okay) I hope we'll have
a "cleanup release" out sooner than the year and a half that
this release took, but no promises.

I *really* hope that everyone will upgrade to 0.98.39 as
soon as possible! Why? Well... a "Serious Problem" has been
uncovered in Nasm - all versions prior to 0.98.39 (maybe not
*really* early versions). We all know enough  not to run
code from untrusted sources (I hope!). Turns out you're
vulnerable even *assembling* malicious source with Nasm.
Yes, a <line-noise> buffer overflow (potentially
exploitable). Betov gets "I told you so" rights. Not
actually *caused* by using C, but C provided the hole for us
to fall into. I am deeply embarrassed that this remained
undiscovered so long!

The vulnerability was discovered by Jonathan Rockaway (a
student - since Nasm was written by a student, this is
perhaps appropriate), reported to us by D.J.Bernstein (his
instructor). Fixed by Ed Beroset. Thanks to all involved!

Other than that, the changes aren't too exciting. Nice new
rdoff stuff from Yuri Zaporogets, for the few who use rdoff.
Otherwise minor cleanups not worth mentioning...

Please upgrade and get rid of that buffer overflow! If you
can't/won't upgrade, please *examine* any source code from
less-than-fully-trusted sources for anything that looks
"weird". AFAIK, no one is targetting Nasm, but... we don't
need this crap!

Best,
Frank
