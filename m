From: "ALberto Andres" <betorumbero@hotmail.com>
Subject: Re: Writing Linux Device drivers with NASM
Date: Mon, 13 Mar 2006 18:38:26 +0100
Message-ID: <BAY102-F33332FFB9CE108853DD9FDA3E00@phx.gbl>
References: <4415A43B.8030804@comcast.net>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4415A43B.8030804@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: fbkotler@comcast.net
Cc: linux-assembly@vger.kernel.org




>From: Frank Kotler <fbkotler@comcast.net>
>To: ALberto Andres <betorumbero@hotmail.com>
>CC: linux-assembly@vger.kernel.org
>Subject: Re: Writing Linux Device drivers with NASM
>Date: Mon, 13 Mar 2006 11:56:27 -0500
>
>ALberto Andres wrote:
>>Hi everybody, I'm writing a guide about device drivers in assembly under =

>>linux. I'm using NASM.  If anybody is interested here is the URL:
>>
>>http://albertoandreotti.5000megs.com/
>
>Great, Alberto! Couple thing seems strange to me. I don't know anything=20
>about device drivers, so perhaps it really *is* that strange...
>
>You say:
>
>    2.      Stack cleanup is performed by the called function.
>    3.      Function name is decorated by prepending an underscore=20
>character
>
>But that doesn't seem to be what you show...
>
>And... your strings have got CRs in 'em. Is that normal/required for devic=
e=20
>drivers?
>
>I'm sure I'll have more questions... Great resource. Thanks!
>
>Best,
>Frank
>

I think you are talking about the call to the printk function. The string=20
has a line feedback and carry return and a NULL (number 0) at the end. The =

format of the string is the same as the required for printf. The first two =

numbers are printed by printk and the zero indicates the end of the=20
string(the convention followed by C strings).

Thanks for your interest.

_________________________________________________________________
Descubre la descarga digital con MSN Music. M=E1s de un mill=F3n de cancion=
es.=20
http://music.msn.es/

