From: John Rodriguez <jr534@columbia.edu>
Subject: question on linux RESTORE_ALL macro
Date: Thu, 12 Feb 2004 07:46:19 -0500 (EST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.58.0402120744460.23783@mango.cc.columbia.edu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org


Browsing kernel 2.4.20 at
http://lxr.linux.no/source/arch/i386/kernel/entry.S

I stumbled across this section of assembly
I browsed GNU assembly manuals and understand up to line 119. After that
all I know is that lines 119-124 respond to a problem with line 113.

1) What exactly is that problem cause by iret?
2) Why is the stack segment selector copied to ds/es in lines 119-122.
3) What is the meaning of the value 11 pushed onto the stack?
4) Does line 124 freeze the kernel up?  What is exiting?  The exception
   handler?  If so, what does it exit to (i assume not the same as iret)?

112         addl $4,%esp;   \
113 3:      iret;           \
114 .section .fixup,"ax";   \
115 4:      movl $0,(%esp); \
116         jmp 1b;         \
117 5:      movl $0,(%esp); \
118         jmp 2b;         \
119 6:      pushl %ss;      \
120         popl %ds;       \
121         pushl %ss;      \
122         popl %es;       \
123         pushl $11;      \
124         call do_exit;   \
125 .previous;              \

Thanks in advance.
-John
