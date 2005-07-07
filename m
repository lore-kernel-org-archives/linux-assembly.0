From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: extended assembly
Date: Thu, 7 Jul 2005 04:12:33 +0200
Message-ID: <20050707021233.GA22487@MAIL.13thfloor.at>
References: <BAY14-F22DCF1C24E58500B44F404D0D90@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BAY14-F22DCF1C24E58500B44F404D0D90@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Fflores <abebex17@hotmail.com>
Cc: linux-assembly@vger.kernel.org

On Wed, Jul 06, 2005 at 07:18:48PM +0000, Martin Fflores wrote:
> hi! everyone, i have a rare problems here, i dont know if i do somethign 
> wrong or the compiler have some problems, when i read a value from a port(a 
> byte) the first time it's retun to me a byte so i catch and use printf to 
> show this value, the secon time its return to me a integer value or a dont 
> know, let me give you a example:
> 
> char value=0;
> __asm__ __volalile__("cli;inb $0x60,%0;sti;":"=r"(value));
> printf("%x",value);// the first time usually return 1c
> // this is the second time
> __asm__ __volalile__("cli;inb $0x60,%0;sti;":"=r"(value));
> printf("%x",value);// this print in teh screen ffffffa ainteger value
> 
> i'm expecting a ACK response for the keyboard ACK is in the ffffffa the 
> first byte buti cant never know ir caouse when i ask for ack it inst ack in 
> ffffffa and it is bigger than a byte why iot happend??????????????????''

man 3 printf

       o,u,x,X   The unsigned int argument is converted to unsigned 
		     ~~~~~~~~~~~~~~~~~~~~~
		 octal (o), unsigned decimal (u), or unsigned hexadecimal
		 (x and X) notation. 

The length modifier
       hh        A following integer conversion corresponds to a 
		 signed char or unsigned char argument, or a
              	 following n conversion corresponds to a pointer 
		 to a signed char argument.

the 'char' value is signed, and is implicitely converted
to an int, which in turn is printed as unsigned hex 'x'

 0xfa (-5) -> 0xfffffffa

best,
Herbert

> Take Care Folks.
> 
> Martin Flores
> 
> _________________________________________________________________
> Don't just search. Find. Check out the new MSN Search! 
> http://search.msn.com/
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
