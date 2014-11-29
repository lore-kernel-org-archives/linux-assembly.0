From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: simple hello.asm (NASM) not compile in x64, plz help
Date: Fri, 28 Nov 2014 21:26:56 -0800
Message-ID: <21625.22816.280077.588423@eidolon.muppetlabs.com>
References: <20141128203537.80F63DB6@m0005299.ppops.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20141128203537.80F63DB6@m0005299.ppops.net>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: fsshl@luxmail.com

> 
> ld -s -o heworl heworl.o 
> ld:i386 architecture of input file *.o is incompatible with i386:x86-64 output

You told nasm to create a 32-bit .o file. Tell nasm to create a 64-bit
.o file instead. Use "-f elf64" instead of "-f elf32".

The command "nasm -hf" will display all the valid output formats that
nasm supports.

b
