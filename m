From: Ribamar Santarosa de Sousa <ribamar@fee.unicamp.br>
Subject: Re: newbie question about integers size/portabilty.
Date: Tue, 28 Dec 2004 21:52:27 -0200
Message-ID: <20041228235227.GA28029@ic.unicamp.br>
References: <20041228122916.GA7137@ic.unicamp.br> <opsjpz0szcuqea3r@sucks.airplane.fire> <16849.57445.118809.760890@eidolon.muppetlabs.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16849.57445.118809.760890@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Raiter <breadbox@muppetlabs.com>
Cc: linux-assembly@vger.kernel.org

> > I seem to recall seeing macros in C code like sizeof(int) used to
> > figure out the size of things and then conditionally compile code.
> 
> sizeof isn't a macro, actually, and it cannot be used to conditionally
> compile code. For most cases, you can simply rely on the guaranteed
> sizes I mentioned above. If you're dealing with circumstances in which
> you really need to know EXACT sizes, then your best option is to use
> the macros in <limits.h>. In this header file are defined macros such
> as CHAR_BIT, INT_MIN, ULONG_MAX, etc etc etc.
> http://www-ccs.ucsd.edu/c/limits.html shows what the ANSI C standard
> defines. (POSIX defines a number of other macros to be included.)
> 

I really needed of documentation on data syzes  and no code would save me
because i don't have all the machines 
that the code could work. The code was written with (i guess) not with the
best pratices in this point, it uses int, short , long instead the data 
types defined in linux/types.h (__u16, __s8, ...)... I am making these 
changes and in the future no one will need worry about size of data 
structures. 

And thanks Brian for the corrections on some points touched by Cooper :)
Riba



