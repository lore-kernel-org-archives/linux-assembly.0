From: Lope De Vega <lope.vega@yahoo.com>
Subject: about shared libraries
Date: Wed, 10 Oct 2007 07:36:59 -0700 (PDT)
Message-ID: <805612.8746.qm@web45508.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello,

I've setup a project using autoconf/automake/libtool
in which I create in the same row a static/shared
library and a binary written in assembly and not
linked to c, plus a test-case I also wrote in c.

However the test-case (for which I wrote a header file
complying with my library definitions) segfaults as
soon as I attempt to link with it, even if I'm not
using any of the functions it provides.

This is something which doesn't happen if I link
against the static version, though I'm not experienced
enough so as to know why.

Actually I've noticed a subtle difference in the
shared version:

00001cc8 a _DYNAMIC
00001db4 a _GLOBAL_OFFSET_TABLE_

Those symbols appears as external in anyother shared
library on my system, though I haven't found a way of
make it change unless I'm supossed to create my own
link script for this library (neither I'd know).

These are outputs I've pasted for if anyone could give
me a hint:

the c-test case (segfaults on _IO_vfprintf_internal)
as soon as I try to link with my library:

http://pastebin.ca/731746


nm's output of such a library:

http://pastebin.ca/731775


and the output from make when building it:

http://pastebin.ca/731776


What I did was to define BUILDING_LIBRARY when doing
so, and then _init_lib gets declared instead of _start
, and vicercersa when not, right at the end the
test-case gets built.

Regards,




      ____________________________________________________________________________________
Fussy? Opinionated? Impossible to please? Perfect.  Join Yahoo!'s user panel and lay it on us. http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7 


