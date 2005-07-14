From: "Vikas" <vikas.g@ap.sony.com>
Subject: arm assembley division with integer not in the the power of 2  problem
Date: Thu, 14 Jul 2005 09:57:35 +0530
Message-ID: <GOEALLDEHIHLBCJFMCOOCECGCBAA.vikas.g@ap.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I am having a very strange problem
When I try to divide a integer by any integer constant ...in it's .s file
compiler is putting some long value at it's place what 's that ...
From where it is coming
Following is the .c program
#include<stdio.h>
int main(){
int a;
a=6;
a=a/6;
printf(" %d ",a );
}

with Croos building on arm it's .s file look like this

.file   "test7.c"
        .section        .rodata
        .align  2
.LC0:
        .ascii  " %d \000"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        @ args = 0, pretend = 0, frame = 4
        @ frame_needed = 1, uses_anonymous_args = 0
        mov     ip, sp
        stmfd   sp!, {fp, ip, lr, pc}
        sub     fp, ip, #4
        sub     sp, sp, #4
        mov     r3, #6
        str     r3, [fp, #-16]
        ldr     r2, [fp, #-16]
        ldr     r3, .L2
        smull   r0, r1, r3, r2
        mov     r3, r2, asr #31
        rsb     r3, r3, r1
        str     r3, [fp, #-16]
        ldr     r0, .L2+4
        ldr     r1, [fp, #-16]
        bl      printf
        mov     r0, r3
        ldmfd   sp, {r3, fp, sp, pc}
.L3:
        .align  2
.L2:
        .word   715827883			//From where this value is coming If I divide it
by 10 it is 1717986919
        .size   main, .-main
        .ident  "GCC: (GNU) 3.4.3"


Can any one give me the solution

Vikas



