From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: Accessing the command line
Date: Tue, 11 Nov 2003 18:09:23 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311111809.23517.wklux@yahoo.co.uk>
References: <20031111082636.97719.qmail@web8001.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20031111082636.97719.qmail@web8001.mail.in.yahoo.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mutts kutts <dearestchum@yahoo.co.in>, linux-assembly@vger.kernel.org

mutts kutts am Tuesday 11 November 2003 08:26:
> Dear friend!
> How is that in GNU/Linux that I access the command
> line arguments? I can access only the "argc" [as in C]
> but for "argv" [as in C] I get a sigsegv on running

there is no pre-defined label or 'function'.
arguments are passed w/ a list of pointerst to the rsp. strings.
1st item on initial returnstack (pointed to by ESP) is the args count, ptrs to 
passed args follow, next is a zero dword, pointers to the environmental 
strings follow, terminated by another zero dword.

many examples in the 'asmutils' which are available at
	http://linuxassembly.org

> with strace.Well.
>
> My next question is, how do I know the amount of
> memory to pop from the stack after a "jmp"
> [near,far,short] jumps are quite confusing.

for 'user land' programs (as opposed, e.g, to kernel modules) you need not 
care about 'far' jump or call, near/short is only a coding issue (4bytes vs 1 
byte displacement)
also, no 'call far/near' etc. because of  'flat', protected mode.
'jump' does not push anything, 'call' pushes a 'dword' (32bit).

>
> Can anyone please clear the doubts?

re FAQ at http://linuxassembly.org

> Cheers

	hp

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<

