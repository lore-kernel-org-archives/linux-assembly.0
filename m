From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: I need little help..
Date: Thu, 25 Mar 2004 16:23:33 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <16483.30725.499924.145613@eidolon.muppetlabs.com>
References: <S263818AbUCZAAL/20040326000042Z+961@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <S263818AbUCZAAL/20040326000042Z+961@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Hi again.. I wanted to ask you how to write (in gas style) program
> which gets the user id (using syscall 24) and then printing it to
> the screen (NOT using the printf function , but using syscall 4)...

If you refuse to use printf, then you'll need to translate the number
into the ASCII decimal representation yourself. (I assume that if you
can't use printf(), then sprintf() is also off-limits.)

Once you've done that, you can just output the string directly.

	; itoa:
	; When called, the number to transform is in eax, and a
	; pointer to the buffer to receive the string is in edi.
	; Upon return, itoa leaves the length of the string in eax.

	mov	eax, number
	mov	edi, buffer
	call	itoa

	; now display the string using the write syscall.

	mov	edx, eax
	mov	ecx, buffer
	mov	ebx, FILENO_STDOUT
	mov	eax, 4
	int	0x80

If you don't want to use sprintf(), then you should really try to
write itoa yourself. It's a classic job-interview question, and one
that every hacker ought to try to write themselves.

b
