From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: chdir on linux does not work
Date: Thu, 25 May 2006 00:18:51 -0400
Message-ID: <4475302B.7080409@comcast.net>
References: <20060524024929.99396.qmail@web50504.mail.yahoo.com> <20060524042614.GA18142@kurp.hut.fi> <447401F4.4020603@comcast.net> <20060525035518.GA6288@megapower.03s.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060525035518.GA6288@megapower.03s.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ho <aho-linux-asm@03s.net>
Cc: linux-assembly@vger.kernel.org

Adrian Ho wrote:
> On Wed, May 24, 2006 at 02:49:24AM -0400, Frank Kotler wrote:
> 
>>Adding a call to sys_getcwd (__NR_ 183) (why is this man 3, not man 2 
>>???)
> 
> 
> Are you talking about sys_getcwd(3) (which I've never seen or known to
> exist) or getcwd(3)?

getcwd(3). I refer to it as "sys_???" when I mean the int 80h interface, 
sorry.

> If the latter, there's a Linux-specific extension
> that uses malloc() -- perhaps that's the reason why:

I'll bet you're right. If that isn't the reason, it's as good a reason 
as any. Good point!

Best,
Frank


