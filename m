From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: ld unresolved symbols
Date: Fri, 7 Nov 2003 15:26:31 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311071526.32007.wklux@yahoo.co.uk>
References: <Law9-F80KiupllcUPl4000104d2@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law9-F80KiupllcUPl4000104d2@hotmail.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Roberts <v3ct0r99@hotmail.com>, linux-assembly@vger.kernel.org

Jason Roberts am Thursday 06 November 2003 19:21:
> Hi all,
> I was trying to implement some smc--- someone Maik ? suggested using
> mprotect
> to get write acces to code seg. Anyways, nasm will assemble but linker
> complains:
>
> smc.o(.text+0x64): In function `protect':
> : undefined reference to `_mprotect'
>
> I compiled like this:
> nasm -f elf -i/usr/include/sys smc.asm
> ld -s smc.o
>
> any help would be appreciated...
> I dont want to wade through 85+ pages of dense reading to find the right
> 'switch' -- I do have a life besides code bashing:)

you expect your readers to do that for you?
where do you assume your label '_mprotect' being?

> Thanks
> JR

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<

