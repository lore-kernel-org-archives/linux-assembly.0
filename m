From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Prblem with AT&T
Date: Thu, 08 Aug 2002 18:04:46 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D52969E.E87E83A9@wp.pl>
References: <20020808073133.53517.qmail@web14505.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Anticipating a Reply wrote:
> 
>  But I get the error in "ld" .
> 
> sect2.o: In function `_start':
> sect2.o(.text+0xd): relocation truncated to fit:
> R_386_16 data
> 
> 
> -------------AT&T SYNTAX --------------------
> 
> .code16
> 
> .align 4
> 
> .data
> 
> mymsg:
>         .byte 13,10
>         .ascii "Handling BIOS interrupts"
> 
> .text
> 
> .globl _start
> 
> _start:
>         movb $0x03,%ah   # read cursor position.
>         xor  %bh,%bh
> 
>         int  $0x10
> 
>         movw $24,%cx     # length of our beautiful string.
>         movw $0x0007,%bx # page 0, attribute 7 (normal)
>         movw $mymsg,%bp
>         movw $0x1301,%ax # write string, move cursor
> 
>         int  $0x10
> 
> loop1:
>         jmp loop1

try ld like this:

ld -Ttext 0x0 -o beauty_str beauty_str.o

it works but You must set right "text" address - more useful to You than
0x0 in this example.

Regards

-- 
Maciej Hrebien

