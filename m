From: peter w krause <wklux@yahoo.co.uk> (by way of peter w krause
	<wklux@yahoo.co.uk>)
Subject: Re: gas jump
Date: Sun, 31 Aug 2003 12:06:37 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200308311206.37056.wklux@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org
Cc: Linux-assembly@mlists.in-berlin.de

Fekete Gabor am Samstag, 30. August 2003 23:46:
> hi
>
> i want to make a relative jump.
> i tried it with "jmp 0x09" and expected it to

the actual displacement is not an argument to <jmp>

> jump to the address that comes 9 bytes after
> this "jmp".
> is it correct?

no.

> i'm asking because when I examined (x/bx) the code with
> gdb it didn't really show any bytes with value 0x09 when
> looking at this jump instruction.

should copile a branch to address stored at location 0x09

correct code would be:
		jmp 1f
	...
1f:


best,
	hp

--
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml

