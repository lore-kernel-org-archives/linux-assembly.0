From: Marcin =?utf-8?q?Ko=C5=9Bcielnicki?= <markosc@interia.pl>
Subject: Re: argc/argv
Date: Fri, 10 Mar 2006 08:08:29 +0100
Message-ID: <200603100808.30524.markosc@interia.pl>
References: <031020060400.159.4410F9E10006CADE0000009F22007613949B9D9A0D0409@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <031020060400.159.4410F9E10006CADE0000009F22007613949B9D9A0D0409@comcast.net>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-assembly@vger.kernel.org

> I am trying to build a system that needs to pick up the command line
> arguments.  However, it seems there are two ways to do it.

No, there's only one.

> The old way is that argc and argv elements are on the stack.

And that's the correct way.

> Using gcc 3.4.3, the argc is edi and the pointer for argv is in esi,
> according to the times that I have tried it.
>
> Is this correct????

No. Maybe argc really is in edi and argv in esi, but it can change anyt=
ime.=20
Without warning. You shouldn't ever depend on it. Also, I believe this=20
behavior should be attributed to both glibc and gcc (and therefore can =
change=20
when version of either changes).

Marcin Ko=C5=9Bcielnicki




---------------------------------------------------------------------
Toshiba i FIFA World Cup
Wygraj bilety i notebooki z Intel Centrino Duo Mobile Technology
http://link.interia.pl/f1912

-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
