From: "John Rodriguez" <jr534@columbia.edu>
Subject: RE: sparc assembly mnemonic
Date: Mon, 21 Jun 2004 18:00:48 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <000801c457db$36172f80$310d3b80@mrl.cs.columbia.edu>
References: <Pine.LNX.4.58.0406211231500.25030@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0406211231500.25030@ns.isi.ulatina.ac.cr>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Fabio Miranda Hamburger' <fabmirha@ns.isi.ulatina.ac.cr>, linux-assembly@vger.kernel.org

Funny, this looks like the same code used to exploit a linux kernel bug.
See http://linuxreviews.org/news/2004-06-11_kernel_crash/index.html for
details.  Hopefully, no malice is intended by this posting.

-----Original Message-----
From: linux-assembly-owner@vger.kernel.org
[mailto:linux-assembly-owner@vger.kernel.org] On Behalf Of Fabio Miranda
Hamburger
Sent: Monday, June 21, 2004 2:34 PM
To: linux-assembly@vger.kernel.org
Subject: sparc assembly mnemonic

what are the sparc assembly  equivalent of the following instructions:

    __asm__ __volatile__ ("fsave %0\n" : : "m"(fpubuf));
    __asm__ __volatile__ ("frstor %0\n" : : "m"(fpubuf));


thanks,

---
Fabio Andres Miranda
Ingenieria de sistemas informaticos
Universidad Latina - Costa Rica

-
To unsubscribe from this list: send the line "unsubscribe
linux-assembly" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

