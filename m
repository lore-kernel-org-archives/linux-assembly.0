From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: Retrieving compilation flags from Executables / Object files
Date: Fri, 1 Aug 2003 05:44:01 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030801044401.45632.qmail@web41108.mail.yahoo.com>
References: <200307291812.08551.lx@lxhp.in-berlin.de>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200307291812.08551.lx@lxhp.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hp <lx@lxhp.in-berlin.de>
Cc: Assembly Linux <linux-assembly@vger.kernel.org>

Hello ,

 Compiling a *.c file using "gcc" on Linux with the 
flags  -S -fverbose-asm  , will give the complete 
list of compilation flags used in the output *.s file.

 Hope this info is useful .

Regards !


 --- hp <lx@lxhp.in-berlin.de> wrote: > Anticipating a
Reply am Dienstag, 29. Juli 2003
> 15:21:
> > Hi ,
> >
> >   Thank you for the response .
> >
> >   By compilation flags , I meant the
> > flags used for Optimization or otherwise
> > in general .
> 
> compilation flags aren't stored in the compiled
> binary.
> 
> you only might be able to very vaguely deduce from
> some characteristics how 
> those flags were set. for instance, if you see
> 		subl $4,esp
> 		addl $-8,esp
> 'optimization' was set to -O2 or lower level (w.
> GCC) because -O3 would have 
> compiled
> 		subl $12,esp
> instead. the 'no-frames' switch might also be
> deduceable, and a few others 
> but, most probably you'll never know whether your
> findings are correct.
> 
> best
> 	hp
> 
> -- 
> Linux,Assembly,Forth:
> http://www.lxhp.in-berlin.de/index-lx.shtml en/de
> 	FAQ(s) + DOCs at http://linuxassembly.org
>   pse, reply to << lx -at- lxhp -dot- in-berlin
> -dot- de >>
>  

________________________________________________________________________
Send free SMS using the Yahoo! Messenger. Go to http://in.mobile.yahoo.com/new/pc/
