From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Prblem with AT&T
Date: Wed, 14 Aug 2002 20:40:27 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D5AA41B.BCD1844F@wp.pl>
References: <20020814063531.427.qmail@web14507.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Anticipating a Reply wrote:
> 
> Hello Maciej !
> 
>   Thanks for your help , and the code
> now works fine .
> 
>   Can you please help me understand how
> you decided the addresses to use for
> the text and data section .
> 
>   I could not figure out how you
> decided to use specifically 0x1c
> for the data section .

Oops! It should be 0x18, sorry! ;) 0x1c works too but it adds 4 zeros
(as a padding) at the end of text section and You don't need it, do You?

>   Can you please explain what addresses
> are these referring to ?
> 
>   Thanks in Advance .
> 
> With Regards
> 
>  ld --oformat binary -Ttext 0x0 -Tdata 0x1c -o sect2
>  sect2.o

The "-Ttext" and "-Tdata" options tell the linker what is the base
address of text and data segment of the output file (man ld). ld links
Your code in binary format so it's good to tell him how he must "look"
at the code to link it as You wish. In Your "module" there is nothing
before text section, it's the first section, so the starting address is
set to 0x0. 0x18 bytes (or 0x1c in the fat version ;)) after text
section there is the data section which holds the beautiful string. You
must tell ld explicitly where it is to avoid default behavior which i
think isn't good for You (pad with 0x1000 zeros!). Keep in mind that You
are working with binary format and You are decideing how the result of
linking looks.

Regards

-- 
Maciej Hrebien

