From: san@cusat.ac.in
Subject: 32-bit assembler::how to initialize segment registers
Date: Tue, 19 Oct 2004 10:42:21 +0530 (IST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <56005.10.0.0.20.1098162741.squirrel@mail.cusat.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

---------------------------- Original Message ----------------------------
Subject: 32-bit assembler::how to initialize segment registers
From:    "shivam sharma" <shiurya@yahoo.co.in>
Date:    Tue, October 19, 2004 12:07 am
To:      San@cusat.ac.in
--------------------------------------------------------------------------
Hi

am making 32-bit
assembler as project in c under linux platform.
             my problem is how my assembler should
initialize the segment registers.suppose,if user
program format is..........

      .stack[64h]

      .data
     .........
     .........
     .........
      .code
     .........
      .........
     ..........
                   then,on seeing the stack or data or
code how the assembler program should initialize the
segment registers.

thanks in advance
