From: Lawrence <law@cbf.chinese2000.net>
Subject: how to use linux system call in cross compiling environment
Date: Wed, 17 Nov 2004 16:39:06 +0800
Message-ID: <419B0E2A.4090003@cbf.chinese2000.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi all,

I'm figuring out the linux-arm assembly right now. I use the GNU ARM
toolchain 3.4.1 provided by www.gnuarm.com on my x86 Linux hosts.

I've successfully assembled and linked the following code:

@filename: hello.s

.text
        .align  2
        .global _start
_start:
        adr     r1, msg         @ address
        mov     r0, #1          @ stdout
        mov     r2, #13         @ length
        swi     #0x900004       @ sys_write

        mov     r0, #0
        swi     #0x900001       @ sys_exit

        .align  2
msg:
        .asciz  "hello, world\n"

the commands I used are as follows:

arm-elf-as -gdwarf2 -o hello.o hello.s
arm-elf-ld -o hello hello.o

When I run the program as "arm-elf-run hello", I got the reply sim:
unknown SWI encountered - 900004 - ignoring. I got the same result when
debugging the program with insight and gdb.

I would like to know if there is a way to use the arm linux system call
under such simulation environment. Thanks.

Regards,
Lawrence


