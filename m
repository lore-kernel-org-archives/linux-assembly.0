From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: interupts...
Date: Mon, 23 Sep 2002 15:50:20 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <24690.9484304071$1032789031@news.gmane.org>
References: <Pine.VMS.3.91-2(vms).1020923151918.31945B-100000@cs.felk.cvut.cz>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.VMS.3.91-2(vms).1020923151918.31945B-100000@cs.felk.cvut.cz>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org



You can look at arch/i386...

in assembly file how to reprogram 8259 (relocate HW interrupts to 
diffrent number), which is a beast, you have to done it in that way...

It is round 10 in/outs I think. You can look at ralf brown interrupt list 
(ports.lst)  how to program that chip.

or at developer.intel.com


Rudolf




