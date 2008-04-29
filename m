From: Bodo Giannone <Bodo@Giannone.de>
Subject: init.asm - 0.03 (19-Jun-2002) - asmutils 0.18
Date: Tue, 29 Apr 2008 17:36:13 +0200
Message-ID: <4817406D.5000605@Giannone.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello,

I am the maintainer of BG-Tiny Linux Bootdisk.

The tiny init version included in asmutils-0.18 (init.asm 0.03,
19-Jun-2002) is exactly what I was looking for to integrate into BG-Tiny
Linux Bootdisk. Unfortunately I am havging some problems I cannot
resolve myself due to lacking assembler skills.

I want to start /bin/sh on tty1-4 without using getty or login.
Unfortunately directly after booting I get the following error message:
"can't access tty, job control turned off". This could mean that init
does not activate the ttys completely. Is there a possibility to change
that?

The sh I am using is ash from BusyBox 1.3.2. If I try to use sh.asm from
asmutils-0.18 I only get a segfault.

I am using linux kernel 2.4.36.2 and uClibc 0.9.27 (linked statically).

It would be great if someone had a suggestion.

Many thanks in andvance.

Greetings,

Bodo Giannone
