From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: Displacement def in as
Date: Wed, 22 Nov 2006 16:04:27 -0800
Message-ID: <1164240267.5308.10.camel@ubuntu>
References: <BAY22-F18305A073A5C394A9BB360F5E30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY22-F18305A073A5C394A9BB360F5E30@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A D <a_d_249@hotmail.com>
Cc: linux-assembly@vger.kernel.org

If you are using the gnu assembler, gas, you should
become familiar with the info for it. The command
is
    info as

Go to Machine Dependencies, then i386-Dependent,
then i386-Memory. There you will see that the AT&T
syntax is
    DISP(BASE, INDEX, SCALE)

DISP is an integer. An example is
    movl   $0, -4(%ebp)
which would store 32 bits of zero at the
memory location starting 4 bytes negative
from the address in the ebp register. (This
instruction does not use INDEX or SCALE.)

Linux uses a flat memory model, so you don't
need to worry about the segmentation registers
if you run your program under Linux.


On Wed, 2006-11-22 at 18:44 -0500, A D wrote:
> I am a newbie and i have question. What does
> displacement mean according to segmented
> memory model? Does it mean anything  in terms
> of Segment Descriptor? Thanks.
> 
> Offset = Base + (Index * Scale) + displacement
> 


