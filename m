From: m_hrebien@wp.pl
Subject: Re: gas' nop(s)
Date: Mon, 05 Aug 2002 19:53:41 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D4EBBA5.698AA14D@wp.pl>
References: <3D4D8E7F.8A393F62@wp.pl> <20020805102040.7d12bd33.*@lxhp.in-berlin.de>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

h-peter recktenwald wrote:
> 
> > Hi there,
> >
> > did You noticed that GNU as adds some padding nop(s) like:
> >
> > lea (%esi),%esi
> > mov %esi,%esi
> > nop
> >
> > at the end of .text section? Is this really necessary? The .text section
> > mustn't be padded to 4 like it seems to be or am i wrong? How can i
> > avoid this? Is there any gas option to switch this off?
> 
> some time back, i tried AS as an intermediate program, w. piped i/o, and
> encountered the same problem, which i didn't manage to solve, too. there
> is no option + no other idea. those gods of gnu binutils devel might know
> but, i myself never received an answer to any AS related question...
>
> anyway, AS wsn't meant to do plain, stand alone assembly but is designed
> to produceing a set of data which can be combined to something, probably
> executeable, with the "ld" linker.

Yes, it's gcc's back-end rather then stand alone assembler.

> so the implicite alignment might even
> be very helpful for faster processing.
>
> i'd (highly) recommend the "fasm" assembler for the more 'direct' work:)
>         http://fasm.metro-nt.pl/

:) Thanks, i'll check it...
 
> > Sorry if this topic is doubled by me but i couldn't find something
> > similar in the archive :(

Guess what? I've tried this .align directive as Jani Monoses suggested
like this:

.text

.align 1

.globl _start
_start:
	mov	$1,%eax
	xor	%ebx,%ebx
	int	$0x80

and it's not working as i wish - gas adds lea (%esi),%esi after int
$0x80 to the output :( I've tried with 2, 4, 8 & 16 and it seems that
.align x works good if x is greater equal than 4 :( But why??

-- 
Maciej Hrebien

