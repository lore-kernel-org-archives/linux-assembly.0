From: Patrick Alken <cosine@ellipse.mcs.drexel.edu>
Subject: ald 0.1.2
Date: Fri, 14 Jun 2002 22:12:49 -0400 (EDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.BSF.4.30.0206142208470.30769-100000@ellipse.mcs.drexel.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I have released ald (assembly language debugger) version 0.1.2 on:
http://ellipse.mcs.drexel.edu/ald.html

The most notable change is I have added support for the floating point
unit registers. The "register -all" command will display them. Also you
can "set step-display-fpregs" to display them after a single step.

I know many people are anxious for the ability to read mmx registers, but
I haven't gotten to this yet. This is currently my next priority, so
please be patient!

As always, comments and bug reports are welcome.

Sincerely,
Patrick Alken

