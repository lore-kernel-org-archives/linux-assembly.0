From: Johann Oskarsson <myrkraverk@users.sourceforge.net>
Subject: Re: Preprocessing Assembly
Date: Sun, 27 Apr 2003 02:51:44 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3EAB45C0.7000706@users.sourceforge.net>
References: <3EAAA2CC.3000606@users.sourceforge.net> <200304262320.h3QNKcVN000848@hirsch.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; 
To: hp <lx@lxhp.in-berlin.de>, linux-assembly@vger.kernel.org

Hi,

hp a =E9crit:

>Johann Oskarsson am Samstag, 26. April 2003 16:16:
> =20
>
>>I've been doing a little assembly on my playstation2 running linux
>>(actually writing a little tutorial as I go along) and was wandering
>>what you ppl use to preprocess the source (if you do)?  I've tried a
>>little gasp, but that's depricated.
>>   =20
>>
>not really. GASP enables a few features which are often required but n=
ot=20
>implemented with any other part of the binutils.
>besides, the binutils' authors only _state_ that all GASP features are=
=20
>implemented with AS, which is not true. and, there is still some devel=
opment=20
>on GASP going on, not documented but, a "diff" shows. and, the GASP is=
=20
>included in the binutils sources, with AS, in the directory of which i=
t can=20
>be compiled, separately ("make gasp-new").
>
Well, I'm not using the latest binutils package, and I've had to make=20
some changes to gasp in order for it to work for me.  It has a rather=20
nasty feature that treats .end as eof, but .end means end-of-function=20
(incidentally eof too) in mips assembly.  I've made a crude hack to fix=
=20
this, but am thinking of a more general solution.  What I'd like to do=20
is to take gasp and create a separate tool called masp.  It'll be=20
platform independent and therefore not backwards compatible with gasp,=20
but will of course include the same functionality.  An added bonus will=
=20
be that it'll be officially supported :)  Now is anyone interested in=20
this?  I may need a little encouragement in order to go through with th=
is.

>> Do you generally use cpp, or is there a better tool out there?
>>   =20
>>
>I don't know of any such tool which wouldn't be worse - or self-made.
>
Worse than what, please be a little more specific?


Johann

P.S. I was basically thinking of changing gasp directives from=20
=2Esomething to /something, any comments on that?


-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
