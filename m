From: G Anna <drguruolai@eth.net>
Subject: ld error
Date: 27 May 2002 12:49:44 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <m3r8jygir3.fsf@wobble.eth.net>
Reply-To: linux-assembly@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Dear All,

I am working through 'Linux Assembly "Hello World" Tutorial, CS 200'
by Bjorn Chambless.  But I am unable to compile the program given in
that.  Kindly help me. 

For your convenience I have included the assembly program at the end
of this mail.

average.s is the relevant assembly program file.

$ as -a --gstabs -o average.o average.s

$ ld -m elf_i386 -static /usr/lib/crt1.o /usr/lib/crti.o -lc average.o
                              /usr/lib/crtn.o

/usr/lib/libc.a(strtoll.o): In function `__strtoll_internal':
/usr/src/bs/BUILD/glibc-2.2.2/stdlib/../sysdeps/generic/strtol.c:386: undefined reference to `__udivdi3'
/usr/src/bs/BUILD/glibc-2.2.2/stdlib/../sysdeps/generic/strtol.c:387: undefined reference to `__umoddi3'
/usr/lib/libc.a(strtoull.o): In function `__strtoull_internal':
/usr/src/bs/BUILD/glibc-2.2.2/stdlib/../sysdeps/generic/strtol.c:386: undefined reference to `__udivdi3'
/usr/src/bs/BUILD/glibc-2.2.2/stdlib/../sysdeps/generic/strtol.c:387: undefined reference to `__umoddi3'

$ cat average.s
.data   

	.type hi_temp,@object  
        .size hi_temp,1       
hi_temp:
        .byte 0x92      

        .type lo_temp,@object
        .size lo_temp,1
lo_temp:
        .byte 0x52

        .type av_temp,@object
        .size av_temp,1
av_temp:
        .byte 0

.text
        .align 4        
.globl main            
        .type main,@function    

main:
        pushl %ebp      
        movl %esp,%ebp 
        movb hi_temp,%al
        addb lo_temp,%al
        movb $0,%ah
        adcb $0,%ah
        movb $2,%bl
        idivb %bl
        movb %al,av_temp
        leave           
        ret            

$ as --version
GNU assembler 2.10.91
Copyright 2001 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
This assembler was configured for a target of `i386-redhat-linux'.

$ ld --version
GNU ld 2.10.91
Copyright 2001 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
  Supported emulations:
   elf_i386
   i386linux
   elf_i386_glibc21

$ gcc --version
2.96

$ uname -a
Linux wobble 2.4.16 #8 Tue May 14 14:15:58 IST 2002 i686 unknown

$ cat /etc/issue

Red Hat Linux release 7.1 (Seawolf)
Kernel 2.4.16 on an i686

Hope somebody will help me with this.

Thank you.

Cheers,
anna

-- 

(15) I will never employ any device with a digital countdown. If I find
     that  such  a  device  is absolutely unavoidable, I will set it to
     activate when the counter reaches 117 and the hero is just putting
     his plan into operation. - Peter Anspach in "The Top 100 Things 
     I'd Do If I Ever Became An Evil Overlord"

                                            http://www.eviloverlord.com


