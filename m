From: "Robert G. Plantz" <plantz@SONOMA.EDU>
Subject: Re: Using 'C' functions
Date: Mon, 01 Dec 2003 07:55:10 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <BE68EA0E-2416-11D8-8DC1-003065A88832@sonoma.edu>
References: <20031201152410.97628.qmail@web8007.mail.in.yahoo.com>
Mime-Version: 1.0 (Apple Message framework v552)
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <20031201152410.97628.qmail@web8007.mail.in.yahoo.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mutts kutts <dearestchum@yahoo.co.in>
Cc: linux-assembly@vger.kernel.org

The easiest way is to simply use gcc (not ld) for the
linking phase. Allow me to illustrate.

I teach assembly language under linux. My students have
been using an IDE (CodeWarrior), and I want them to see
the separate phases used to create an executable program.
I also want them to understand the concepts behind a
makefile. However, since these are sophomores, I feel
it's too much for them to link in all the C libraries
"by hand."

Here's an example of a portion of a makefile I have them
use:

default: calculator

calculator: calculator.o writeStr.o readStr.o sIntToDec.o sDecToInt.o \
uIntToDec.o uDecToInt.o
	gcc calculator.o writeStr.o readStr.o sIntToDec.o sDecToInt.o \
uIntToDec.o uDecToInt.o -o calculator  -Wl,-Map -Wl,calculator.map

calculator.o: calculator.s
	as --gstabs calculator.s -o calculator.o -al > calculator.lst

writeStr.o: writeStr.s
	as --gstabs writeStr.s -o writeStr.o -al > writeStr.lst

etc.....

There are, of course, many ways to clean up this makefile.
Again, my point is to teach the students the concepts, not
to simply get the job done.

--Bob

On Monday, December 1, 2003, at 07:24  AM, mutts kutts wrote:

> Dear friend!
> I want to know how to use 'C' library functions
> in assembly code.Please tell me where to look for.
>
> Right now I am discontent with system calls alone.
> How do I use the linker to detect the 'C' library
> files?
>
> Cheers
> Muthu.
>
-------------------------------------------------------
Robert G. Plantz, PhD			|
Professor of Computer Science	| cs.sonoma.edu/~bob
Sonoma State University			| plantz@sonoma.edu
1801 E. Cotati Ave.				| ph: 707.664.2806
Rohnert Park, CA 94928			| fax: 707.664.3012

