From: Jan Wagemakers <janw@easynet.be>
Subject: Re: Segfault on ioperm
Date: Thu, 20 Jan 2005 16:26:00 +0100
Message-ID: <20050120152600.GA17338@qwerty.be>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4b0d6e0d0501200552126d8cbb@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

joy merwin monteiro <joy.merwin@gmail.com> schreef:

>     mov dx,port
>     mov al,0xff
>     out 378h,al  <----- segfault here

I think that this should be :

	out dx, al
	
>     mov eax,1
>     int 0x80
> Any help/ pointers?

I hope this helps you. Good luck!


-- 
Met vriendelijke groetjes         - Jan Wagemakers -

... RFS: picprog: Microchip PIC serial programmer software (GPL)
    Deb-package is available at <http://www.janw.easynet.be/picprog.html>
    
