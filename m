From: Karsten Scheibler <asm@mluwis17.wiwi.uni-halle.de>
Subject: Re: Using framebuffer device under Linux
Date: Tue, 18 Nov 2003 22:01:30 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20031118210426.4B7FFD72E@mluwis17.wiwi.uni-halle.de>
References: <3FBA137E.7000108@hotpop.com> <3FBA1A7E.6010405@eprocess.fr> <3FBA2609.8010703@hotpop.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3FBA2609.8010703@hotpop.com>; from lawrencio@hotpop.com on Tue, Nov 18, 2003 at 10:00:41PM +0800
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org
Cc: Lawrence <lawrencio@hotpop.com>

Hello,

> Thanks for your reply. I did some more research after my post, and 
> finally I can initialise the framebuffer under Red Hat 9.
> 
> I must pass something like "vga=788" as the kernel parameter to grub so 
> that it will use /dev/fb0, "vga=ask" will change the mode you gave after 
> boot up, but will immedately shift back to text mode when initialization 
> script start.
> 
> Hoever, the asm program 'fb' still doesn't work...
> 
> Anyway, I'll try to consult the kernel doc you've mentioned.

maybe you could run

strace ./fb 2>log

and send what was written to log.



karsten
