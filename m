From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: sparc assembly mnemonic
Date: Mon, 21 Jun 2004 12:34:25 -0600 (CST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0406211231500.25030@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

what are the sparc assembly  equivalent of the following instructions:

    __asm__ __volatile__ ("fsave %0\n" : : "m"(fpubuf));
    __asm__ __volatile__ ("frstor %0\n" : : "m"(fpubuf));


thanks,

---
Fabio Andres Miranda
Ingenieria de sistemas informaticos
Universidad Latina - Costa Rica

