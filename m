From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: chdir on linux does not work
Date: Wed, 24 May 2006 02:49:24 -0400
Message-ID: <447401F4.4020603@comcast.net>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com> <20060524042614.GA18142@kurp.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060524042614.GA18142@kurp.hut.fi>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Timo Lindfors wrote:

...
> Remember that chdir affects only the process that calls chdir.

I thought Noprianto's problem was the lack of a terminating zero after 
"/bin"... didn't help, but I still think it's a bug waiting to byte. 
Adding a call to sys_getcwd (__NR_ 183) (why is this man 3, not man 2 
???) proves that, sure enough, it *does* work... but we change back on 
exit... as you say...

> You
> can't e.g. write a replacement for shell's builtin "cd" command that
> way.

Okay, how *would* we do that? I know! I'll check "asmutils"! Hmmm... no 
chdir in asmutils... This is apparently harder than it looks!

Good Question!

Best,
Frank

