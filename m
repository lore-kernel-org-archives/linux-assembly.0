From: hp <hp@lxhp.in-berlin.de>
Subject: Re:
Date: Tue, 21 Jan 2003 06:16:36 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200301210624.h0L6ORmo022089@hirsch.in-berlin.de>
References: <20030118052653.22606.qmail@webmail16.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20030118052653.22606.qmail@webmail16.rediffmail.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: n mishra <mishra_nn@rediffmail.com>, linux-assembly@vger.kernel.org

for instance, <man ld86>

	...
   -N	Create  a  native Linux OMAGIC output file. 
	If the contents are i386 code the binary can be either linked by
              GCC or executed by linux. If the -z option is also included the 
	linker can generate a QMAGIC executable.
	...

never tried, myself, though.


best,
	hp
---
n  mishra am Samstag, 18. Januar 2003 05:26:
> Hi all!
> This sounds slightly silly but is it possible to link the .obj
> files from one compiler to another.I have been working with bcc
> and gcc and was wondering if it was possible to link files created
> in one compiler for eg bcc to the other for eg gcc.
> I tried to create a obj file in bcc and load it using ld but it
> said the file format was not recognisable.
> Also how do you execute a binary file created using as86 and the
> -b option.
> Thanks in advance.
> mishra.
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de
  >> clf -at- lxhp -dot- in-berlin -dot- de <<
