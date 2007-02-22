From: "Alok kataria" <alokkataria1@gmail.com>
Subject: "Error: suffix or operands invalid for `push'" on 64bit boxes
Date: Thu, 22 Feb 2007 17:20:23 +0530
Message-ID: <35f686220702220350sa328106v6ad9f4a5e42f1dd7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=IzZm+HadH1TeLaVoKhDoGaSjjDgM5+4khgyLX7ZeF4K3JaEOyrHvUda48DVHv8s0GuPxtnczTKLbqSjwGcDH5wN4tVqjrpXCBLfcq9KkrXRgpRqYzWXTt3f21O14TRs1AJfUAot10OxlZi8xFsHgPom40X+2mmx7R2ZQXVz2goM=
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: gcc@gcc.gnu.org, linux-assembly@vger.kernel.org

Hi,

I was trying some inline assembly with  gcc.

Running the assembly program on 64 bit system ( with 64bit gcc
version) gives errors of the form

/tmp/cc28kO9v.s: Assembler messages:
/tmp/cc28kO9v.s:57: Error: suffix or operands invalid for `push'

But the same thing on 32bit runs perfectly fine.

Here is the detailed report.
-----------------------------------------------------
Following is the program that i tried :

/* The important part is the temp function */


#include <stdio.h>

int f1 (int a)
{
        return a+5;
}

void f2 (int lock, int a)
{
        printf("\nans = %d\n", lock + a);
}


#define temp(lock) \
        asm volatile (  " push $0\n\t" \
                        " call f1\n\t" \
                        " push %0\n\t" \
                        " push %%eax\n\t" \
                        " call f2\n\t" \
                        " pop %%eax\n\t" \
                        " pop %%eax\n\t" \
                        " pop %%eax": : "r" (lock) : "memory", "%eax");


int main ()
{
        int lock = 10;
        temp (lock);
        return 0;
}
----------------------------------------------------------------------------
This compiles and works fine on a 32 bit system having

$ gcc --version
gcc (GCC) 4.1.1 20061011 (Red Hat 4.1.1-30)
Copyright (C) 2006 Free Software Foundation, Inc.

------------------------------------------------------------------------

But running it on a 64 bit system gives me following errors

$ gcc temp.c
/tmp/cc28kO9v.s: Assembler messages:
/tmp/cc28kO9v.s:57: Error: suffix or operands invalid for `push'
/tmp/cc28kO9v.s:58: Error: suffix or operands invalid for `push'
/tmp/cc28kO9v.s:60: Error: suffix or operands invalid for `pop'
/tmp/cc28kO9v.s:61: Error: suffix or operands invalid for `pop'
/tmp/cc28kO9v.s:62: Error: suffix or operands invalid for `pop'

Gcc version on this box is
$ gcc --version
gcc (GCC) 4.1.0 (SUSE Linux)
Copyright (C) 2006 Free Software Foundation, Inc.

$ file `which gcc`
/usr/bin/gcc: ELF 64-bit LSB executable, AMD x86-64, version 1 (SYSV),
for GNU/Linux 2.6.4, dynamically linked (uses shared libs), for
GNU/Linux 2.6.4, stripped

I tried compiling this on a EM64t as well as on Opteron boxes and see
the same problem.

Is this a GCC problem, or anything wrong with my program.

Please let me know,

Thanks & Regards,
Alok

P.S. Please keep me cc'ed as i am not part of this list.
