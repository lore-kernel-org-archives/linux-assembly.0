From: Emanuele Altieri <ealtieri@hampshire.edu>
Subject: Re: i386: far jumps
Date: 22 Jul 2002 16:16:42 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <1027369002.1952.14.camel@italia>
References: <1026786087.2055.99.camel@italia> 
	<20020719174410.7c8f0d1f.lx@lxhp.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020719174410.7c8f0d1f.lx@lxhp.in-berlin.de>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: h-peter recktenwald <lx@lxhp.in-berlin.de>
Cc: Linux Assembly List <linux-assembly@vger.kernel.org>

On Fri, 2002-07-19 at 13:44, h-peter recktenwald wrote:
> On 15 Jul 2002 22:21:26 -0400
> Emanuele Altieri <ealtieri@hampshire.edu> wrote:
> 
> > Greetings,
> > 
> > I'm doing some experiments with far jumps to different code segments.
> > For example:
> > 
> >    ljmp *%fs:hello
> > 
> > I get a general protection error. I don't understand why. I believe it's
> > a notation error. Can anybody see it?
> > 
> > I'm interested in this because I need the segment argument of ljmp to be
> 
> 	Linux?

No (/ not yet). I'm just experimenting on Intel's segmentation and task
support with a small OS that I created for this purpose. I'm using GCC
and GAS to implement it.

By the way, I found a workaround to the ljmp problem:

    pushw <segment>
    pushl <offset>
    lret

For example

    pushw $16
    pushl $hello
    lret

This is equivalent to "ljmp $16, $hello", but now the segment and offset
arguments do not need to be constants.


  -Emanuele

