From: "eric lin" <fsshl@luxmail.com>
Subject: simple hello.asm (NASM) not compile in x64, plz help
Date: Fri, 28 Nov 2014 20:35:37 -0800
Message-ID: <20141128203537.80F63DB6@m0005299.ppops.net>
Reply-To: <fsshl@luxmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hello:
I copied a simple hello.asm  (NASM) assembly program from 
www.tldp.org/HOWTO/html_single/Assembly-HOWTO/
try to compile and run on my linux 64(ubuntu14.04), but I got errors:

-------------------------------------

ld -s -o heworl heworl.o 
ld:i386 architecture of input file *.o is incompatible with i386:x86-64 output
-------------------------------------------------
please help,(how to make it compile and run on my 64 platform rather than ask me switch to 32 bit platform),thanks a lot ina dvance, eric

_____________________________________________________________
Luxmail.com
