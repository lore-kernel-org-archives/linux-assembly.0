From: glburt@comcast.net
Subject: gdb help
Date: Sat, 21 Feb 2004 17:36:33 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <022120041736.4481.4a77@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="NextPart_Webmail_9m3u9jl4l_4481_1077384993"
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org


--NextPart_Webmail_9m3u9jl4l_4481_1077384993
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

I am getting different results when I use gdb at home and at school. It is
the same version of gdb at both places, however the version of nasm
is different:  

school is 0.98.19
home   is 0.98.38

I don't know what that would make a difference, though.

I have searched for a config file, but don't know what file to look for,
saw nothing interesting based on file name.

I want to have the program step through one instruction at a time and
display the next line of code to be executed.

I save the two versions and included them in the attachment.

Any help would be greatly appreciated.

Thanks.


Gary



--NextPart_Webmail_9m3u9jl4l_4481_1077384993
Content-Type: application/octet-stream; name="gdb_results"
Content-Transfer-Encoding: 7bit

Linux server at UMBC


test1[102]: cat Makefile
test1a : test1a.o
        gcc  -o test1a test1a.o
test1a.o : test1a.asm
        nasm -l test1a.lst -g -f elf test1a.asm
clean :
        rm test1a test1a.o test1a.lst test1a.asm~
test1[103]: make
nasm -l test1a.lst -g -f elf test1a.asm
gcc  -o test1a test1a.o
test1[104]: gdb test1a
GNU gdb Red Hat Linux (5.3post-0.20021129.18rh)
Copyright 2003 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i386-redhat-linux-gnu"...
(gdb) break *main
Breakpoint 1 at 0x8048420
(gdb) run
Starting program: /tmp_mnt/ftp/pub/WWW/courses/undergraduate/CMSC313/spring04/burt_katz/test1/test1a

Breakpoint 1, 0x08048420 in main ()
(gdb) s
Single stepping until exit from function main,
which has no line number information.

Program exited normally.


==================================================================

Linux at home



[~/courses/umbc/CMSC313/spring04/test1]$ make
nasm -l test1a.lst -g -f elf test1a.asm
gcc  -o test1a test1a.o
[~/courses/umbc/CMSC313/spring04/test1]$ gdb test1a
GNU gdb Red Hat Linux (5.3post-0.20021129.18rh)
Copyright 2003 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i386-redhat-linux-gnu"...
(gdb) break *main
Breakpoint 1 at 0x8048300: file test1a.asm, line 40.
(gdb) run
Starting program: /home/burt/courses/umbc/CMSC313/spring04/test1/test1a

Breakpoint 1, main () at test1a.asm:40
40              mov     eax, [ A ]              ; eax ____________________________
(gdb) s
42              add     eax, 32                 ; eax ____________________________
(gdb)

--NextPart_Webmail_9m3u9jl4l_4481_1077384993--
