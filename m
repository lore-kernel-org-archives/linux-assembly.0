From: Rudolf Marek <MAREKR2@cs.felk.cvut.cz>
Subject: Re: int 16 ?
Date: Fri, 14 Feb 2003 09:07:09 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16688.418822787$1045209913@news.gmane.org>
References: <200302140023.23837.davidkedrosky@rogers.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302140023.23837.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: linux-assembly@vger.kernel.org




> 
> I was told there exists int 0x16, which can be used to read a single character 
> at a time.  Does this interrupt exist in Linux 

no, just use stdin for reading the keyboard, see examples at asmutils 
(linuxassembly.org/asmutils.html) for example in sh.asm or snake.asm

simply: man 2 read
        man 2 open (stdin is already open in your process by default and 
has file desc. number 0)

and mabe man stdin

sys_read STDIN, buff,buff_len 	;<= this is asmutils macro, wich reads 
				;from stdin 

which on linux works this way:

mov eax,   ; service number, dont remember look at 
           ; /usr/src/linux/include/unistd.h
mov ebx,0 ; stdin file descriptor 
mov ecx,buff
mov edx,buff_len
int 0x80


Regards
	Rudolf

