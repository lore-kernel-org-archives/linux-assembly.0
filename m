From: Brian Davidson <bdavids1@gmu.edu>
Subject: Re: Motorola 68HC11
Date: Fri, 20 Jun 2003 18:35:06 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <70F1A651-A36F-11D7-81BD-000393CCB774@gmu.edu>
References: <Pine.LNX.4.44.0306201602250.627-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <Pine.LNX.4.44.0306201602250.627-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Every architecture has its own instruction set -- if you learn C, you 
can write a C program and compile it on any platform with a C compiler. 
  With assembly, you learn a different set of instructions for each 
platform.  There's very little abstraction with assembly; mostly 
nemonics so that you don't have to remember machine code instructions, 
and it takes care of calculating offsets and addresses for you.

Motorola has a bunch of architectures, each with their own instruction 
sets.  Some Motorola chips are RISC (in which case they have fewer 
instructions (in theory)), while others are CISC.  Those are some 
buzzwords you could google on..

Each architecture has a different number of registers, and has its own 
special purpose registers.

Memory addressing also varies greatly - it can be a flat memory space, 
can be segmented, can support virtual memory, memory protection, etc.

The 68HC11 is straightforward - no segmented memory, no memory 
protection or virtual memory.  The address you see is the address you 
get.  Can't get any more straightforward than that.  I think the 68HC11 
is a great way to get started in assembly.  Just realize that when you 
move to another platform you'll have to learn a completely different 
assembly language.  Most of the concepts cary over though, so you'll 
pick up other architectures pretty quickly if you learned the first one 
well.

Brian Davidson

On Friday, June 20, 2003, at 06:04 PM, Fabio Miranda Hamburger wrote:

> Hi, I am taking a subject at university about motorola 68hc11, I would
> like to know What are the major different between asm on motorola or 
> IA-32
> or Sparc?
> What about the asm syntax? registers? addressing?
>
> thanks,
>
> ---
> Fabio Andres Miranda
> Ingenieria de sistemas informaticos
> Universidad Latina - Costa Rica
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

