From: Stephan Walter <stephan.walter@gmx.ch>
Subject: Re: asmutils 0.17
Date: Sun, 18 Aug 2002 18:37:16 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020818183716.24b4e303.stephan.walter@gmx.ch>
References: <Pine.LNX.4.43L.0208171734360.1025-100000@alpha.linuxassembly.org>
	<20020817181020.28d3a051.stephan.walter@gmx.ch>
	<20020818140104.47feb4ca.lx@lxhp.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020818140104.47feb4ca.lx@lxhp.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Sun, 18 Aug 2002 14:01:04 +0000, h-peter recktenwald
<lx@lxhp.in-berlin.de> wrote:

> On Sat, 17 Aug 2002 18:10:20 +0200
> Stephan Walter <stephan.walter@gmx.ch> wrote:
> 
> > truss.asm should be updated. As a label of a "dd" statement it uses
> > "pause", which is a reserved word in NASM 0.98.33 (and possibly in
> > all the 0.98.xx versions).
> 
> why not asking nasm 'developers' to sticking to more reasonable
> nameing?
> 
> > The file MCONFIG or the Makefile respectively should be changed to
> > allow compiling with NASM 0.98.33 (and higher) as well.
> 
> 'optimizing' nasm is un-safe!
 
Can somebody tell me what is so bad about the newer NASM versions? If
you don't like auto-optimization, leave it turned off.


BTW: This list seems to f*** up reply addresses. If I click "reply" in
Sylpheed, the To: adress is the one of the original author and not the
list address.

Regards,
Stephan
