From: Stephen Ray <stephen@mrmighty.net>
Subject: Re: I cannot build a new kernel image when I add a assembly module
 to It
Date: Mon, 08 Aug 2005 16:17:42 -0300
Message-ID: <42F7AFD6.9080505@mrmighty.net>
References: <20050808132100.19904.qmail@web60523.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050808132100.19904.qmail@web60523.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mhb <badrpayam@yahoo.com>
Cc: linux-newbie@vger.kernel.org, linux-assembly <linux-assembly@vger.kernel.org>

mhb wrote:
> Hi
> 
> I had added an assembly program to the networking
> section of kernel linux 2.2.16 without any problem.
> But when I add it to kerenel 2.4.1 I could build that
> kernel, but I faced with kernel panic error when I
> boot
> system with new builded image. 
...
> As you can see test3.s is an assembly file.
> I guess this problem is related to this Makefile.
> Is this Make file true?
> How can I win over this problem?
> 
> thanks
> 

Sorry, I'm not much of a linux assembly guru, but I am wondering why you 
assume the Makefile is the problem.  It could be, I'm not a makefile 
guru either.  But, as far as I know, make works the same no matter what 
kernel it's running on.  My first suspicion would be that calling 
conventions were changed between kernel versions, or that you use a 
kernel function that changed functionality.  Also, the version of gcc 
may be important.  I think something in the 2.9xx series is recommended 
for compiling the kernel.

Stephen
