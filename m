From: fmarmond@eprocess.fr
Subject: Re: Using asm to develop GUI under framebuffer environment
Date: Sat, 28 Feb 2004 16:26:39 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1077981999.4040b32fb1541@intranet.eprocess.fr>
References: <403C0176.6080300@hotpop.com> <403DA923.3000908@eprocess.fr> <403FF536.1080807@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <403FF536.1080807@hotpop.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lawrence <lawrencio@hotpop.com>
Cc: linux-assembly@vger.kernel.org

Hi Lawrence, 
telnet is a 'unsecure' 'old' way of connecting to a remote host. 
I guess you are at home, so security is not the priority, and you are using 
windows in your second host, so, the 'old' side of telnet is not a problem. 
(plus, if you use windows, security seems not to be your priority too...) ;) 
I must admit that I don't use ald. 
 
See following comments... 
 
Selon Lawrence <lawrencio@hotpop.com>: 
 
> Hi Frederic, 
>  
> Thanks for your kindly reply.  I keep thinking about your inspiration  
> these days (and that's the reason for my late reply).  Since I am not  
> quite familiar with SSH, I tried to telnet into my linux box under MS  
> Windows, and debug the attached framebuffer example asm file I found on 
>  
> http://www.nk.rim.or.jp/~jun/lxasm/exasm.tar.gz 
>  
> using ald.  the screen do appear rightly on the linux console, while the  
> debugging process is shown on my telnet window. 
>  
> I don't know if this operation is right, as I only step over a few  
> command, then I pass the 'continue' command to ald and let it run.  
It seems to do what you want, so it seems to be right, no? ;) 
That's the way I suggested, with SSH. 
>  Moreover, the example open /dev/fb0 directly, I am not sure if it is  
> because this act that make the output rightly go into the linux console  
> but not on my telnet screen. 
In Unixes (and so, Linux), "all is file" (the primary rule of Unix). 
In fact, /dev/fb0 is a file that has no physical reality on disk. It is just 
an entry in the filesystem that point to a kernel API. If you write something 
to this 'file', in fact, it send the data to the associated driver. The driver 
(in the kernel) can be accessed that way, very easily! There is nothing magic, 
you can read what drivers do in the kernel sources.  
In general, you send command to the driver with ioctl (Input/Ouput ConTroL, 
see the related man page), and large data with regular read/writes. 
For FrameBufer, for exemple, you send change modes request thru IOCTL, and 
graphic data thru writes. 
 
The FrameBuffer acts directly on your graphic card, so, on the host that is 
running the prog hardware. The telnet is just a terminal emulation. It a very 
simple protocole that works in lot of TEXT termials (VT100 for exemple). 
 
>  
> Would you please be so kind as to tell me if I am wrong? 
Is what you do not what you wanted to do? If it is, you are right! ;) 
 
Fred 
>  
> Thanks and Regards, 
> Lawence 
>  
> > hum, what about working with SSH ? 
> > I think it may be the best choice! 
> > You may also use a deported X screen (no X serveur on the computer on  
> > which you are working for your GUI, but on an other machine on which  
> > you can deport your screen, to debug, play with tetris and send  
> > mails... ;) ) 
> > If you come from windows and are not aware of the power of unix, ask  
> > me precisions... 
> > 
> > Fred 
> > 
> > Lawrence wrote: 
> > 
> >> Hi Linux Assembly Gurus, 
> >> 
> >> I have some experience in developing a desktop environment using 
> >> PharLap's asm toolkit.  I am very interested in doing the same thing 
> >> under Linux. 
> >> 
> >> Because of the GUI nature, I usually redirect the output of the debugger 
> >> into another computer's terminal, so that the UI being debugged can  
> >> be seen. 
> >> 
> >> I would like to know if there is a nasm specialized debugger that can do 
> >> such remote debugging under Linux, or are there any workaround for this 
> >> issue. 
> >> 
> >> Thanks and Regards, 
> >> Lawrence 
> >> 
> >> - 
> >> To unsubscribe from this list: send the line "unsubscribe  
> >> linux-assembly" in 
> >> the body of a message to majordomo@vger.kernel.org 
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html 
> >> 
> >>   
> >> 
> > 
> > 
> > 
>  
>  
 
 
 

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
