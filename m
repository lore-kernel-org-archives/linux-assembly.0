From: joy merwin monteiro <joy.merwin@gmail.com>
Subject: Re: Segfault on ioperm
Date: Mon, 24 Jan 2005 08:58:24 +0530
Message-ID: <4b0d6e0d05012319285a3663f3@mail.gmail.com>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
	 <41EFFB12.64D2C558@comcast.net>
	 <4b0d6e0d050121044310b6a9c6@mail.gmail.com>
	 <20050123081722.GA2765@qwerty.be>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050123081722.GA2765@qwerty.be>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Wagemakers <janw@easynet.be>
Cc: linux-assembly@vger.kernel.org

I got it.....
Thanks a lot for all the help.

regards,
Joy.M.Monteiro


On Sun, 23 Jan 2005 09:17:22 +0100, Jan Wagemakers <janw@easynet.be> wrote:
> joy merwin monteiro <joy.merwin@gmail.com> schreef:
> 
> >>>     mov dx,port
> >>>     mov al,0xff
> >>>     out 378h,al  <----- segfault here
> >> "out dx, al", as Jan suggests...
> > However, Jan's  musice speaker on the site above uses
> > "out 43h,al"
> 
> This is how OUT works :
> 
>  | OUT - Output Data to Port
>  |
>  |        Usage:  OUT     port,accum
>  |        Modifies flags: None
>  |
>  |        Transfers byte in AL,word in AX or dword in EAX to the specified
>  |        hardware port address.  If the port number is in the range of 0-255
>  |        it can be specified as an immediate.  If greater than 255 then the
>  |        port number must be specified in DX.  Since the PC only decodes 10
>  |        bits of the port address, values over 1023 can only be decoded by
>  |        third party vendor equipment and also map to the port range 0-1023.
> 
> So, if port > 255 then use dx ;-)
> 
> --
> Met vriendelijke groetjes         - Jan Wagemakers -
> 
>  - Debian GNU/Linux 3.1 - Up : 25 days
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
