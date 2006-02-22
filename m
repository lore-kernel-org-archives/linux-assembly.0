From: Thiago Silva <thiago.silva@kdemail.net>
Subject: nasm -f bin / Elf format
Date: Wed, 22 Feb 2006 21:26:57 +0000
Message-ID: <200602222126.57346.thiago.silva@kdemail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hello all,
Currently I've been working on creating "bin" executables with nasm using the 
template given in the article "A Whirlwind Tutorial on Creating Really Teensy 
ELF Executables for Linux".

Working gradualy, I tried to modify some data in a .data section, and got a  
segmentation fault. Is that because there isn't a section header table with 
an entry indicating that the .data section is writable? If yes, is it 
possible to create the section header table by hand with the same ease as 
creating the elf header? I'm having difficulties to do it and I'm still 
learning my ways with the elf format, so, appreciate any help.

Thanks
-- 
+Thiago Silva
