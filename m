From: Andrew Haley <aph@redhat.com>
Subject: Re: "Error: suffix or operands invalid for `push'" on 64bit boxes
Date: Thu, 22 Feb 2007 12:17:18 +0000
Message-ID: <17885.35278.556527.153990@zebedee.pink>
References: <35f686220702220350sa328106v6ad9f4a5e42f1dd7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-help-return-26820-gcc-help=m.gmane.org@gcc.gnu.org>
In-Reply-To: <35f686220702220350sa328106v6ad9f4a5e42f1dd7@mail.gmail.com>
List-Id: <linux-assembly.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
Sender: gcc-help-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"
To: Alok kataria <alokkataria1@gmail.com>
Cc: gcc-help@gcc.gnu.org, linux-assembly@vger.kernel.org

[ redirect to gcc-help.  Not appropriate for gcc ]

Alok kataria writes:
 > Hi,
 > 
 > I was trying some inline assembly with  gcc.
 > 
 > Running the assembly program on 64 bit system ( with 64bit gcc
 > version) gives errors of the form
 > 
 > /tmp/cc28kO9v.s: Assembler messages:
 > /tmp/cc28kO9v.s:57: Error: suffix or operands invalid for `push'
 > 
 > But the same thing on 32bit runs perfectly fine.
 > 
 > Here is the detailed report.
 > -----------------------------------------------------
 > Following is the program that i tried :
 > 
 > /* The important part is the temp function */
 > 
 > 
 > #include <stdio.h>
 > 
 > int f1 (int a)
 > {
 >         return a+5;
 > }
 > 
 > void f2 (int lock, int a)
 > {
 >         printf("\nans = %d\n", lock + a);
 > }
 > 
 > 
 > #define temp(lock) \
 >         asm volatile (  " push $0\n\t" \
 >                         " call f1\n\t" \
 >                         " push %0\n\t" \
 >                         " push %%eax\n\t" \
 >                         " call f2\n\t" \
 >                         " pop %%eax\n\t" \
 >                         " pop %%eax\n\t" \
 >                         " pop %%eax": : "r" (lock) : "memory", "%eax");
 > 
 > 
 > int main ()
 > {
 >         int lock = 10;
 >         temp (lock);
 >         return 0;
 > }

> I tried compiling this on a EM64t as well as on Opteron boxes and see
 > the same problem.
 > 
 > Is this a GCC problem, or anything wrong with my program.

x86-64 has a different assembly langauge and a different ABI.

On x86-64 your program should be written more like

        xorl    %%edi, %%edi
        call    f1
        movl    %0, %%edi
        movl    %%eax, %%esi
        call    f2
 
with clobbers where appropriate.

Andrew.
