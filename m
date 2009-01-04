From: Denis <denisdo@yahoo.com>
Subject: asmutils-0.18 on i86_64
Date: Sat, 3 Jan 2009 21:49:31 -0800 (PST)
Message-ID: <391790.20668.qm@web52609.mail.re2.yahoo.com>
Reply-To: denisdo@yahoo.com
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hi Guys,

Just a quick note which may be useful for someone.

Seems like asmutils "*.inc" macroses use some instructions specific for 32-bit mode only. When someone wants to use asmutils under x86_64 system running 64-bit kernel (like Suse 11.1), one has to compile everything in 32 bit mode and use specific parameters for both NASM and LD for own programs.

In case you want to use asmutils on 64 bit Linux, you may add these lines to your ~/.bashrc (or other profile used). Please replace /home/user1 with your home directory.

--------------------------
# Asmutils with NASM
export NASMENV="-i/home/user1/asmutils-0.18/inc/ -O99v -f elf -D__LINUX__ -D__ELF__ "
export LDEMULATION=elf_i386
--------------------------

Happy new 2009 to everyone,
Have fun! :-0)



      
