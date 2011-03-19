From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Translating nasm boot strap to as
Date: Sat, 19 Mar 2011 16:43:23 -0700
Message-ID: <19845.16283.875333.744118@eidolon.muppetlabs.com>
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

> and to fill the file:
> 
> times510-($-$$)  db  0
> 
> I didn't find any $$ translation in as

Actually, in this particular case, a more straightforward solution is
to just assign . a new value, like this:

. = .data + 510

(assuming that this appears in your .data section)

b
