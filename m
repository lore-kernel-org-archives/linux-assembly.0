From: willy meier <wklux@yahoo.co.uk>
Subject: Re: confused asm newbie
Date: Thu, 23 Oct 2003 15:38:39 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F97E7EF.CE5E0F19@yahoo.co.uk>
References: <Law9-F40TZiqpJjmH4P000039ed@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Roberts <v3ct0r99@hotmail.com>
Cc: linux-assembly@mlists.in-berlin.de, linux-assembly@vger.kernel.org

Jason Roberts wrote:
> 
> I have a few questions concerning how the stack is used and how memory is
> accessed
> and what it looks like.I've read books, which only serve to confuse me, or
> the author tries
> to mystify you into believing assembly is dark magic only for the elite.

don't get discuraged by those utterly stupid people...
I hope, the following helps to de-mystify:


"Machine-Level Representations of C Programs on Linux/IA32", 
	http://www.lxhp.in-berlin.de/lhplinks.html#cas

also, the System-V & POSIX documents specify the C to asm translation, 
	http://www.lxhp.in-berlin.de/lhplinks.html#sysv

and, if you compile with the following options to the assembler, you'll
get the complete asm listing from compiling a C program, piped into the
file 'LOG.m':

	CFLAGS += -Wa,-acdlms -save-temps
	make (or 'cc' or any other appropriate command) 2>&1 | tee -a LOG.m

tracing with the 'ald' debugger and tests with 'strace' and 'ltrace'
would also return much information about programs execution (links on
above mentioned page).

best,
	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<

