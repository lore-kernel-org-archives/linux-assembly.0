From: Henio Paszczak <blurrpp@yahoo.com>
Subject: Re: literature for programming graphic card
Date: Sun, 14 Jan 2007 09:21:01 -0800 (PST)
Message-ID: <9686.91584.qm@web50313.mail.yahoo.com>
References: <d93f04c70701130123i472901adpb0f1817fd3d8000@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d93f04c70701130123i472901adpb0f1817fd3d8000@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvjunk@gmail.com>
Cc: linux-assembly@vger.kernel.org


--- Hendrik Visage <hvjunk@gmail.com> wrote:

> On 1/10/07, Henio Paszczak <blurrpp@yahoo.com>
> wrote:
> > Hi.
> > I'm looking for some good sources how to program
> > graphics card in Linux does any body something
> like
> > this :) ?
> 
> Source code would be the Xorg drivers and svgalib
> ;^P
> (See previous thread related to programming
> graphics,
> drawing lines etc.)
> 
> 
> > Second, for three days I've Pentium D processor
> and,
> > again , I'm looking for literature about
> programming
> > two core, there is a lot of stuff in Internet but
> > maybe some of You know something really good.
> 
> Refer to any text on SMP, threading, etc.
> It's the same things just now you have two cpus on
> the same
> silicon wafer enclosed and with pins added instead
> of one.
> 
> At least in Linux/Solaris you shouldn't have issues
> as long as you do the right
> things to create the threads/processes that'll be
> distributed by the OS
> over the available CPUs/cores.
> 
> -- 
> Hendrik Visage
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 

Thanks .. but i want to turn secund core alive, and i
don't know how. For example how to write program for
two cores .. first core is summing integers from memry
locations mem0-mem1, second core does the same but
with memory location (mem1+1)-mem2 ... , how to load
%eip register in second core and start it , and so one
.. :)
Lukas



 
____________________________________________________________________________________
No need to miss a message. Get email on-the-go 
with Yahoo! Mail for Mobile. Get started.
http://mobile.yahoo.com/mail 
