From: Oleg Nesterov <oleg@tv-sign.ru>
Subject: Re: Q: -fpic and $_GLOBAL_OFFSET_TABLE_
Date: Wed, 16 Jul 2003 17:51:10 +0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <E19cmgY-0003jZ-00@mail.tv-sign.ru>
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org, lx@lxhp.in-berlin.de

Hello.

hp <lx () lxhp ! in-berlin ! de> wrote:
>
> Oleg Nesterov am Dienstag, 15. Juli 2003 14:19:
> > Hello.
> >
> > I thought, that &GOT == $_GLOBAL_OFFSET_TABLE_ + .
>						^^^^^^^^^^^^^^^^^^^^^
> thus your GOT would be at a different place whenever fetched at a different 
> address in your code - not very likely...

There is R_386_GOTPC relocation item for _GLOBAL_OFFSET_TABLE_.

Look at this code produced by gcc to load &GOT in ebx:

	call .L3
.L3:
	popl %ebx
	addl $_GLOBAL_OFFSET_TABLE_+[.-.L3],%ebx

So &GOT = .L3 + $_GLOBAL_OFFSET_TABLE_+ . - .L3 = $_GLOBAL_OFFSET_TABLE_+ .

Thank you for response,

Oleg.
