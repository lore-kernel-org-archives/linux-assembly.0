From: "A D" <a_d_249@hotmail.com>
Subject: Re: Displacement def in as
Date: Wed, 22 Nov 2006 21:56:32 -0500
Message-ID: <BAY22-F219F1D2BC45DF7709BFDD5F5E20@phx.gbl>
References: <1164240267.5308.10.camel@ubuntu>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1164240267.5308.10.camel@ubuntu>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: plantz@sonoma.edu
Cc: linux-assembly@vger.kernel.org

>Robert Plantz  wrote:
>If you are using the gnu assembler, gas, you should
>become familiar with the info for it. The command
>is
>     info as
>
>Go to Machine Dependencies, then i386-Dependent,
>then i386-Memory. There you will see that the AT&T
>syntax is
>     DISP(BASE, INDEX, SCALE)
>
>DISP is an integer. An example is
>     movl   $0, -4(%ebp)
>which would store 32 bits of zero at the
>memory location starting 4 bytes negative
>from the address in the ebp register. (This
>instruction does not use INDEX or SCALE.)
>
>Linux uses a flat memory model, so you don't
>need to worry about the segmentation registers
>if you run your program under Linux.

Thank you Robert Plantz for your wonderful insight.

--STeve

_________________________________________________________________
Off to school, going on a trip, or moving? Windows Live (MSN) Messenger lets 
you stay in touch with friends and family wherever you go. Click here to 
find out how to sign up!  http://www.telusmobility.com/msnxbox/

