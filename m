From: Sameer.Seth@lntinfotech.com
Subject: stack allocation for array
Date: Tue, 3 Dec 2002 09:11:36 +0530
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <OF1EA583A0.C585230F-ON65256C84.0013393E@lntinfotech.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

hi,
    could somebody help me out with this confusion. i wrote a C program and
had an assembly output for that program by giving gcc -S option. the C
program is something like this:

int main()
{
        int  fd[3];
        int pid = 0;
        return 0;
}


+++++++++++++++=+++++++++++++++++++++++=++++++++++++++++++++++++++++++=+++++++++++++++++++++++++++++=+++++++++++++++++++++++==
the .s file created is like this:
        .file   "test_1.c"
        .version        "01.01"
gcc2_compiled.:
.text
        .align 4
.globl main
        .type    main,@function
main:
        pushl   %ebp
        movl    %esp, %ebp
        subl    $40,
%esp-----------------------------------------------------> (why has the
compiler allocated this much space for the
                                          two local variables which would
combinely would have taken 12 bytes)
        movl    $0, -28(%ebp)
        movl    $0, %eax
        leave
        ret
.Lfe1:
        .size    main,.Lfe1-main
        .ident  "GCC: (GNU) 2.96 20000731 (Red Hat Linux 7.1 2.96-81)"
++++++++++++++++++=++++++++++++++++++++++++++++++++++++=++++++++++++++++++++++++++++++++++++++++++++++++++++=+++++++++++++++++++

please somebody let me know why has it done so. is it to keep some debug
information and where can i get toread such protocols followed by compiler.

regards
sameer








