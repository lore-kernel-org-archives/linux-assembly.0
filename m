From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: appending \n using registers
Date: Tue, 4 Nov 2003 13:30:56 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200311041330.56116.wklux@yahoo.co.uk>
References: <Law9-F43TlbI3c57jHV0001de3a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <Law9-F43TlbI3c57jHV0001de3a@hotmail.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Roberts <v3ct0r99@hotmail.com>, linux-assembly@vger.kernel.org

Jason Roberts am Monday 03 November 2003 23:12:
> thanks for ideas, albeit they were cryptic.

I find it difficult to explaining in a few words what - by now - seems very 
trivial to me:) 

> ummm... that lea instruction is weird...

not really (imho, once accustomed).

> nomrally when I think of using brackets I think 'value at this location'

...and LEA yields  'address of 'value at this location''.

> So if eax = 0x8048080 then eax  would adress 0x8048080  and [eax] would
> dereference byte at this location, similarly [eax+1] would access byte at
> 0x8048081
> so using lea edx,[eax] seems odd-- looks like it's moving 4 bytes at eax
> ,not the address that eax represents. Am I making sense???

certainly :) but...

besides, I find an operation which yields the result of an address calculation 
but doesn't actually store or fetch any data very helpful, for instance while 
programming position independent code (shared libs!).

I use LEA to storeing an address into a register and MOV for load/store of 
register values or data from/to memory which -imho- helps clarifying the 
purpose of asm text. often merely a variant of appearance, though.

other benefits may be that LEA
	sometimes compiles shorter and/or simpler code,
	can be used for simple + fast arithmetics w/o additional regs,
	arithmetics won't modify the CPU flags !

runtime penalty is probably
	some extra execution cycles due to 'address generation interlock' if the
	immediately following or preceding opr's use the LEA destn register.

I found the LEA w/ 680xx-es, where no (exact) aequivalent to intel style <mov 
reg,address> exists, difficult to understand, myself, too.

	'LEA' = 'load to destn reg the address of where a mov would load to/from'

>
> also, check out this session with gdb and an objdump of the prog-- you will

> (gdb) ni
> 0x0804813f in ?? ()
> (gdb) i r
> eax            0x2      2
> ecx            0xa0d00  658688 <---------- looks right to me...dont know
> what problem is:(

This is the actual _data_ in ecx but, ECX should hold the buffer ADDRESS! 

Always. No exception. Linux provides no system call which sends/receives the 
chars directly from/to a register.
Don't get confused by manual pages which, in fact, often refer to the 'libc', 
even when stating some routine being a 'system call'. All libc syscalls are 
wrappers to the actual kernel system calls.

did you check the returned figure in EAX?
anything in range of 0xfffff000 till 0xffffffff is an error code
successful 'write' returns the number of sent chars, ret EAX := EDX at entry

besides, why did you append the <nul> byte to the <cr><lf> sequence?


best,
	hp

> _________________________________________________________________
> Send instant messages to anyone on your contact list with  MSN Messenger
which explains...

-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> hp -at- lxhp -dot- in-berlin -dot- de <<

