From: "=?ISO-8859-1?Q?Far=E9?=" <fahree@gmail.com>
Subject: Re: init.asm - 0.03 (19-Jun-2002) - asmutils 0.18
Date: Fri, 2 May 2008 08:12:05 -0400
Message-ID: <653bea160805020512m34f519dbgdbb850ba13189165@mail.gmail.com>
References: <4817406D.5000605@Giannone.de> <48198E19.7090605@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=bzMHqQOh/cyyhCakUTnsK+e4EkBF0OXSfQNOdI5NxrI=;
        b=f3pJ1+2kUHalqzFFsxCVmK34j0YsSJvqBSQqLd+8iiCokHJBzlJ8Vt9P7Z40PiAhGC6WG3jibFX/EvaO7+eI51ezycErc+NgztU8FqVTR9d2P/piLxTfw3neFOybqd6c87MYvI3PXkUyKpejw6+VRtrhKrMB97O43BZupS6An80=
In-Reply-To: <48198E19.7090605@verizon.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frank Kotler <fbkotler@verizon.net>
Cc: Bodo Giannone <Bodo@giannone.de>, linux-assembly@vger.kernel.org

When running your shell on a tty, you may be missing such fun syscalls
as  setsid, setpgid, tcsetpgrp, etc., that may be necessary for the
process to feel like it's in control of its destiny and its terminal.
Double check what the C version of init does before you do the same.

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://far=
e.tunes.org ]
A programming language is low level
when its programs require attention to the irrelevant.
        -- Alan Perlis


2008/5/1 Frank Kotler <fbkotler@verizon.net>:
> Bodo Giannone wrote:
>
> > Hello,
> >
> > I am the maintainer of BG-Tiny Linux Bootdisk.
> >
>
>  Thank you. I downloaded it and tried it. Sure is tiny! Seemed to wor=
k fine.
> (unlike "a-linux" which hung on me the last time I tried it, IIRC)
>
>
>
> > The tiny init version included in asmutils-0.18 (init.asm 0.03,
> > 19-Jun-2002) is exactly what I was looking for to integrate into BG=
-Tiny
> > Linux Bootdisk. Unfortunately I am havging some problems I cannot
> > resolve myself due to lacking assembler skills.
> >
> > I want to start /bin/sh on tty1-4 without using getty or login.
> > Unfortunately directly after booting I get the following error mess=
age:
> > "can't access tty, job control turned off". This could mean that in=
it
> > does not activate the ttys completely. Is there a possibility to ch=
ange
> > that?
> >
>
>  Always a "possibility"! I'm gradually acquiring a few assembly skill=
s...
> but I'm not sure what "init" is supposed to do. Quite a difference be=
tween
> the asmutils "init" and /sbin/init on my system!!! The "init" you're =
using
> comes from Busybox, right?
>
>
>
> > The sh I am using is ash from BusyBox 1.3.2. If I try to use sh.asm=
 from
> > asmutils-0.18 I only get a segfault.
> >
>
>  Hmmm. It seems to work okay for me - that's launching it from my "us=
ual"
> shell or from the shell from Busybox (I guess) that I get after booti=
ng your
> disk... and mounting the partition with asmutils on it - not "from sc=
ratch".
> How would I see this segfault?
>
>
>
> > I am using linux kernel 2.4.36.2 and uClibc 0.9.27 (linked statical=
ly).
> >
> > It would be great if someone had a suggestion.
> >
>
>  I'd be willing to attempt to modify the asmutils "init", if I knew w=
hat it
> needed to do differently. Anyone know where I can find a "newbie's
> quickstart guide to init"? Maybe I should look at the Busybox  code..=
=2E
>
>  That's not much of a "suggestion". I just wanted to give ya some
> encouragement. It "should" be a "possibility" to fix any problems you=
're
> having with asmutils.
>
>  Best,
>  Frank
>
>
>
>  --
>  To unsubscribe from this list: send the line "unsubscribe linux-asse=
mbly"
> in
>  the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
