From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Re: Segfault on ioperm
Date: Fri, 21 Jan 2005 18:13:09 +0530
Message-ID: <4b0d6e0d050121044310b6a9c6@mail.gmail.com>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
	 <41EFFB12.64D2C558@comcast.net>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <41EFFB12.64D2C558@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Kotler <fbkotler@comcast.net>
Cc: linux-assembly@vger.kernel.org

On Thu, 20 Jan 2005 13:40:18 -0500, Frank Kotler <fbkotler@comcast.net> wrote:
> joy merwin monteiro wrote:
> >
> > Hi,
> >
> > I had been here before, I can't figure out why the code isnt working.
> 
> Seems like everybody's got a different idea what's wrong...
> I might as well throw in my wild guess, too :)
> 
> > global _start
> >
> > port equ 378h
> > stat equ port+1
> > ctrl equ port+2
> >
> > section .text
> > _start:
> >
> >     mov eax,101
> >     mov ebx,port
> >     mov ecx,3
> 
> This is the number of ports you're enabling, right?
> 
> >     mov edx,port
> 
> And this should be the "turn-on" value... I imagine you want
> "3" here, too, for "in" and "out" permissions...

No idea, Just used the code available on http://www.janw.easynet.be/eng.html
as a reference. it works fine, so......
> 
> >     int 80h
> 
> Check the returned value here, as Richard says, if signed,
> bail out.
> 
> >     mov dx,port
> >     mov al,0xff
> >     out 378h,al  <----- segfault here
> 
> "out dx, al", as Jan suggests...

However, Jan's  musice speaker on the site above uses
"out 43h,al"

Corrected that :-(
> 
> >     mov eax,1
> >     int 0x80
> >
> > Any help/ pointers?
> 
> Odd that it should work on a different distro... If you
> suspect ld, grab newer binutils... Different permissions
> setup would be more likely, I would think... But check that
> return value - it should tell the tale. (assume you know
> that -ERRNO is in eax, not -1 and ERRNO in errno, as man 2
> says...)

Thanks for the pointers.....

Joy.M.Monteiro
> 
> Best,
> Frank
> 


-- 
people always turn away,
from the eyes of a stranger...
Afraid to know
what lies behind the stare.......
    --QueensRyche
