From: m_hrebien@wp.pl
Subject: Re: gas' nop(s)
Date: Tue, 06 Aug 2002 11:30:56 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D4F9750.328C98B1@wp.pl>
References: <3D4D8E7F.8A393F62@wp.pl>
		<20020805102040.7d12bd33.*@lxhp.in-berlin.de>
		<3D4EBBA5.698AA14D@wp.pl> <20020805222102.193b66fc.lx@lxhp.in-berlin.de>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

h-peter recktenwald wrote:
> 
> > .text
> >
> > .align 1
> >
> > .globl _start
> > _start:
> >       mov     $1,%eax
> >       xor     %ebx,%ebx
> >       int     $0x80
> >
> 
> echo ".att_syntax noprefix;.global XLAB;jnc XLAB;movl eax,ebx;\
>       movl ebx,edx;XLAB:;.end"|as -achnlsd m=l --gstabs |tee t
> 
> the listing:
> ----------------------------------------------------
>    1 0000 0F83FCFF      .att_syntax noprefix
>    1      FFFF89C3
>    1      89DA89F6
> DEFINED SYMBOLS
>     {standard input}:1      .text:0000000a XLAB
> 
> NO UNDEFINED SYMBOLS
> --------------------------------------------------
> asm 4 bytes shorter w/o the ".global" statement, <jnc> then w. byte disp.

Yes, right! But it still adds "89F6" padding which stands for "mov
%esi,%esi" & my question was how to avoid this.

-- 
Maciej Hrebien

