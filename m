From: "Randall Hyde" <aoax86@earthlink.net>
Subject: HLA v1.49 is now available
Date: Sun, 8 Jun 2003 07:51:58 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <001701c32dcd$82d3f3a0$6601a8c0@rhyde>
References: <Law14-F517jvXRGwmHi0000fee3@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: S kris <kris_bs@hotmail.com>, gcc@gcc.gnu.org
Cc: linux-assembly@vger.kernel.org

Hi all,
HLA v1.49 is now available from the Webster download page
(http://webster.cs.ucr.edu).

HLA is the High Level Assembler for 80x86 processors. It runs under
Linux and Windows. Carefully written programs are portable between
the two OSes.

Lots of new sample code, lots of changes to the standard library,
and a few bug fixes. Also, both Windows and Linux versions of the
compiler are available with this release.

Big change: the new console routines are integrated into the standard
library (portable between Linux and Windows).
This will probably break existing applications that use the console
library routines. The older routines are available for
separate linking to maintain compatibility.

New Iczelion conversions.
New "Windows Programming in Assembly (WPA) examples.
Plus more!

Enjoy!
Randy Hyde
