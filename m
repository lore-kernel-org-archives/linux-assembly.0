From: Niel A <amerei@gmail.com>
Subject: help with sys_stat
Date: Sat, 28 Jan 2006 15:01:39 +0000
Message-ID: <20060128150139.04fee74e.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

hey guys! it's me again (with another useless program! hehehehe)

actually.. i have two problems.. how to use struc in nasm.. and how to determine if a file is a directory...

i'm totally clueless about this .. so i used struc straightforward in segment. bss based on struct stat in /usr/include/asm/stat.h

segment .bss
struc stat
	.st_dev	resw		1
	-- snip --
endstruc

? but somehow, i think that i should make a struc somewhere at the beginning .. like a prototype of some sort and use it's name in segment .bss intead.

so far, i have a filename in edi and i call stat like ..
	mov eax, 106	; stat
	mov ebx, edi	; file
	mov ecx, stat
	int 80h

any suggestions on this one ? i'm reading asmutil's "rm" alongside making my own program.. but i'm only interested in determining if a given filename is a directory or not. do i also have to deal with trailing slashes in directory names?? 

tidings,
- niel
