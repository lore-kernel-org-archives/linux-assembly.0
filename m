From: "Jack Andrews" <effbiae@gmail.com>
Subject: Re: getting at raw command line
Date: Fri, 14 Sep 2007 01:01:52 +1000
Message-ID: <2cf50a010709130801y5c4538f2p5fdfae95954f8b52@mail.gmail.com>
References: <2cf50a010709130518m78231c2fla98997a3a7b5c9fc@mail.gmail.com>
	 <316574.13339.qm@web50312.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=vSP0QQbgjNrNhlb7FqnZm1PgzCUFAI90loxJM0l3akM=;
        b=e9CnIwTXvlC4miMJeg2JxbqXp06EKsMB1RLpAGmh1VLYwLe1aYujOdvS8K3bRLuF4jFtdPdL35aHW8W65xbP39T1WcWFMZourMLiOLKQFrb1bgl1s/ctWYyfL1DCLv1QzTKIr5dy2JjkNTBPlH6jGEj/0hMqIg6BeXYhlcMdltQ=
In-Reply-To: <316574.13339.qm@web50312.mail.re2.yahoo.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

the shell changes arguments like * to a number of arguments.  is there
a way to get the *?  that is, if my program is p, i want this
behaviour:

 $ ls
 file.1 file.2
 $ ls *
 file.1 file.2
 $ p file.1
 file.1
 $ p *
 *

i don't want

 $ p *
 file.1 file.2
