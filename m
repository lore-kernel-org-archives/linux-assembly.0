From: Patrick Alken <cosine@newton.physics.drexel.edu>
Subject: new ald release
Date: Wed, 9 Jul 2003 17:14:00 -0400 (EDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307091701240.17953-100000@newton.physics.drexel.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

  I would like to announce version 0.1.4 of ald (assembly language 
debugger). I apologize for the long period of inactivity, but I was 
finally able to find some time to address some of the bugs which were 
reported. It is possible that I have lost some of the feature requests / 
bug reports people have sent me, in which case I'd like to ask them to 
contact me again. Please report any bugs you find! This release has a 
completely rewritten disassembler so it is likely there are opcodes which 
won't be disassembled correctly. However, I believe the new disassembler 
(libDisasm) will make it very easy for people to include it in their own 
programs, although there isn't any documentation yet :-).

You can get ald from: http://dunx1.irt.drexel.edu/~psa22/ald.html

This release has been tested on Linux 2.4.18 and FreeBSD 4.8-STABLE.

From the Changelog:

0.1.4        2003/07/09

  - libOp has been replaced with the rewritten library libDisasm
    which has a better overall design

  - incorporated hp's patch:
      . "disassemble" command now shows symbol information.
        Also added "set disasm-show-syms" to toggle this feature on/off.

      . added ascii output for all size memory dumps

      . bug fix in elf header parsing

  - added ~/.aldrc configuration file to save settings

  - fixed MSB problem when setting register values




Enjoy,
Patrick Alken

