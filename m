From: Ewald Wasscher <ewald.wasscher@pobox.com>
Subject: Problem building httpd
Date: Sat, 17 Aug 2002 18:48:12 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D5E7E4C.1080303@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello all,

I just anxiosly tried to build httpd from the new 0.17 release with cgi 
support enabled. Unfortunately it fails:

bash-2.05a$ make httpd
nasm -w+orphan-labels -w+macro-params -i../inc/ -f bin -D__LINUX__ 
-D__KERNEL__=24 -D__SYSCALL__=__S_KERNEL__ -D__OPTIMIZE__=__O_SIZE__ 
-D__ELF__ -D__ELF_MACROS__ httpd.asm
httpd.asm:282: short jump is out of range
make: *** [httpd] Error 1

As I know next to nothing about assembler I wonder how one should fix 
that (replace jb with jmp?)

Ewald Wasscher

