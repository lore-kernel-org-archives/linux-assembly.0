From: Karsten Scheibler <asm@mluwis17.wiwi.uni-halle.de>
Subject: Re: Using framebuffer device under Linux
Date: Wed, 19 Nov 2003 23:03:29 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20031119220516.DCC11D72E@mluwis17.wiwi.uni-halle.de>
References: <3FBAC74F.9050709@hotpop.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3FBAC74F.9050709@hotpop.com>; from lawrencio@hotpop.com on Wed, Nov 19, 2003 at 09:28:47AM +0800
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

Hello Lawrence,

> Thanks for your suggestion. here is what I got from strace:
> 
> execve("./fb", ["./fb"], [/* 18 vars */]) = 0
> ioctl(0, 0x4b3b, 0x80492e8)             = 0
> ioctl(0, 0x4b3a, 0x1)                   = 0
> open("/dev/fb0", O_RDWR)                = 3
> ioctl(3, 0x4600, 0x804931c)             = 0
> ioctl(3, 0x4604, 0x80492ec)             = 0
> ioctl(3, 0x4601, 0x80493bc)             = -1 EINVAL (Invalid argument)
> ioctl(3, 0x4601, 0x804931c)             = 0
> ioctl(3, 0x4605, 0x80492ec)             = 0
> ioctl(0, 0x4b3a, 0)                     = 0
> _exit(1)                                = ?
> 
> 
> The system call in question seems on setting screen parameters.  But I 
> don't know how to deal with this.  Could you please give me some hints?

The fb example code tries to change the colordepth to 8bpp. That brings me to
the assumption that you use vesafb with another colordepth. vesafb is unable
to change colordepth after boot. All "real" fb drivers allow that, vesafb
not, due to BIOS calling limitations after boot. You should
change your vga= line which is passed to the kernel, to a mode with 8bpp.

If 

cat /proc/fb

outputs something like

0 VESA

then my assumption is right. Otherwise i would be interested in additional
information about your system (kernelversion etc.).

You may try to execute

fbset

to see your current fb parameters



karsten
