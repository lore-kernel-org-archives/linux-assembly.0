From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Re: Segfault on ioperm
Date: Thu, 20 Jan 2005 23:45:02 +0530
Message-ID: <4b0d6e0d050120101553858b1e@mail.gmail.com>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
	 <20050120152600.GA17338@qwerty.be>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050120152600.GA17338@qwerty.be>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi,

I tried the same program on a different distro (SW 10).
possibly ld on woody is broken (being so old and all..)
it works fine on SW .....

Any comments/suggestions?

Thanks for the help,

Joy.M.Monteiro

On Thu, 20 Jan 2005 16:26:00 +0100, Jan Wagemakers <janw@easynet.be> wrote:
> joy merwin monteiro <joy.merwin@gmail.com> schreef:
> 
> >     mov dx,port
> >     mov al,0xff
> >     out 378h,al  <----- segfault here
> 
> I think that this should be :
> 
>         out dx, al
> 
> >     mov eax,1
> >     int 0x80
> > Any help/ pointers?
> 
> I hope this helps you. Good luck!
> 
> --
> Met vriendelijke groetjes         - Jan Wagemakers -
> 
> ... RFS: picprog: Microchip PIC serial programmer software (GPL)
>     Deb-package is available at <http://www.janw.easynet.be/picprog.html>
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
people always turn away,
from the eyes of a stranger...
Afraid to know
what lies behind the stare.......
    --QueensRyche
