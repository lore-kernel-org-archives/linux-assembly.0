From: Mitchell N Charity <mcharity@vendian.org>
Subject: detailed runtime control of dynamic linking?
Date: Wed, 5 Feb 2003 16:30:39 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200302052130.h15LUdR07160@vendian.org>
Reply-To: mcharity@vendian.org
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I am playing with fine-grained runtime control of dynamic linking,
and am looking for code.

Glibc provides the runtime linker ld.so (aka ld-linux.so), which can
be partially controlled by the portable dlopen library (<dlfcn.h>,
dlsym, dladdr, dlinfo, etc).  I would like to trade portability for
total control, so a running process can knit together its dynamic
objects in any way it sees fit.  Including the ability to hard unlink
("dlclose" an object even if it is still in use, like DLD's
dld_unlink_by_file hard option), unresolve lazy symbols (resetting
the PLT trampoline so the linker tries again the next time the symbol
is called), explicitly resolve symbols (setting PLT and GOT entries),
change search paths, and so on.  But I would, of course, rather not
write it myself.  My current objective is mostly to illustrate a
software engineering argument, so flakey is fine.


Do you know of anything which does at least some of this?


(I'd prefer code, ideally for linux, ELF, the glibc runtime linker, and x86,
 but I am interested in pointers to anything.)

Thank you for your help,
Mitchell Charity

"It's amazing what gets accomplished during intensive jobsearch avoidance..."
