From: Stephen Ray <steve@mrmighty.net>
Subject: Re: OFF-TOPIC : Confusion about basic C program behaviour
Date: Thu, 10 Mar 2005 07:07:51 -0400
Message-ID: <42302A87.7020803@mrmighty.net>
References: <20050310100018.15303.qmail@web41113.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050310100018.15303.qmail@web41113.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ruxyz@yahoo.com
Cc: Linux Kernel Newbie <kernelnewbies@nl.linux.org>, Assembly Linux <linux-assembly@vger.kernel.org>

Just a thought, but not a particularly educated one.  Compiling with 
-Wall gives me:

test.c:4: warning: return type defaults to `int'
test.c: In function `main':
test.c:15: warning: int format, double arg (arg 3)
test.c:16: warning: int format, double arg (arg 2)
test.c:18: warning: int format, double arg (arg 2)
test.c:18: warning: int format, double arg (arg 3)
test.c:20: warning: control reaches end of non-void function

Looks like maybe the floats are automatically promoted to doubles before 
they are passed to printf.  I don't know if that's standard behaviour, 
but it seems reasonable.  So then in the first case, two 64-bit values 
are put on the stack, and two 64-bit values are taken off the stack.

In the second case, two 64-bit values are put on the stack, one 64-bit 
value is taken off the stack and presented correctly, and one 64-bit 
value has only the first 32 bits read, and misinterpreted as a signed int.

In the third case, two 64-bit values are put on the stack, and the first 
32 bits are interpreted as the first signed int, and the second next 64 
are interpreted as a double.  So case 3 is different from case 2 in that 
the double value in case 3 is made up of two halves of two different 
doubles, while in case 2 the double is made from an actual double.

Or something like that.
