From: Hendrik Visage <hvjunk@gmail.com>
Subject: Fwd: writing a jump table
Date: Thu, 17 Mar 2011 12:11:31 +0200
Message-ID: <AANLkTikjff6j8EC2_eQC5Rwf1zODdw+1o+PdDOdBzVVT@mail.gmail.com>
References: <4D7FFFDD.5020103@gmail.com>
	<19840.863.574550.774103@eidolon.muppetlabs.com>
	<4D816E2B.2000409@gmail.com>
	<19841.28812.233966.341511@eidolon.muppetlabs.com>
	<4D81713F.8040909@gmail.com>
	<AANLkTinzgyzwN3Zj7bmqw7tDF0QKDSJiJj7MQt7vFx-h@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type;
        bh=5eITc4rlQOKkKdAKY6am75beYMRO8Lz9f5Ep9+qrs0o=;
        b=WdWuXNKaUskvdj7QKeW8iy93FIoSMDjX4ov3jrmJw4TbYLzdScdu9Oc7Qkh+3bObff
         3tfJ65GtrCWPfA0xVLJ6pHCF3O3WO+Nqijo7xO9R+b0Dq8dl+RKlqRSFaLgn6FlEZkyM
         0Cr3B+9kmhRPg10KJJgvTs5c+o827oH0H3Ync=
In-Reply-To: <AANLkTinzgyzwN3Zj7bmqw7tDF0QKDSJiJj7MQt7vFx-h@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux assembly <linux-assembly@vger.kernel.org>

---------- Forwarded message ----------
From: Hendrik Visage <hvjunk@gmail.com>
Date: Thu, Mar 17, 2011 at 9:49 AM
Subject: Re: writing a jump table
To: Nicolas Bock <nicolasbock@gmail.com>
Cc: Brian Raiter <breadbox@muppetlabs.com>, linux-assembly@vger.kernel.org




On Thu, Mar 17, 2011 at 4:26 AM, Nicolas Bock <nicolasbock@gmail.com> wrote:
>
> But how does non-PIC code where it is in memory? When I disassemble the
> non-PIC version, the address space starts at 0 which must mean that the
> linker relocates the code.

non-PIC code would typically start at the start of the address space
for that platform.

>
> Also, labels represent offsets if I
> understand this correctly, which is also a relative address and not an
> absolute. That's what I meant with that I don't fully understand why
> these extra hoops are necessary.

PIC code can be put anywhere in address space. So let's assume a few things:

START_ADDR: The starting point of the platform's address space for
code/data/etc.

LABEL_OFFSET: The offset for that LABEL inside the code/data relative
from 0 for the code/data when just normally assembled.

Now in the non-PIC case, it is "easy" to find the actual place in
address space: START_ADDR + LABEL_OFFSET, and this could be hard coded
during the static linking phase.

But in the PIC case, we also have:

PIC_OFFSET_CODE_SEG_A: The offset from START_ADDR where the RUNTIME
linker put the code for CODE_SEG_A. This is unknown till the code
actually gets executed. Okay, in *nost* cases you would find it is the
same place everytime, for a given piece of compiled code, but never
bargain on that, especially when you have hardened kernels that would
randomly assign address space offsets to frustrate crackers.

Now instead of a fixed calculated START_ADDR+PIC_OFFSET_CODE_SEG_A +
LABEL_OFFSET or compile/link time, we now have to calculate that value
at RUNTIME, as PIC_OFFSET_CODE_SEG_A could be different for each
execution.

That is a layman's description as I understand it, and I definitely
miss some other implementation details, but that is the gist of why
you need those extra hoops for PIC code.



>
> On 03/16/11 20:23, Brian Raiter wrote:
> >> I think I figured it out now. I used gcc to compile PIC for the C
> >> switch statement and checked what it does. I don't fully understand
> >> it to be honest, but it seems to do the job also for non PIC code.
> >
> > Of course -- PIC code just means that the code doesn't assume it knows
> > where it's located in memory, which for a shared-object library is a
> > necessary thing. It does mean the code has to jump through a few more
> > hoops, which is why the compiler doesn't make it the default.
> >
> > b
>
