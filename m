From: "Ryn" <mattyml@daemons.net>
Subject: SPARC Stack frame organization
Date: Sun, 5 May 2002 22:56:57 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <001901c1f4a9$afbc7b20$0201a8c0@pooh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I am trying to figure out main()s stack frame organization for the code in
[Exhibit 1].  I get the
following when I hit a breakpoint set at main():

Breakpoint 1, 0x10544 in main ()
1: x/i $pc  0x10544 <main+12>:  mov  0x31, %o0

(gdb) x $sp
0xffffffffffbefb30:     0x0000000c

(gdb) x $fp
0xffffffffffbefbc0:     0x00000001

If I subtract the sp from the fp I get:

0xffffffffffbefbc0 (%fp) - 0xffffffffffbefb30 (%sp) = 144 bytes

Which comes out to 144 bytes. When I calculate the stack frame I get:

  64 bytes for register window saving (%l0 - %l7 & %i0 - %i7)
+  4 bytes ptr to struct
+ 24 bytes for 6 arguments
+ 28 7 integers @ 4 bytes each
  --
  120 bytes

I cannot seem to figure out why the stack frame is 144 bytes as opposed
to the 120 bytes calculated above. If you have any thoughts or insight I would
appreciate it.

Thanks a ton,
Ryan

[Exhibit 1]
#include <stdio.h>

int main(int argc, char **argv)
{
        int buf1[6] = { '1' , '2' , '3' , '4' , '5',' '};
        int i = 1;

        myfunc1(i);
}

int myfunc1(int param)
{
        char buf1[6] = "CCCCC";
        int i = 1;

        myfunc2(i);
}

int myfunc2(int param)
{
        char buf1[5] = "EEEEE";
        int i = 1;
}


