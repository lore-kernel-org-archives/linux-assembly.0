From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: ANNOUNCEMENT: BiosDiskIO Library
Date: Thu, 24 Oct 2002 10:04:05 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000201c27b6e$a056fe70$d92f3a41@joe>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly Programming List <linux-assembly@vger.kernel.org>

BiosDiskIO is a library of Int 13h PC BIOS Disk Operations.  While DMA
(Direct Memory Access) produces faster I/O, the diskette and hard disk
services offered by the BIOS provide a backward compatibility for older
systems.  Additionally, BIOS Disk Operations also provide a
quick-and-dirty way to access low-level disk services without the hassle
of a fully-featured DMA system when speed isn't a consideration (such as
early stages of file system development).  Hence, the purpose of the
BiosDiskIO Library is two-fold: first, to provide backward compatibility
for older systems, and second, to provide quick-and-dirty access to
low-level disk services, especially for file system developers and
forensic analysts.

Check it out at: http://sourceforge.net/projects/biosdiskiolib

-----------------------------------

Current Release: Version 0.12

THIS RELEASE HAS NOT AT ALL BEEN TESTED.  USE AT YOUR OWN RISK!  It
should work in theory, but then again, so should Communism.

Be particularly careful of anything that I've explicitly labeled as
dangerous and anything that has to do with the Segment Offset.

Above all, let me know what works and doesn't work.  Software and
development testers would be most helpful at this point in the project.

