From: "Mike Osipov" <mike.osipov@gmail.com>
Subject: Re: Help finding ARGC
Date: Thu, 15 Nov 2007 12:56:12 +0300
Message-ID: <3a8eab9b0711150156u71d15753u39ce9d8332de64e0@mail.gmail.com>
References: <320520.11054.qm@web45102.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=2Id4qar1l6IidSfbvydVSRuAPV7kisshq9Q5amonswM=;
        b=S8YGl66gTPxK39tye/AvYC+KU76JIOcKyGWaqlg7v0HzsEJI3AvrrsO5S5I0ftPdIwemLaQONJEdNNTNbhZGRqbcPoOceN4rwxbxFtvQLsd+5voYJmcUyYTdk1Hp2wMgcmANE3u24qTlNLGGRZZCrABLnqDIMcN5j90Cyz39YwU=
In-Reply-To: <320520.11054.qm@web45102.mail.sp1.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

in the beginning of execution %esp point to argc value
get it: movl (%esp), %eax
or: popl %eax
Now %eax contains argc value
