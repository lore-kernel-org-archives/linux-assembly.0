From: "joy merwin monteiro" <joy.merwin@gmail.com>
Subject: Re: Unable To Jump To Undefined Symbol
Date: Tue, 14 Mar 2006 21:56:39 +0530
Message-ID: <4b0d6e0d0603140826q16d0f83vafd0d3dc659b85ee@mail.gmail.com>
References: <4416C936.2010403@wipro.com>
Reply-To: joy_mm@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4416C936.2010403@wipro.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Deepak Pandey <deepak.pandey@wipro.com>
Cc: linux-assembly@vger.kernel.org

yup, as leslie pointed out, you need an EXTRN directive so that
undefined refernces are handled by the linker. and what is LEAF, END ???

On 3/14/06, Deepak Pandey <deepak.pandey@wipro.com> wrote:
> Hi,
>   I got a compilation problem saying UNABLE TO JUMP TO UNDEFIND SYMBOL
> while compiling a code in which I tried to jump to a symbol(symbol_name)
> from a different file by an assembly instruction (j symbol_name).However
> I also declared the symbol as global(.globl symbol_name) but still it
> didnot worked.
> The Symbol was defined as follows:
>          LEAF(symbol_name)
>      /*some assembly instructions*/
>      END(symbol_name)
> Thanks in Advance.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
The person who cannot reason is a fool, one who won't reason is a bigot,
one who dare not reason is a slave.
