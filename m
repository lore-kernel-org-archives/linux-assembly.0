From: Fekete Gabor <feketga@delfin.unideb.hu>
Subject: gas jump
Date: Sun, 31 Aug 2003 00:46:35 +0200 (DFT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.A41.4.20.0308310041440.93300-100000@delfin.unideb.hu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi

i want to make a relative jump.
i tried it with "jmp 0x09" and expected it to
jump to the address that comes 9 bytes after
this "jmp".
is it correct?
i'm asking because when I examined (x/bx) the code with
gdb it didn't really show any bytes with value 0x09 when
looking at this jump instruction.

thanks


