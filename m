From: Johann Oskarsson <myrkraverk@users.sourceforge.net>
Subject: Re: Preprocessing Assembly
Date: Fri, 02 May 2003 19:22:53 +0000
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3EB2C58D.60005@users.sourceforge.net>
References: <3EAAA2CC.3000606@users.sourceforge.net> <200304271030.h3RAUDPi013804@hirsch.in-berlin.de> <3EAF13FC.4050402@users.sourceforge.net> <200304300633.h3U6XA9L031703@hirsch.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: hp <lx@lxhp.in-berlin.de>, linux-assembly@vger.kernel.org

Hi,

MASP can now be found on the web: 
http://cosmos.raunvis.hi.is/~johannos/masp/
This is just a trial version so far.  The only changes are that 
directives now start with \ instead of ., so this no longer conflicts 
with the underlying assembler.  And mips directives in particular.  I've 
yet to add a command line parameter to change this char, but it can be 
done easily.

hp wrote:

>[snip]
>
>some versions of CPP insert a blank after "<<".
>thus you can't use a '#define'd string which contains multiple text elements 
>as a macro argument w. GASP because of it's  (imho) very silly delimiting 
>convention which takes a comma as well as a blank space for the .macro 
>arguments delimiter but provides no means to pass a parameter which consists 
>of more than a single piece of text. NO way round! no bracees, brackets... 
>  
>
I'll try to fix this one day, don't know if it'll be soon though.

>[snip]
>
>further, the temporary radix setting of GASP is un-useable. 
>	movl $H'12345,eax	(I tried any possible variant)
>
I've changed the base syntax in masp, it now uses 0[bhqd]<number> for 
strange bases instead of the ugly [BHQD]'<number> syntax.  Although I 
haven't released that version yet, I can do so now and/or emailed it if 
anyone asks.  This also means that 'c' character constants can now be 
passed to the assembler.

>[snip]
>
>imho, due to bad design:
>macro args can't be addressed by their numeric position in the arguments list.
>no means to analyzing the addressing mode of an argument.
>no cross-ref listing (something similar, which most often is quite useless).
>
I'm not sure if/when I can address this, most of the changes I make, is 
to fix something that simply pisses me off!

>[snip]
>
>...(more in the list included in the F4 archive)...
>
>just mentioned. I'll leave that for later...
>
I haven't had a close look on the F4 but I will perhaps in the future.


Johann


P.S. You've mentioned a lot of stuff, and I wish I could fix them all 
but I'm still familiarizing myself with the code and capabilities of 
gasp.  I can perhaps do more if you try masp and send me some bug reports.

