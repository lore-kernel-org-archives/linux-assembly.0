From: Steffen Solyga <solyga@absinth.net>
Subject: Re: Help finding ARGC
Date: Tue, 27 Nov 2007 22:12:47 +0100
Message-ID: <20071127211247.GB4634@absinth.net>
References: <320520.11054.qm@web45102.mail.sp1.yahoo.com> <3a8eab9b0711150156u71d15753u39ce9d8332de64e0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3a8eab9b0711150156u71d15753u39ce9d8332de64e0@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux assembly <linux-assembly@vger.kernel.org>
Cc: Mike Osipov <mike.osipov@gmail.com>

maybe you want to have a look at this one
http://linux.xulin.de/asm/cmdline/

Citing Mike Osipov (Thursday, 2007/11/15 12:56)...

> in the beginning of execution %esp point to argc value
> get it: movl (%esp), %eax
> or: popl %eax
> Now %eax contains argc value
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
------------------------------------
Steffen Solyga
mail: solyga@absinth.net
www : http://www.absinth.net/solyga/
------------------------------------
