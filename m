From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: Using framebuffer device under Linux
Date: Tue, 18 Nov 2003 14:11:26 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FBA1A7E.6010405@eprocess.fr>
References: <3FBA137E.7000108@hotpop.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3FBA137E.7000108@hotpop.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lawrence <lawrencio@hotpop.com>
Cc: linux-assembly@vger.kernel.org

(re)Hi Lawrence! ;)

I don't know about the FB managment in linuxassembly, but here is some 
points you can have a look regarding FB:
- kernel may have support for FB already compiled in (see the kernel 
.config, and check that FB_ options are correctly setted)
- if kernel has the FB support, have a look at the kernel parameters 
(append="video=something" in your lilo.conf)
- you can also have a look at /var/log/messages
- to see if FB is already working, have a look at the '/proc'  (mount 
/proc;cat /proc/fb)
- to access FB, open/write to /dev/fb0
- to use kernel driver fb routines, use ioctl to /dev/fb0
- read documentation about the driver in /usr/src/linux/Documentation 
(if the kernel sources are installed, and if the kernel you run was 
compiled there)
- you can use the VESA driver (less optimised than a specific FB driver, 
but often work). Use the "vga=mode" parameter in your lilo to activate it.


To access the frame buffer as a large memory, you must use *mmap* in C. 
I don't know how it may be called in assembly under Linux, but this may 
be a start for you.
mmap will be used to map the device /dev/fb0 into memory. So, you may 
access the FB with assembly mov, very easily, as a 'standard' memory region.


Regards,
Fred


Lawrence wrote:

>Hi All,
>
>I am planning to do graphic with asm under Linux without X11.  I am try
>to use framebuffer as the "drawing plane".
>
>I've reached the article entitled "Using the framebuffer device under
>Linux" within http://linuxassembly.org and I've extracted and compiled
>fb.n according to the instruction.  However, when I run "fb" under the
>console in RH9, I only got a refresh and then back to the text console.
>
>I've tried fb under the installation environment of Debian 3.0, with I
>thought it is already in framebuffer mode, but still got a failure.
>
>
>I've tried ald fb, but when it is going to switch to framebuffer mode,
>Linux squeeze and I have to telnet into my linux box using another
>machine and issue a reboot...
>
>I can successfully run "leaves" under a-linux however, but I don't know
>how to put fb under a-linux so as to see if it works, as there seems no
>way to mount a floppy or access ethernet under a-linux.
>
>Would anyone be so kind as to tell me how could I access linux
>framebuffer correcely using assembly, or point me out the forgettable
>steps in order to run 'fb' successfully?
>
>my 'nasm -r' command spit out:
>
>NASM version 0.98.22 compiled on Sep 19 2003
>
>Thanks
>Lawrence
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>


