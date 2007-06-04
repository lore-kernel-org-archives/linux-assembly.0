From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: Segment override and lldt instruction
Date: Tue, 5 Jun 2007 01:52:33 +0200
Message-ID: <d93f04c70706041652k3be549bs8140489a8abbe0b6@mail.gmail.com>
References: <BAY133-F19BE8DCF3804887322DF21F52E0@phx.gbl>
	 <465E1AC6.2020906@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=JLGDLo23MdmNhgD1OOK7PUQ60uxWpT2Dw94sK1I7kNitKEBGKRST3ZoMJ1/motTGUg5pPTkMkHe25IAalPNBcAI1RiiollQYnpEmWD9BGzCXd+pqvH1Cq+LIjmleS+1CR7iMrGPmh2QX/C+EYXiHZd1H1734JkHS8Kw3R4Wo4Vg=
In-Reply-To: <465E1AC6.2020906@verizon.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Kotler <fbkotler@verizon.net>
Cc: A D <a_d_249@hotmail.com>, linux-assembly@vger.kernel.org

On 5/31/07, Frank Kotler <fbkotler@verizon.net> wrote:
> A D wrote:
> > Hi! I have couple of questions regarding gnu assembly. I've heard the word
> > segment override. Where segment register can be manually overriden. so
<snip>
> > But I get segmentation fault error. How can i do it without error?
>
> Use a valid selector. You appear to have "heard about" some 16=bit real
> mode stuff that is not true in protected mode. Take a look here:
>
> http://my.execpc.com/~geezer/johnfine/segments.htm

Nice technical discussions ;)

> In "Linux assembly", there is no reason you'd *want* to use a segment
> override, or alter a segment register.

Not while your program and/or data space  fits in 4GB of memory space ;)

Okay, a "perhaps" easier explanation on the differences between
protected and real mode segment registers (Strange I don't recall this
term in SPARC assembly...)

In Realmode, a segment register basically points to the "bottom"/base
of a 2^16 address space. The actuall address is/was calculated as
Segment register*4+register. This does allow for fancy/interesting
wrap around sitautions at the top of memory.

In Protected mode, the Segment Registers are misnommers to be bland,
they should be called Descriptor Table Indeces... ie. the memory
mapping info in inthe Descriptor Table, the Segment REgister just
points to the entry inside the Descriptor table.

-- 
Hendrik Visage
