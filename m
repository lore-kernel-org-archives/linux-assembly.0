From: Frederic Marmond <fmarmond@gmail.com>
Subject: Re: Passing parameters to assembler functions in 'C' 64 style.
Date: Thu, 4 Dec 2008 21:55:30 +0100
Message-ID: <200812042155.30433.fmarmond@gmail.com>
References: <5360.11799.qm@web50303.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=2/r/2cGotEHc2puSi9rq2jzRt2FGHJxYMpSb9nJcm1s=;
        b=XoGTlF2/CEsXTu+TVbU3/dgw7YG+uhNgrW9dNoip/CChfrplzlFlGiLzm4ZHNX9TjJ
         0uOUUAokbONltKlvrs6DFhTKJudCjkaVccHqoTiM+P9uDayCF2ru0xCOLGU6iH23qFqh
         k3bkYHZ9Wt2LWB7Te4fWDdBp4Yw2R1NTiyPQI=
In-Reply-To: <5360.11799.qm@web50303.mail.re2.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: blurrpp@yahoo.com
Cc: linux-assembly@vger.kernel.org

Hi Luke,

maybe this document may answer your question:
http://www.x86-64.org/documentation/abi.pdf

Have a particular look to section 3.2

=46red

Le Thursday 04 December 2008 =E0 21:20, =A3ukasz a =E9crit :
> Hi.
> I started to write assembler functions for C on 64-bit arch. On 32-bi=
t
> arch. every parameters ware put on stack, now is different, what can =
be
> easyly seen reading source program. For example if im passing one (in=
t *)
> parameter, adress (&int) is kept in %rdi register, and so one if u ar=
e
> passing more parameters. Ofcurse is not dificult to use it if u know =
but is
> there any key according to which parameters are stored?. I've made so=
me
> "experiments" with different numbers and kind parameters, but the "ke=
y"
> must be described somewhere.
>
> Luke
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
DeepSee project, few links:
web: http://www.sand-labs.org/deepsee
blog: http://fmarmond.blogspot.com/search/label/DeepSee
twitt: http://twitter.com/fmarmond
IRC: #deepsee on freenode
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
