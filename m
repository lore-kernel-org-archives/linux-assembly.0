From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Translating nasm boot strap to as
Date: Sat, 19 Mar 2011 16:31:57 -0700
Message-ID: <19845.15597.989485.821403@eidolon.muppetlabs.com>
References: <4D84C23A.2020504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4D84C23A.2020504@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Hilst Selli <danielhilst@gmail.com>
Cc: linux-assembly@vger.kernel.org

> this:
> 
> jmp 07C0h:start
> 
> I try this
> 
> jmp 0x7C0, start

I think what you need is:

    jmp     $0x07C0, $start

Assuming that 0x07C0 is the segment and start is the offset.

If that doesn't work, you may need to use ljmp instead of jmp (it's
been a long time since I've thought about 16-bit assembly.)

> and to fill the file:
> 
> times 510-($-$$)  db  0
> 
> I didn't find any $$ translation in as

$$ just refers to the start of the current section, so I think the
solution there is just to declare your own symbol at the top of the
section, and use that in place of $$.

b
