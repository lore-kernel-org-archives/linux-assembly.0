From: peter willy krause <wklux@yahoo.co.uk>
Subject: Re: How to get allocate memory run time
Date: Fri, 13 Feb 2004 11:04:07 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200402131104.20958.wklux@yahoo.co.uk>
References: <20040212060043.13155.qmail@web41115.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040212060043.13155.qmail@web41115.mail.yahoo.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-assembly@mlists.in-berlin.de
Cc: linux-assembly@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

there is more than just the 'brk' syscall: the 'mmap' syscalls, namely 
"mremap" with which an allocated memory block can be re-sized with as 
litle loss of stored data as possible.

mremap wrt 'anonymous'ly mapped memory blocks enables a very simply to 
implement and, highly efficient de-/allocation scheme.

(afaik) three user space allocation areae exist:
1.
sys_brk for de-/allocation of contiguous memory in the '.bss' section;
2.
the mmmap, munmap, mremap syscalls which allocate anywhere in the 
available address space, independently, as much as the till un-used 
address space permits.
3. - for ia32 (and other cpu-s w. equal stack management):
stack section can be expanded by assigning a new top (i.e. "stack full") 
address below (arithmetically, UNsigned) the current top of stack (latest 
stacked item) pointer and (!) 'push'ing any data item to the expanded new 
top bound of stack - the latter prevents segfaults from 'normal' access 
to the additional, till then un-used memory range. then the initial stack 
pointer should be restored to enabling the extended addressing range.


there is a malloc example, based on sys_brk,  in the 'asmutils', file 
"asmutils/lib/heap.asm". re http://linuxassembly.org/asmutils.html

I'd successfully implement the memory de-/allocation routines based on the 
mmap and brk syscalls and 'push'/'pop' for dynamic (at 'runtime') memory 
management for my (fairly) small Forth compiler/interpreter "F4", 
which provides (almost) self-maintaining, independent memory blocks
with mmap for
	'data stack', 'variable's memory, 'terminal input buffer', 
	'user variables', 'block-files' intermediate buffers
sys_brk
	'dictionary' of newly compiled words, extending the F4 kernel
push/pop
	'return stack'

F4 sources are all in (AS-style) assembly, which thus might provide an 
exhaustive group of examples to those syscalls.

best,
	hp

re
	asmutils		http://linuxassembly.org/asmutils.html			(en)
	F4:			http://f4forth.berlios.de/index.html 			   (en,de)
				http://www.lxhp.in-berlin.de/lhpf4.html		(de)((en))
	sys_brk:		http://www.lxhp.in-berlin.de/lhpsysc1.html#brk		(en)
	sys_mremap:	http://www.lxhp.in-berlin.de/lhpsysc3.html#mremap	(en)

- ----------------------------------------------------------------------------------------
|  pse, reply to 'hp': lx at lxhp : in-berlin : de
- ----------------------------------------------------------------------------------------
Am Donnerstag, 12. Februar 2004 06:00 schrieb Anticipating a Reply:
> Hi !
>
>   brk and sbrk are system calls are just interfaces
> to the kernel implementation .
>
>   To invoke system calls through assembly ,
> look at
>
> http://world.std.com/~slanning/asm/syscall_list.html
>
> SNo. 45
>
>   Google / check the mailing list archives for
> sample examples of invoking system calls from
> assembly .
>
> Cheers !
>
>  --- Vadiraj C S <vadiraj@mail.cyberneme.com> wrote: >
>
> > Mr Brian,
> >
> > > libc's malloc et al work by using the brk system
> >
> > call (#45 in Linux).
> >
> >   I know the implementation of malloc, using brk
> > this is again a C implementation, What is the
> > procedure
> > behind it, I mean how can this be done in assembly
> > language. I dont want to call the extern functions
> > from
> > asm. There would be some kind of asm implementation
> > which does exactly what brk and sbrk does. I just
> > want
> > to know them.
> >
> >   Thanks
> >
> > --
> >                        With knowledge comes power,
> > and with power comes responsability.
> >
> >
> > With Best Regards
> > Vadiraj C S
> >
> >
> > --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFALK804A8LYevsFkwRAjJXAJwMXyJz7auvu4roFT4TWtK43/XwwwCg02Ls
nKpyclm6s1HfrmopvNgDAsc=
=NsUz
-----END PGP SIGNATURE-----

