From: Vince Weaver <vince@deater.net>
Subject: tb_asm, a linux assembly game in 8k
Date: Mon, 24 Mar 2003 11:11:37 -0500 (EST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0303241106150.3908-100000@pianoman.cluster.toy>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello,

Tired of bloated video games that require extravagant hardware?
Want a game on your rescue boot disk but can never find room?

Announcing "tb_asm" the fast-paced space game that fits in under 8k.

Hand-written in x86 assembly language, the game requires _no_
external libraries, not even glibc.  8k standalone [plus the Linux Kernel].

[Note... a PPC version is underway, but due to immediate time constraints
will not be done until mid April].

The game plays best in text-mode.  [CTRL-ALT-F1 for those of you in X].
It will work in an xterm, but with degraded graphics and no sound.
Also, it only works under Linux as far as I know.

It has to be seen to be believed.  Download it today:

http://www.deater.net/weave/vmwprod/tb1/tb_asm.html

Also, while in disk-saving mode, check out linux_logo in under 1k:

http://www.deater.net/weave/vmwprod/asm/ll.html


Thanks to: John Clemens (for the initial idea)
           Stephan Walter (for getting me interested in size
                           optimization with "ll")
           Brian Raiter (for sstrip)


Vince

-- 
/* Vince Weaver  --  vince@deater.net  --  http://www.deater.net/weave */

main(){char O,o[66]="|\n\\/_  ",*I=o+7,l[]="B!FhhBHCWE9C?cJFKET$+h'Iq*chT"
,i=0,_;while(_=l[i++])for(O=0;O++<_>>5;)*I=*(I++-(_&31));*I=0;puts(o+5);}

