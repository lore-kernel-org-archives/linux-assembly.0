From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Segmented or Flat model
Date: Wed, 23 May 2007 22:02:40 -0700
Message-ID: <1179982961.5536.51.camel@ubuntu>
References: <BAY133-F13206F74E0BF11906D203CF5340@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY133-F13206F74E0BF11906D203CF5340@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly <linux-assembly@vger.kernel.org>

First, Brian provided an excellent response while I was composing this.
Perhaps my comments will add to his.

I believe that Brian Raiter was referring to "real mode" segmented
memory. Memory segments in older x86 architectures were limited to 2^20
bytes. The segmentation registers were used to effectively provide the
higher-order part of the address in order to access more memory. Newer
x86 architectures still have "real mode" for backward compatibility.

The memory segmentation used by Linux is separate from the "real mode"
segmentation. The processor is run in "protected mode" where 2^32 bytes
of memory can be accessed. But memory is still logically divided into
segments. For example there is a "text" segment, which is where the code
exists and is read only. The processor provides hardware that allows
Linux to enforce this "read only" policy and prevent you from, say,
writing self-modifying code.

So in the example you give, the integer named "output" will be the
"data" segment and the movl instruction will be in the "text" segment.
As Brian pointed out, the assembler does not know what addresses these
will be located at. You have to run the linker/loader, ld, which figures
out the address of "output" and fills it into the space left by the
assembler in the movl instruction.

By the way, notice that your program stores the _address_ of the
variable in ebx, not the value stored in the variable. It is logically
equivalent to
       leal    output, %ebx
If you wanted the value stored there, you would use
       movl   output, %ebx

If you wanted the address for later use, you might do something like
      movl    $output, %ebx
      movl     (%ebx), %ecx


On Wed, 2007-05-23 at 23:01 -0400, A D wrote:
> First of all thanks for your reply.
> 
> >I need clarification to a particular gnu assembly question. When i
> >write a code:
> >
> >.section .data
> >output:
> >    .int 1
> >
> >.section .text
> >.globl _start
> >_start:
> >    movl $output, %ebx
> >    ....
> >
> >here what type of memory model is used for movl statement(flat or
> >segmented)?
> >
> >
> >>Brian Raiter wrote:
> >>I suppose that depends on your target platform. Since you sent this to
> >>linux-assembly, I'm going to assume that the answer is "flat". For all
> >>practical purposes, there is no "segmented" memory model on 32-bit
> >>x86 linux.
> 
> correct me if i'm wrong. But what I understand are you saying that x86 linux
> doesn't use segmented memory model. Are you sure?(i could be wrong in
> understanding sorry) Because I'm reading the book "Understanding Linux 
> Kernel"
> and the author is saying that linux uses segmented memory model. I wasn't 
> sure
> whether linux uses seg model by default so i asked the question.
> 
> Again thanks.
> 


