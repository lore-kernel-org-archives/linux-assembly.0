From: Mateusz Srebrny <m.srebrny@students.mimuw.edu.pl>
Subject: linking with ld
Date: Sun, 15 Sep 2002 04:57:23 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D83F713.4860A455@students.mimuw.edu.pl>
References: <4.3.2.7.2.20020914112556.00bdb340@mail.ciudad.com.ar> <20020914225123.48cbc74e.lx@lxhp.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,

I have question about ld.
Precisely: 
I have an ELF object (produced by nasm) defining global procedure named
start.
I want to link it with object made by 'gcc -c' on file loking like this:

#include <stdio.h>

extern void start(void);

int main() {
  start();
  return 0;
}


I tried 'ld main.o start.o -o main -lc'...
it complained sth about not defining _start label, and then refused to
execute main file (which was produced despite ld warnings)...

I wanted to do it with ld, 'couse I thought that linker is to link
things...
Of course linking it with gcc works, but again I thought that compiler
is to compile things to objects...

and the info for ld doesn't offer help in the matter... (at least I
don't see it there)

I would be grateful for your help...
	Mateusz Srebrny

PS the question "why do I want to link a nasm object with a C one?" is
very difficult to answer... i just have to do it...


