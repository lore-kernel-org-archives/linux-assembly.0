From: Christian Hildner <christian.hildner@hob.de>
Subject: Re: C structures and gas
Date: Thu, 28 Nov 2002 07:15:59 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3DE5B49F.26B3285F@hob.de>
References: <3DD04E99.5080704@ipeg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Corey Holcomb-Hockin <crsntlvs@ipeg.com>
Cc: linux-assembly@vger.kernel.org

Corey Holcomb-Hockin schrieb:

> What is the best way to access C structures with gas assembly?  I
> haven't gotten any good ideas from looking at assembly generated from C
> code.  It looks like it keeps track of offsets and the size of
> structures on its own.  I would have a hard time keeping track of
> offsets and changing them if the structure changed.
>
> Corey Holcomb-Hockin
>

Have a look how linux does this in the ia64 tree. See
/usr/src/linux/arch/ia64/tools/print_offset.c.
There are three steps:

1. compile print_offsets
2. run print_offsets (creates offsets.h)
3. include offsets.h into *.S

Christian

