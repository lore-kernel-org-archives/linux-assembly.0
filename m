From: Timo Lindfors <timo.lindfors@kolumbus.fi>
Subject: asmutils' init.asm and uml
Date: Tue, 4 Nov 2003 20:00:19 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20031104180019.GA16891@sauna.l.org>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org
Cc: m.van.der.honing@supermail.nl

Hi,

I recently had a struggle getting asmutils' init.asm run under
user-mode-linux. After googling around I noticed a post describing more
or less the same problem on linux-assembly at
http://marc.theaimsgroup.com/?l=linux-assembly&m=104217914416500&w=2
Is this still a mystery?

[I cc this to m.van.der.honing@supermail.nl just in case he is not
subscribed anymore and is still interested.]

Here's what I got while using

root filesystem
 http://prdownloads.sourceforge.net/user-mode-linux/Debian-3.0r0.ext2.bz2

asmutils
 http://protu.it.helsinki.fi/~lindi/init.asm
 or http://linuxassembly.org/asmutils/asmutils-0.17.tar.gz

kernel 2.4.18-17um
 http://protu.it.helsinki.fi/~lindi/linux-debug.config

GNU gdb 2002-04-01-cvs

(gdb) x/4i $eip
0x804809c:      test   %eax,%eax
0x804809e:      js     0x804808e
0x80480a0:      xor    %ebp,%ebp
0x80480a2:      inc    %ebp
(gdb) x/4i $eip-30
0x804807e:      xor    %ebp,%ebp
0x8048080:      inc    %ebp
0x8048081:      call   0x80480bb
0x8048086:      cmp    $0x4,%ebp
(gdb) break *0x804807e
Breakpoint 1 at 0x804807e
(gdb) jump *0x804807e
Continuing at 0x804807e.

Breakpoint 1, 0x0804807e in ?? ()
(gdb) x/4i $eip
0x804807e:      xor    %ebp,%ebp
0x8048080:      inc    %ebp
0x8048081:      call   0x80480bb
0x8048086:      cmp    $0x4,%ebp
(gdb) si
0x08048080 in ?? ()
(gdb) 
0x08048081 in ?? ()
(gdb) 
0x080480bb in ?? ()
(gdb) x/4i $eip
0x80480bb:      mov    %ebp,%eax
0x80480bd:      cmp    $0x9,%al
0x80480bf:      jbe    0x80480c3
0x80480c1:      mov    $0x9,%al
(gdb) si
0x080480bd in ?? ()
(gdb) 
0x080480bf in ?? ()
(gdb) 
0x080480c3 in ?? ()
(gdb) x/4i $eip
0x80480c3:      add    $0x30,%al
0x80480c5:      mov    %al,0x8048210
0x80480ca:      push   $0x2
0x80480cc:      pop    %ecx
(gdb) si
0x080480c5 in ?? ()
(gdb) 
0x080480ca in ?? ()
(gdb) 
0x080480cc in ?? ()
(gdb) x/4i $eip
0x80480cc:      pop    %ecx
0x80480cd:      mov    $0x8048208,%ebx
0x80480d2:      push   $0x5
0x80480d4:      pop    %eax
(gdb) x/20i $eip
0x80480cc:      pop    %ecx
0x80480cd:      mov    $0x8048208,%ebx
0x80480d2:      push   $0x5
0x80480d4:      pop    %eax
0x80480d5:      int    $0x80
0x80480d7:      test   %eax,%eax
0x80480d9:      js     0x80481c0
0x80480df:      mov    %eax,0x8048224
0x80480e4:      mov    %eax,%ebx
0x80480e6:      xor    %ecx,%ecx
0x80480e8:      push   $0x3f
0x80480ea:      pop    %eax
0x80480eb:      int    $0x80
0x80480ed:      push   $0x1
0x80480ef:      pop    %ecx
0x80480f0:      mov    0x8048224,%ebx
0x80480f6:      push   $0x3f
0x80480f8:      pop    %eax
0x80480f9:      int    $0x80
0x80480fb:      push   $0x2
(gdb) si
0x080480cd in ?? ()
(gdb) 
0x080480d2 in ?? ()
(gdb) 
0x080480d4 in ?? ()
(gdb) 
0x080480d5 in ?? ()
(gdb) printf "%d %s %d %d %d", $eax, $ebx, $ecx, $edx, $ebp
5 /dev/tty1 2 0 1(gdb) x/1i $eip         <-- open("/dev/tty1", O_RD
0x80480d5:      int    $0x80
(gdb) si
0x080480d9 in ?? ()
(gdb) printf "%d %s %d %d %d", $eax, $ebx, $ecx, $edx, $ebp
-13 /dev/tty1 2 0 1(gdb)


/usr/include/asm/errno.h has

#define EACCES          13      /* Permission denied */

So it seems to me that init.asm is getting permission denied while
trying to open /dev/tty1. However, permissions seem to be ok:

crw-------    1 root     tty        4,   1 Jul 23  2002 mnt/dev/tty1

What could cause EACCESS here?
Also, any ideas on how to debug this further?


best regards,
Timo Lindfors
