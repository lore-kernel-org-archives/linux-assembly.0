From: "Randall Hyde" <aoax86@earthlink.net>
Subject: Re: C structures and gas
Date: Mon, 11 Nov 2002 21:56:52 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <002a01c28a10$4c418f70$6701a8c0@rhyde>
References: <3DD04E99.5080704@ipeg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Corey Holcomb-Hockin <crsntlvs@ipeg.com>, linux-assembly@vger.kernel.org

Well, the best way to do it in Gas is to use HLA and have
HLA generate the Gas code for you :-)
Seriously, though, Gas doesn't have much in the way of
abstract data typing capabilities.  If you want to move
beyond the minimal features available in Gas or NASM,
you're a prime candidate to learn assembly under HLA
(the High Level Assembler).  Not only does HLA support
records (structures), unions, and classes, but it provides
some very flexible options for controlling the alignment of
objects within the structures so that your assembly structs
can be made compatible with just about any compiler
out there (C or otherwise).
You can check out HLA at http://webster.cs.ucr.edu
Randy Hyde
----- Original Message ----- 
From: "Corey Holcomb-Hockin" <crsntlvs@ipeg.com>
To: <linux-assembly@vger.kernel.org>
Sent: Monday, November 11, 2002 4:43 PM
Subject: C structures and gas


> What is the best way to access C structures with gas assembly?  I 
> haven't gotten any good ideas from looking at assembly generated from C 
> code.  It looks like it keeps track of offsets and the size of 
> structures on its own.  I would have a hard time keeping track of 
> offsets and changing them if the structure changed.
> 
> Corey Holcomb-Hockin
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

