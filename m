From: "Jason Roberts" <v3ct0r99@hotmail.com>
Subject: Re: Accessing the command line
Date: Tue, 11 Nov 2003 20:39:43 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Law9-F77NHyYjz9ZVSR0001c7b8@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wklux@yahoo.co.uk, dearestchum@yahoo.co.in, linux-assembly@vger.kernel.org

I have a suggestion to make:
dump your binary with objdump and debug with gdb and just read the code,ie. 
follow the jmps and calls
and push pops,etc...and use the info regs command to watch how the regs 
change. print $reg to see values, or x/x to read memory,etc. Like you could 
watch the sp after calling a function and 'see' that
the first value is [esp+4] just by x/x address-of-esp , so for example if 
you had a c func which passed
an int(4 bytes) then the call instruction would push that param and esp 
would go down 4 bytes.
So if int = 0x01 then [esp] would be 00 00 00 01. I had the same questions 
and gdb is really your best
friend. You can pretty much unravel the whole mystery of asm by just reading 
the asm output of
your binary. This is what works for me. Hope I wasnt redundant--I'm quite 
new to asm but it's all
clicking now thanks to gdb.
regards,
JR




>From: peter w krause <wklux@yahoo.co.uk>
>To: mutts kutts <dearestchum@yahoo.co.in>,linux-assembly@vger.kernel.org
>Subject: Re: Accessing the command line
>Date: Tue, 11 Nov 2003 18:09:23 +0000
>
>mutts kutts am Tuesday 11 November 2003 08:26:
> > Dear friend!
> > How is that in GNU/Linux that I access the command
> > line arguments? I can access only the "argc" [as in C]
> > but for "argv" [as in C] I get a sigsegv on running
>
>there is no pre-defined label or 'function'.
>arguments are passed w/ a list of pointerst to the rsp. strings.
>1st item on initial returnstack (pointed to by ESP) is the args count, ptrs 
>to
>passed args follow, next is a zero dword, pointers to the environmental
>strings follow, terminated by another zero dword.
>
>many examples in the 'asmutils' which are available at
>	http://linuxassembly.org
>
> > with strace.Well.
> >
> > My next question is, how do I know the amount of
> > memory to pop from the stack after a "jmp"
> > [near,far,short] jumps are quite confusing.
>
>for 'user land' programs (as opposed, e.g, to kernel modules) you need not
>care about 'far' jump or call, near/short is only a coding issue (4bytes vs 
>1
>byte displacement)
>also, no 'call far/near' etc. because of  'flat', protected mode.
>'jump' does not push anything, 'call' pushes a 'dword' (32bit).
>
> >
> > Can anyone please clear the doubts?
>
>re FAQ at http://linuxassembly.org
>
> > Cheers
>
>	hp
>
>--
>Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
>   >> hp -at- lxhp -dot- in-berlin -dot- de <<
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" 
>in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

_________________________________________________________________
MSN Shopping upgraded for the holidays!  Snappier product search... 
http://shopping.msn.com

