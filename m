From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: Segfault on ioperm
Date: Thu, 20 Jan 2005 13:40:18 -0500
Message-ID: <41EFFB12.64D2C558@comcast.net>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: joy_mm@ieee.org
Cc: linux-assembly@vger.kernel.org

joy merwin monteiro wrote:
> 
> Hi,
> 
> I had been here before, I can't figure out why the code isnt working.

Seems like everybody's got a different idea what's wrong...
I might as well throw in my wild guess, too :)

> global _start
> 
> port equ 378h
> stat equ port+1
> ctrl equ port+2
> 
> section .text
> _start:
> 
>     mov eax,101
>     mov ebx,port
>     mov ecx,3

This is the number of ports you're enabling, right?

>     mov edx,port

And this should be the "turn-on" value... I imagine you want
"3" here, too, for "in" and "out" permissions...

>     int 80h

Check the returned value here, as Richard says, if signed,
bail out.

>     mov dx,port
>     mov al,0xff
>     out 378h,al  <----- segfault here

"out dx, al", as Jan suggests...

>     mov eax,1
>     int 0x80
> 
> Any help/ pointers?

Odd that it should work on a different distro... If you
suspect ld, grab newer binutils... Different permissions
setup would be more likely, I would think... But check that
return value - it should tell the tale. (assume you know
that -ERRNO is in eax, not -1 and ERRNO in errno, as man 2
says...)

Best,
Frank
