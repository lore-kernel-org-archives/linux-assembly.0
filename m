From: peter w krause <wklux@yahoo.co.uk>
Subject: Re: Does anyone code in assembler today?
Date: Mon, 22 Sep 2003 10:53:19 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200309221053.19481.wklux@yahoo.co.uk>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br> <3F695140.60003@eprocess.fr> <200309180835.05190.jko@save-net.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200309180835.05190.jko@save-net.com>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I love that sentence (ex 'a.html'):
	The best part was being able to view comments in the
	source file.  Us old brain dead programmers need all
	the help we can get and without comments we go around
	in big circles.

jeff am Donnerstag, 18. September 2003 17:10:
> On Wednesday 17 September 2003 11:31 pm, Frederic Marmond wrote:

> 2. Most Assembler tools are awful and new programmers have
>     not encountered good tools.

sic. even for the tiny ZX81 there were better tools.

> 3. People are different and some people do not want to think
							^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     about registers and such.

first part applies.

> 4. It is easy to make assembler difficult for others to understand.

as is for "C", and "C++" even more and, some take that for 'complexity' which, 
due to lack of understanding soon gets the fame of being something 
valuable...

it is easy, as well, to make any prgram code (fairly) easy to understand, but 
would those readers then honour the utmost brillance of the rsp coder... ?!


> 5. A good assembler library can make coding speed and results about
>     the same as a high level language.  Now, this point will probably

which is trivial and, was well known, in the 'ancient' days.

>
> Has anyone tried the new nasm 98.38 that was just released to fix ELF
> problems.   It appears to still have the old problem of stuffing a zero in
> the generated code.  Probably a memory leak in the "c" code.

nsm might be worth giving it a try, again, if they finally managed to fix 
those stupid problems with branch code size 'optimizing'. but, even if 
functional by now, I'd find half an hour - and even more! - of 'optimizing' 
passes for a 150K (stripped) binary completely inacceptable...
the macroes processing was inacceptably slow, as well.

I gave up because of falsly assembled ELF shared libraries code and that 
utterly stupid 'optimization' - both of which 'AS' manages well and, fastly!

by now, besides I don't really #like# it, 'cpp' plus 'as' fit my requirements 
much better than 'nasm'. plus, both are available in any linux distribution 
and their reliability is highly proven - with each and every linux C program.

> is full of conditional macros to support all the various flavors of UNIX.

C 'portability...
	is not much more than willingly narrowed consciousness.

>
> jeff (still looking for a asm project)

of what kind?
i.e, my current contribution is wrt Forth compilers/interpreters, only.

regards,
	hp
-- 
Linux,Assembly,Forth: http://www.lxhp.in-berlin.de/index-lx.shtml
  >> xxxx -at- lxhp -dot- in-berlin -dot- de <<


