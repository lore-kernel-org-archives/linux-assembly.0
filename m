From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: Problem with nasm
Date: Sat, 26 Mar 2005 17:15:08 -0500
Message-ID: <4245DEEC.4DB6AD93@comcast.net>
References: <Pine.LNX.4.21.0503261209420.570-100000@hestia> <4245D101.2050206@nation.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: shm@nation.pl
Cc: linux-assembly@vger.kernel.org

Mateusz Kocielski wrote:
> 
> Hello.

Hi Mateusz,

> global _start:

Strictly speaking, this shouldn't have the colon on the end
of it, but that seems to make no difference...

... [Nasm code]
> 080480a0 <_start>:

... [Gas code]
> 08048094 <_start>:

> Any ideas why the same code doesn't work under asm?

Something to do with that start address, I'm guessing. When
I try to duplicate your experiment, I get the same results,
but with a start address of 08048080, which is the
"expected" thing, I think(?). I'm inclined to suspect a
problem with ld, not with Nasm (...but I always think that).
You might try "global _start" without the colon, and maybe
specify "section .text", just to see if it makes any
difference - maybe try specifying "--entry _start" to ld...
That start address is the only thing that looks "funny" to
me...

Best,
Frank
