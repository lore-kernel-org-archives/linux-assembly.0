From: lx <lx@lxhp.in-berlin.de>
Subject: Re: .unset
Date: Mon, 23 Sep 2002 10:21:56 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020923102156.56f1bfac.lx@lxhp.in-berlin.de>
References: <3D8E1EF7.B8B0EA6B@wp.pl>
Reply-To: lx@lxhp.in-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <3D8E1EF7.B8B0EA6B@wp.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl
Cc: linux-assembly@vger.kernel.org

On Sun, 22 Sep 2002 21:50:15 +0200
Maciej Hrebien <m_hrebien@wp.pl> wrote:

> Hi there!
> 
> The GAS has the .set directive (or .equ if You like) which defines a
> value to use during assembly. My question is how to unset this value to
> be not seen in code after this operation (like C's undef). Is it
> possible? 

no. asm, not "C":)
'.set' doesn't define a compiler control item but, in assembly terms a 
'label' which to 'un'-defining would be quite silly - and useless, re 
AS manual, 7.67:
	" ...value stored in the object file is the last value..."


the sequence of CC -E ... | GASP ... | AS ... can help for
any kind of asm control but, also is quite tricky (re my www pages "F4A").

> .set xyz, 1
> 
> .ifdef xyz
> .unset xyz
> .endif
> 
> "xyz" not seen here!
> 
> Something like the example above with the proper ".unset" directive
> which i can't find. Maybe there is a different way to do this?
> 
> Sorry if this is some kind of redundant question but i really can't
> figure out how to do this :(
> 
> -- 
> Maciej Hrebien
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml en/de

