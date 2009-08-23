From: "linuxasm@gmail.com" <linuxasm@gmail.com>
Subject: Re: Appendix: multithreating HOWTO ? :)
Date: Sun, 23 Aug 2009 14:02:33 -0700
Message-ID: <200908231402.33551.linuxasm@gmail.com>
References: <203349.81852.qm@web50309.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:subject:date:user-agent
         :references:in-reply-to:mime-version:content-disposition:to
         :content-type:content-transfer-encoding:message-id;
        bh=9MhrvHjW4K/HvPq8ciHTVT2F5XiiU4SWH/CWWk36gYQ=;
        b=qwbUheLH/pe5pqAjwowyDMCJ0lVuZ4ELGJLjtqjOLrxCu9iyPuHd3NdPtMSd9RP81J
         Y01HDsIXhs1gsIpznaGIYtOw5JQlHbVaRHnyfpdYeAEdXvcieK4Yvtus0jDxduPEJh3i
         RRfr7frhEwrA6h7i6wgWYXyX5rjXcTY3JOobI=
In-Reply-To: <203349.81852.qm@web50309.mail.re2.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-assembly@vger.kernel.org

On Sunday 23 August 2009 09:17:59 =C2=A3ukasz wrote:
> thanks for answer, im experiment with system clone ( actualy fork i f=
ound
> in many manuals ) but i dont understand Frakns last sentence "Well, t=
hey
> *told* us not to do it that way. :)", to program multiproceses with f=
ork ?
> Any way is there any way to make share memory for proceses ?i

There are several ways to do shared memory.  If using a "fork"
the asmlib functions:
  shared_open
  shared_attach
  shared_close
provide some example code.
see http://linuxasmtools.net  download asmlib and look memory funcitons=
=2E
all the best, jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
