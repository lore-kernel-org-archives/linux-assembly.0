From: Tomasz Grysztar <fasm@metro-nt.pl>
Subject: fasm for linux
Date: Mon, 15 Jul 2002 10:56:41 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15112961257.20020715105641@metro-nt.pl>
Reply-To: Tomasz Grysztar <fasm@metro-nt.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org


I'd like to let you know that my flat assembler (that got quite
popular for DOS and Win32 programming) is now also released for Linux.

The Linux package contains three examples: one of manually-built ELF
file (doesn't need a linking), a two of COFF-format object files,
also with calling libc functions. It's available to download at
two mirrors:

http://fasm.metro-nt.pl/
http://fasm.sourceforge.net/

The Linux version has the same functionality as DOS/Win32 versions,
so you can also assemble DOS/Win32 programs using it. Examples
of binary/MZ/PE programs you can find in the DOS/Win32 package.

The current release is 1.39 - it's stable, but it's only
the pre-release. Final version 1.40 I will release after
gathering enough comments about 1.39 (and fixing the bugs, if
there are any). It will also have a much better documentation.

-- 
Tomasz

