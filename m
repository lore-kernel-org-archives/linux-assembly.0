From: lx <lx@lxhp.in-berlin.de>
Subject: F4: x86 Linux fig-Forth
Date: Sun, 29 Sep 2002 13:34:09 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020929133409.14f9d4c7.lx@lxhp.in-berlin.de>
Reply-To: abuse@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly <linux-assembly@vger.kernel.org>

hi, all..

i've been experimenting w. a fig-Forth type for assembly w. AS and GASP 
(of "binutils", i586 pc Linux/ELF), and for several features like self 
maintaining unlimited - within the Linux bounds - memory allocation, i.e. 
no 'overflow' of dictionary or stacks space, (trivial) letter case 
independent string handling, etc.

most of which is implemented for ia-32 in att-syntax AS assembly, but also 
supplied w. the hi-level aequivalents, for documentation.

...which resulted to a small but complete forth system, 'fully featured' 
binary of about 32K which, could serve as a reference not only on traditional 
Forth but, for how to persuade the GCC + GASP + AS group of programs to 
fairly comfortably producing something useable:
	source re http://www.lxhp.in-berlin.de/lhpf4.html

best,
	hp

-- 
   >>> pse, reply to : lx -at- lxhp -dot- in-berlin -dot- de <<<
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
