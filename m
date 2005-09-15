From: Claudio Fontana <sick_soul@yahoo.it>
Subject: Re: How to Use the vm86 System Call
Date: Thu, 15 Sep 2005 12:52:04 -0700 (PDT)
Message-ID: <20050915195205.20599.qmail@web26002.mail.ukl.yahoo.com>
References: <op.sw5ohxaknro9m0@winfuck>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.sw5ohxaknro9m0@winfuck>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Cooper <peajay@funrestraints.com>
Cc: linux-assembly@vger.kernel.org

Hello,

--- Richard Cooper <peajay@funrestraints.com> wrote:

> 
> Does anyone know how to make use of the vm86 system
> call?

I don't, but maybe I can provide some info.

> The man page for it is pretty light on the
> details, and the names of the fields of the
> structures in the header file aren't very
> explanatory.

I hope this info can be of some use:

sh-3.00$ gdb dosemu.bin
(gdb) ptype struct vm86plus_struct

type = struct vm86plus_struct {
    struct vm86_regs regs;
    long unsigned int flags;
    long unsigned int screen_bitmap;
    long unsigned int cpu_type;
    struct revectored_struct int_revectored;
    struct revectored_struct int21_revectored;
    struct vm86plus_info_struct vm86plus;
}

(gdb) ptype struct vm86_regs

type = struct vm86_regs {
    long int ebx;
    long int ecx;
    long int edx;
    long int esi;
    long int edi;
    long int ebp;
    long int eax;
    long int __null_ds;
    long int __null_es;
    long int __null_fs;
    long int __null_gs;
    long int orig_eax;
    long int eip;
    short unsigned int cs;
    short unsigned int __csh;
    long int eflags;
    long int esp;
    short unsigned int ss;
    short unsigned int __ssh;
    short unsigned int es;
    short unsigned int __esh;
    short unsigned int ds;
    short unsigned int __dsh;
    short unsigned int fs;
    short unsigned int __fsh;
    short unsigned int gs;
    short unsigned int __gsh;
}

(gdb) ptype struct revectored_struct 
type = struct revectored_struct {
    long unsigned int __map[8];
}

(gdb) ptype struct vm86plus_info_struct 
type = struct vm86plus_info_struct {
    long unsigned int force_return_for_pic : 1;
    long unsigned int vm86dbg_active : 1;
    long unsigned int vm86dbg_TFpendig : 1;
    long unsigned int unused : 28;
    long unsigned int is_vm86pus : 1;
    unsigned char vm86dbg_intxxtab[32];
}
(gdb) 


You can study the dosemu source code for examples of
use.

However, I would rather use SDL instead.

Bye,

Claudio




		
__________________________________ 
Yahoo! Mail - PC Magazine Editors' Choice 2005 
http://mail.yahoo.com
