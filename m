From: Patrick Alken <cosine@ellipse.mcs.drexel.edu>
Subject: new version of ald
Date: Sat, 29 Jun 2002 11:16:24 -0400 (EDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.BSF.4.30.0206291109430.94769-100000@ellipse.mcs.drexel.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

There is a new version of ald up at :
http://ellipse.mcs.drexel.edu/ald.html

Release 0.1.3 contains support for mmx registers. You can use the
"set step-display-mmxregs on" command to display mmx regs after single
stepping. Or use "register -a" to list all registers, including mmx.

One caveat: currently ald does not have the ability to modify the mmx
regs. There is no portable way to store 64 bit integers in C as far as I
know, so I'll need to spend more time thinking about how to do this. I
hope this does not create any inconveniences.

Enjoy and let me know of any bugs - cosine@ellipse.mcs.drexel.edu

Patrick Alken

