From: Bharanidharan S <S.Bharanidharan@ftel.co.uk>
Subject: Re: OFF-TOPIC : Confusion about basic C program behaviour
Date: Thu, 10 Mar 2005 11:44:10 +0000
Message-ID: <4230330A.469D5747@ftel.co.uk>
References: <20050310100018.15303.qmail@web41113.mail.yahoo.com> <42302A87.7020803@mrmighty.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Ray <steve@mrmighty.net>
Cc: Linux Kernel Newbie <kernelnewbies@nl.linux.org>, Assembly Linux <linux-assembly@vger.kernel.org>

use this option to prove your hypothesis:
-fshort-double

this would make sizeof(double) = sizeof(float)
by this, stack problems should go away.
but this is not a suffested compiler options because of portability
issues.


Stephen Ray wrote:
> 
> Just a thought, but not a particularly educated one.  Compiling with
> -Wall gives me:
> 
> test.c:4: warning: return type defaults to `int'
> test.c: In function `main':
> test.c:15: warning: int format, double arg (arg 3)
> test.c:16: warning: int format, double arg (arg 2)
> test.c:18: warning: int format, double arg (arg 2)
> test.c:18: warning: int format, double arg (arg 3)
> test.c:20: warning: control reaches end of non-void function
> 
> Looks like maybe the floats are automatically promoted to doubles before
> they are passed to printf.  I don't know if that's standard behaviour,
> but it seems reasonable.  So then in the first case, two 64-bit values
> are put on the stack, and two 64-bit values are taken off the stack.
> 
> In the second case, two 64-bit values are put on the stack, one 64-bit
> value is taken off the stack and presented correctly, and one 64-bit
> value has only the first 32 bits read, and misinterpreted as a signed int.
> 
> In the third case, two 64-bit values are put on the stack, and the first
> 32 bits are interpreted as the first signed int, and the second next 64
> are interpreted as a double.  So case 3 is different from case 2 in that
> the double value in case 3 is made up of two halves of two different
> doubles, while in case 2 the double is made from an actual double.
> 
> Or something like that.
> 
> --
> Kernelnewbies: Help each other learn about the Linux kernel.
> Archive:       http://mail.nl.linux.org/kernelnewbies/
> FAQ:           http://kernelnewbies.org/faq/
