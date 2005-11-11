From: Frederic Marmond <zebarbuc@free.fr>
Subject: Re: Very newbie question...
Date: Sat, 12 Nov 2005 00:29:47 +0100
Message-ID: <200511120029.48097.zebarbuc@free.fr>
References: <437523A4.6080707@alice.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <437523A4.6080707@alice.it>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lorenzo <lollo_c@alice.it>
Cc: linux-assembly@vger.kernel.org

Hi,
in amd64, registers are different (64bits...) ;)
So, I think you'd better use the 64 bits name version
push rbp
mov rbp,rsp
=2E..

What do you have as result in your case?
can you try it with gdb and step your prog?

=46red

Le Samedi 12 Novembre 2005 00:05, Lorenzo a =E9crit=A0:
> Hi,
>
> i have some problems with my first linux/nasm asm program.
> This is a simple "hello world" program but i can't see the "hello wor=
ld"
> on my screen and i don't find my error.
> I work on 64bit amd system.
> Someone can illuminate me? :)
>
>
> Thx
>
> -----------------------------------
>
> section .text
>     global   _start
>
> msg   db   'hello, world!',0xa
> len   equ   $ - msg
>
> _start:
>     push   ebp
>     mov   ebp,esp
>
>     push   len
>     push   msg
>     push   1
>     mov   ebx,esp
>     mov   eax,4
>     int   0x80
>
>     add   esp,12
>
>     mov   ebx,0
>     mov   eax,1
>     int   0x80
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assem=
bly"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
=46rederic Marmond
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
