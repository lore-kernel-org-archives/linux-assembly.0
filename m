From: Jan Wagemakers <janw@easynet.be>
Subject: Re: Segfault on ioperm
Date: Sun, 23 Jan 2005 09:17:22 +0100
Message-ID: <20050123081722.GA2765@qwerty.be>
References: <4b0d6e0d0501200552126d8cbb@mail.gmail.com> <41EFFB12.64D2C558@comcast.net> <4b0d6e0d050121044310b6a9c6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4b0d6e0d050121044310b6a9c6@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

joy merwin monteiro <joy.merwin@gmail.com> schreef:

>>>     mov dx,port
>>>     mov al,0xff
>>>     out 378h,al  <----- segfault here
>> "out dx, al", as Jan suggests...
> However, Jan's  musice speaker on the site above uses
> "out 43h,al"

This is how OUT works :

 | OUT - Output Data to Port
 |
 |        Usage:  OUT     port,accum
 |        Modifies flags: None
 |              
 |        Transfers byte in AL,word in AX or dword in EAX to the specified
 |        hardware port address.  If the port number is in the range of 0-255
 |        it can be specified as an immediate.  If greater than 255 then the
 |        port number must be specified in DX.  Since the PC only decodes 10
 |        bits of the port address, values over 1023 can only be decoded by
 |        third party vendor equipment and also map to the port range 0-1023.

So, if port > 255 then use dx ;-)


-- 
Met vriendelijke groetjes         - Jan Wagemakers -

 - Debian GNU/Linux 3.1 - Up : 25 days 
