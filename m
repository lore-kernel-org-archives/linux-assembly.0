From: Paul Furber <paulf@gam.co.za>
Subject: asmutils libc fun and games
Date: Fri, 17 May 2002 15:24:47 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3CE5049F.5000405@gam.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hello fellow asm heads,
I've discovered the joys of the asmutils boot disk and now want to make 
it possible to include statically linked code written in C and the 
asmutils libc library on the distro. But I can't get the static versions 
working. Here's the problem:

In the Makefile (in asmutils-0.16/lib/) I have:

BUILD_STATIC = y
BUILD_SHARED = y

But when building the static test proggie I get:

gcc -D__CPU__=386 -Wall -O1 -m386 -g -D__NO_STRING_INLINES -fno-builtin 
-nostartfiles -nostdlib  -static -o test1-static test1.c libc_stub.o libc.a
libc.a(libc.o): In function `_start':
libc.o(.text+0x4): multiple definition of `_start'
libc_stub.o(.text+0x0): first defined here
collect2: ld returned 1 exit status
make: *** [test1] Error 1

If I comment out STUB_OBJS and remake the static portion, then some of 
the static versions are compiled but output the __libc_banner file which 
reads:
A r e  y ou   s i c k ?

To which I reply yes! :) I would like a tiny libc written in asmutils 
that links statically so as to include some demo-style progs on the 
bootdisk. Am Imissing the point of this libc? Even the shared libraries 
that build correctly are dynamically linked to libNoVersion and GNU libc 
when you ldd them. What's up with that?

Paul.


