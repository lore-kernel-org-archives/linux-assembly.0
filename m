From: Mateusz Kocielski <shm@nation.pl>
Subject: Problem with nasm
Date: Sat, 26 Mar 2005 22:15:45 +0100
Message-ID: <4245D101.2050206@nation.pl>
References: <Pine.LNX.4.21.0503261209420.570-100000@hestia>
Reply-To: shm@nation.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0503261209420.570-100000@hestia>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hello.

---

bash-2.05b# cat exit.s
global _start:

_start:
         xor ebx, ebx
         mov eax, 1
         int 80h


$ uname -srp
Linux 2.6.11-gentoo-r3 AMD Duron(tm) Processor

bash-2.05b# nasm -f elf -o exit.o exit.s
bash-2.05b# ld -o exit exit.o
bash-2.05b# ./exit
Naruszenie ochrony pamieci ( seg fault )

bash-2.05b# strace ./exit
execve("./exit", ["./exit"], [/* 45 vars */]) = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++

# objdump -D exit

exit:     file format elf32-i386

Disassembly of section .text:

080480a0 <_start>:
  80480a0:       31 db                   xor    %ebx,%ebx
  80480a2:       b8 01 00 00 00          mov    $0x1,%eax
  80480a7:       cd 80                   int    $0x80
Disassembly of section .comment:

00000000 <.comment>:
    0:   00 54 68 65             add    %dl,0x65(%eax,%ebp,2)
    4:   20 4e 65                and    %cl,0x65(%esi)
    7:   74 77                   je     80 <_start-0x8048020>
    9:   69 64 65 20 41 73 73    imul   $0x65737341,0x20(%ebp,2),%esp
   10:   65
   11:   6d                      insl   (%dx),%es:(%edi)
   12:   62 6c 65 72             bound  %ebp,0x72(%ebp,2)
   16:   20 30                   and    %dh,(%eax)
   18:   2e 39 38                cmp    %edi,%cs:(%eax)
   1b:   2e 33 38                xor    %cs:(%eax),%edi

# objdump -x exit

exit:     file format elf32-i386
exit
architecture: i386, flags 0x00000112:
EXEC_P, HAS_SYMS, D_PAGED
start address 0x080480a0


The same code under as:
bash-2.05b# cat exit.s
.global _start

_start:
         xor %ebx, %ebx
         mov $1, %eax
         int $0x80

bash-2.05b# as -o exit.o exit.s
bash-2.05b# ld -o exit exit.o
bash-2.05b# ./exit
bash-2.05b# strace ./exit
execve("./exit", ["./exit"], [/* 45 vars */]) = 0
_exit(0)

# objdump -D exit

exit:     file format elf32-i386

Disassembly of section .text:

08048094 <_start>:
  8048094:       31 db                   xor    %ebx,%ebx
  8048096:       b8 01 00 00 00          mov    $0x1,%eax
  804809b:       cd 80                   int    $0x80

---

Any ideas why the same code doesn't work under asm?

# nasm -v
NASM version 0.98.38 compiled on Mar 26 2005

( installed from gentoo portage )

i've tried to rebuild nasm but it didn't solve my problem.

Any ideas what's wrong?

Thanks.

-- 
Shm - shm ( at ) irc7 ( dot ) pl
EKG: 2099452  JID: shm@chrome.pl
homepage : http://shm.nation.pl/
