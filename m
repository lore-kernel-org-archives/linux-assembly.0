From: TheReader06@comcast.net
Subject: Re: Unable to access memory address.
Date: Fri, 25 Mar 2005 01:57:12 +0000
Message-ID: <032520050157.21649.42436FF80006F972000054912205886014C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Also might want an exit call on the end..  otherwise it'll keep on executing whatever is after the code you load in to memory..  keep reading down a bit in that article, it mentions this and shows you how to do an exit syscall in asm..

	; for the program to properly exit instead of segfaulting right here
	; ( it doesn't seem to like to fall off the end of a program ), call 
	; a sys_exit

	mov	eax,1
	mov	ebx,0
	int	80h

Joshua Roys
