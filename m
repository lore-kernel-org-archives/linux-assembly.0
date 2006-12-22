From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: suffix or operands invalid for
Date: Fri, 22 Dec 2006 11:15:58 -0800
Message-ID: <1166814958.4573.64.camel@localhost>
References: <d5418ffc0612211839n531644f2x11f8afc4f293f1dd@mail.gmail.com>
	 <458BD4BB.1050502@verizon.net>
	 <d5418ffc0612220618ra72b5dfpcca0312c356b45ce@mail.gmail.com>
	 <1166804181.4573.20.camel@localhost> <1166806530.4573.35.camel@localhost>
	 <d5418ffc0612221105p2b6803b5ta9a871c6d924972a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d5418ffc0612221105p2b6803b5ta9a871c6d924972a@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kenton Brede <kbrede@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Fri, 2006-12-22 at 13:05 -0600, Kenton Brede wrote:

> I tried that and the output of gcc gave me enough information that I
> was able to get the prog to compile on the system.

Another program you may find useful is

    objdump -d myProg

where "myProg" is the name of your executable. This will give you a
disassembled view of your program as it looks in memory. You can see
where the external library functions are called, etc. It's a long
display, so pipe it through more or less.



