From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: Prblem with AT&T
Date: Fri, 16 Aug 2002 05:55:41 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020816045541.5356.qmail@web14502.mail.yahoo.com>
References: <3D5AA41B.BCD1844F@wp.pl>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D5AA41B.BCD1844F@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl, linux-assembly@vger.kernel.org

Hi Maciej !

  Thanks for clearing the doubt .

  I had checked the sect2.o file using 
objdump -h , and got confused with the
difference in the text address locations .

  Your explanation has made things clear .

  Have a nice time .

Cheers ! 


 --- Maciej Hrebien <m_hrebien@wp.pl> wrote: >
Anticipating a Reply wrote:
> > 
> > Hello Maciej !
> > 
> >   Thanks for your help , and the code
> > now works fine .
> > 
> >   Can you please help me understand how
> > you decided the addresses to use for
> > the text and data section .
> > 
> >   I could not figure out how you
> > decided to use specifically 0x1c
> > for the data section .
> 
> Oops! It should be 0x18, sorry! ;) 0x1c works too
> but it adds 4 zeros
> (as a padding) at the end of text section and You
> don't need it, do You?
> 
> >   Can you please explain what addresses
> > are these referring to ?
> > 
> >   Thanks in Advance .
> > 
> > With Regards
> > 
> >  ld --oformat binary -Ttext 0x0 -Tdata 0x1c -o
> sect2
> >  sect2.o
> 
> The "-Ttext" and "-Tdata" options tell the linker
> what is the base
> address of text and data segment of the output file
> (man ld). ld links
> Your code in binary format so it's good to tell him
> how he must "look"
> at the code to link it as You wish. In Your "module"
> there is nothing
> before text section, it's the first section, so the
> starting address is
> set to 0x0. 0x18 bytes (or 0x1c in the fat version
> ;)) after text
> section there is the data section which holds the
> beautiful string. You
> must tell ld explicitly where it is to avoid default
> behavior which i
> think isn't good for You (pad with 0x1000 zeros!).
> Keep in mind that You
> are working with binary format and You are decideing
> how the result of
> linking looks.
> 
> Regards
> 
> -- 
> Maciej Hrebien
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
http://vger.kernel.org/majordomo-info.html 

________________________________________________________________________
Want to sell your car? advertise on Yahoo Autos Classifieds. It's Free!!
       visit http://in.autos.yahoo.com
