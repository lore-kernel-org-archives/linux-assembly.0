From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: why linux ELF base address is 0x8048000?
Date: Wed, 4 Feb 2009 18:59:46 -0800
Message-ID: <18826.22050.739005.994893@eidolon.muppetlabs.com>
References: <d6b7c4190902030125w235bca7tdd86b8c94b727e06@mail.gmail.com>
	<73512bc10902032321n863a27by7ac63193dfc4488a@mail.gmail.com>
	<d6b7c4190902041758udbf450bg2972b9d7d89b4979@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d6b7c4190902041758udbf450bg2972b9d7d89b4979@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pei lin <telent998@gmail.com>
Cc: Chris Evans <teknopup@gmail.com>, linux-assembly@vger.kernel.org

>   why linux ELF base address is 0x8048000? we can use ld to change
> the base address or linker script.BUT why default is 0x8048000?
> There must be some reasons or history i don't know.

As far as I can tell, the reason is that this was the address used by
SVR4, which was the first release of Unix to use ELF executables.

The reason that SVR4 chose that particular address is that the stack
top was located at 0x08000000 (growing downward, of course), and then
the area between 0x08000000 and 0x08048000 was reserved for libc and
possibly other system service code.

b
