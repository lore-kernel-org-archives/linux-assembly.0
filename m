From: Lawrence <lawrencio@hotpop.com>
Subject: Re: Using framebuffer device under Linux
Date: Wed, 19 Nov 2003 09:28:47 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FBAC74F.9050709@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi Karsten,

Thanks for your suggestion. here is what I got from strace:

execve("./fb", ["./fb"], [/* 18 vars */]) = 0
ioctl(0, 0x4b3b, 0x80492e8)             = 0
ioctl(0, 0x4b3a, 0x1)                   = 0
open("/dev/fb0", O_RDWR)                = 3
ioctl(3, 0x4600, 0x804931c)             = 0
ioctl(3, 0x4604, 0x80492ec)             = 0
ioctl(3, 0x4601, 0x80493bc)             = -1 EINVAL (Invalid argument)
ioctl(3, 0x4601, 0x804931c)             = 0
ioctl(3, 0x4605, 0x80492ec)             = 0
ioctl(0, 0x4b3a, 0)                     = 0
_exit(1)                                = ?


The system call in question seems on setting screen parameters.  But I 
don't know how to deal with this.  Could you please give me some hints?

Thanks and Regards,
Lawrence


