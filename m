From: Emanuele Altieri <ealtieri@hampshire.edu>
Subject: i386: far jumps
Date: 15 Jul 2002 22:21:26 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1026786087.2055.99.camel@italia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Assembly List <linux-assembly@vger.kernel.org>

Greetings,

I'm doing some experiments with far jumps to different code segments.
For example:

   ljmp $16, $hello

where $16 is the segment selector, and "hello" is a label that I set up
for testing. The code above works fine.

However, when I change the code as following:

   movw $16, %dx
   movw %dx, %fs
   ljmp *%fs:hello

I get a general protection error. I don't understand why. I believe it's
a notation error. Can anybody see it?

I'm interested in this because I need the segment argument of ljmp to be
variable.


Thanks!


 -Emanuele

