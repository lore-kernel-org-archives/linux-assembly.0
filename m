From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: How to Use the vm86 System Call
Date: Thu, 15 Sep 2005 18:07:10 -0400
Message-ID: <op.sw5zp8fmnro9m0@sucks.airplane.fire>
References: <20050915195205.20599.qmail@web26002.mail.ukl.yahoo.com> <op.sw5v2ltgnro9m0@winfuck>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.sw5v2ltgnro9m0@winfuck>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

On Thu, 15 Sep 2005 16:48:18 -0400, Richard Cooper  
<peajay@funrestraints.com> wrote:

> I'll have a look [at various source codes]and see if I can figure  
> anything out.

Damn, I wish I would have just done that right from the beginning...

Turns out SVGAlib does all of the vm86 stuff through a file called  
lrmi.c.  So I looked in lrmi.c and at the top is this comment about how  
it's the "Linux Real Mode Interface" and some other stuff that makes it  
sound an awful lot like public domain.

So I went and found the "Linux Real Mode Interface" and downloaded it.

It's just a few C files along with a makefile to make a little test  
program.  It looks pretty nice, at least the test program compiled without  
warnings and didn't require me to install any libraries, and as an added  
surprise, worked without a problem.  (looks like all the test program does  
is let you pick a VESA mode, then it sets it for five seconds, then  
restores the old mode, but that's enough to say that it works)

Since it's mostly compatible with public domain, I don't even have to try  
to figure out how it works, I can just use it.  I'm not sure if the test  
program does VBE 1.2 or not, but I'm sure I can figure that out on my own.

I'd still like to know how that vm86 call works, but this should work just  
fine for what I'm doing.

It's so nice to be in Linux again...  Copy and paste doesn't work in  
Windows.  (At least not with the middle mouse button, which is how I  
usually do it.)

Interestingly, I've learned that there're 357 people signed up to this  
mailing list.  I had no idea.  I thought it was more like 20 or 30.
