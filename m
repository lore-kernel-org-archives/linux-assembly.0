From: "J.S.Souza" <jssouza@pacbell.net>
Subject: Assembly Procedure calls
Date: Thu, 16 May 2002 11:39:59 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200205161840.LAA18243@gold.he.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: penguin@dccnet.com
Cc: linux-assembly@vger.kernel.org

What is required for calling procedures using GAS?  Do I have to pay 
attention to far / near calls?  Also, do I need to pay attention to 
realigning the stack or anything else?  I noticed in other peoples programs 
that have procedures in the main file that they push the %edi register - 
what's this for?   Also, what is needed if I put the procedures in another 
file - do I need to declare things as EXTERN and so forth?  How about 
assembling the file - are there options I need to pass to 'as' and 'ld'?

		Regards,
		Jeff Souza
		jssouza@pacbell.net
