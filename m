From: Lawrence <lawrencio@hotpop.com>
Subject: Re: Using framebuffer device under Linux
Date: Thu, 20 Nov 2003 09:34:40 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FBC1A30.1050409@hotpop.com>
References: <3FBAC74F.9050709@hotpop.com> <20031119220516.DCC11D72E@mluwis17.wiwi.uni-halle.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031119220516.DCC11D72E@mluwis17.wiwi.uni-halle.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Hi Karsten,

Thank you very much for your invaluable adivce. Your assumption is 
right. I've set the color bit to 24bit so that the program fail. After 
setting it back to 8 bit, the program works elegantly.

Next I'll examine the code carefully in order to grasp the assets in it.

Thanks again for all your help.

Best Regards,
Lawrence

Karsten Scheibler ??:

>Hello Lawrence,
>
>  
>
>>Thanks for your suggestion. here is what I got from strace:
>>
>>execve("./fb", ["./fb"], [/* 18 vars */]) = 0
>>ioctl(0, 0x4b3b, 0x80492e8)             = 0
>>ioctl(0, 0x4b3a, 0x1)                   = 0
>>open("/dev/fb0", O_RDWR)                = 3
>>ioctl(3, 0x4600, 0x804931c)             = 0
>>ioctl(3, 0x4604, 0x80492ec)             = 0
>>ioctl(3, 0x4601, 0x80493bc)             = -1 EINVAL (Invalid argument)
>>ioctl(3, 0x4601, 0x804931c)             = 0
>>ioctl(3, 0x4605, 0x80492ec)             = 0
>>ioctl(0, 0x4b3a, 0)                     = 0
>>_exit(1)                                = ?
>>
>>
>>The system call in question seems on setting screen parameters.  But I 
>>don't know how to deal with this.  Could you please give me some hints?
>>    
>>
>
>The fb example code tries to change the colordepth to 8bpp. That brings me to
>the assumption that you use vesafb with another colordepth. vesafb is unable
>to change colordepth after boot. All "real" fb drivers allow that, vesafb
>not, due to BIOS calling limitations after boot. You should
>change your vga= line which is passed to the kernel, to a mode with 8bpp.
>
>If 
>
>cat /proc/fb
>
>outputs something like
>
>0 VESA
>
>then my assumption is right. Otherwise i would be interested in additional
>information about your system (kernelversion etc.).
>
>You may try to execute
>
>fbset
>
>to see your current fb parameters
>
>
>
>karsten
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>


