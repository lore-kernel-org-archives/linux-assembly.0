From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: appending \n using registers
Date: Sun, 2 Nov 2003 19:15:37 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311021915.37648.wklux@yahoo.co.uk>
References: <Law9-F53io7W2bLeb1X0000f7f4@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law9-F53io7W2bLeb1X0000f7f4@hotmail.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Roberts <v3ct0r99@hotmail.com>, linux-assembly@vger.kernel.org

Jason Roberts am Sunday 02 November 2003 02:12:
> Hi all---
> I have this problem where I want to append a newline to  a string.
> I implemented a stack version and it works fine-- just push the \n
> sequence,push the string
> and pass off to kernel write function. Now I want to do the same thing but
> through regs--
> not working.

where/what is your buffer? (2nd example)

> Also a concern of mine is the need to specify a 16 bit reg destination
> operand for a 2 byte move.

	('as')							('nasm')
	movw ax,dest					mov ax,[word dest]

> Obviously, using mov eax,src implies a 4 byte move -- is there any way to
> 'force' a 1 or 2 byte move
> into a 32-bit reg. I just want my code to look cleaner and avoid mixing
> 32-bit and 16-bit regs.

	-???-

	movzwl; movswl					movszw, movsw + destn size spec.
copies 16bits, sero or sign extended into 32bit location


hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<

