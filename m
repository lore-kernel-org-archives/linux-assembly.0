From: Scott Lanning <slanning@theworld.com>
Subject: Re: C structures and gas
Date: Mon, 11 Nov 2002 21:51:23 -0500
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.40.0211112142130.75755598-100000@shell01.TheWorld.com>
References: <3DD04E99.5080704@ipeg.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3DD04E99.5080704@ipeg.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Holcomb-Hockin <crsntlvs@ipeg.com>
Cc: linux-assembly@vger.kernel.org

On Mon, 11 Nov 2002, Corey Holcomb-Hockin wrote:
> What is the best way to access C structures with gas assembly?  I
> haven't gotten any good ideas from looking at assembly generated from C
> code.  It looks like it keeps track of offsets and the size of
> structures on its own.  I would have a hard time keeping track of
> offsets and changing them if the structure changed.

Yes. The way I did it, I use constants and "chain" them
one after another. The more constants the better (replace even
the numbers 0, 2, 4 below with constants). For example,

SIZEOF_SA = 16

SA = -SIZEOF_SA
SA_SIN_FAMILY = SA + 0
SA_SIN_PORT = SA_SIN_FAMILY + 2
# etc...

# always start the next variable declared on the stack based on
# the beginning of the previous one
SOCKET_ARGS = SA - 3*4
SOCKET_ARG0 = SOCKET_ARGS
SOCKET_ARG1 = SOCKET_ARG0 + 4
# etc..

# set STACK_TOP to the last variable
STACK_TOP = SOCKET_ARGS

# data here...

_start:
        // setup stack...
        pushl %ebp
        movl %esp, %ebp
        addl $STACK_TOP, %esp

# ...

