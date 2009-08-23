From: Claudio Fontana <claudio.fontana@gmail.com>
Subject: Re: Appendix: multithreating HOWTO ? :)
Date: Sun, 23 Aug 2009 15:35:44 +0200
Message-ID: <4A9145B0.50507@gmail.com>
References: <556680.44596.qm@web50309.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=6keqmeh9Iewm4NzE51EWyuffz7ss7NFf2o1YYW3aFgI=;
        b=SUOAqkP/P0Tc/Zx9O2wjoVjGjUzWVrqYyxW8R+Yb2lZp0qkAkO/L4J9cjD65JOjcni
         Ahd0NCdJAHaMc3c3fT1Zym+nmPan7+MKjTjiM9XVdVEBqDZe1nyYE+I6oepZtSJj5WoP
         ijGI+ukiNhkzgHSQhQREG56aO1FtLh+cXDPa0=
In-Reply-To: <556680.44596.qm@web50309.mail.re2.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?=A3ukasz?= <blurrpp@yahoo.com>
Cc: linux-assembly@vger.kernel.org

=A3ukasz wrote:
> in appendix i want to just precize problem. Broblem is how to write, =
create etc, shared memory for parent and child proceses, where they cou=
ld for example exchange wariables

You are using fork. Fork is used to create new processes.
You probably want clone instead, to create new threads and specify
which resources to share between the two threads.

man 2 clone

sys_clone is 120 (0x78).


--
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
