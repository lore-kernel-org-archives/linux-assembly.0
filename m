From: Bharanidharan S <S.Bharanidharan@ftel.co.uk>
Subject: Re: OFF-TOPIC : Confusion about basic C program behaviour
Date: Thu, 10 Mar 2005 11:39:23 +0000
Message-ID: <423031EB.C9F46349@ftel.co.uk>
References: <20050310100018.15303.qmail@web41113.mail.yahoo.com> <42302A87.7020803@mrmighty.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: kernelnewbies-bounce@nl.linux.org
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <linux-assembly.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:ecartis-owner@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Ray <steve@mrmighty.net>
Cc: ruxyz@yahoo.com, Linux Kernel Newbie <kernelnewbies@nl.linux.org>, Assembly Linux <linux-assembly@vger.kernel.org>


Stephen Ray wrote:
> 
> Looks like maybe the floats are automatically promoted to doubles before
> they are passed to printf.  I don't know if that's standard behaviour,
> but it seems reasonable.  So then in the first case, two 64-bit values
> are put on the stack, and two 64-bit values are taken off the stack.

it seems to be a feature in C.
 [ from another mailing list:
  
https://lists.openafs.org/pipermail/openafs-devel/2003-July/009525.html 
 ]

The text from the ISO 1999 standard in 6.5.2.2 is:

6 If the expression that denotes the called function has a type that
does
  not include a prototype, the integer promotions are performed on each
  argument, and arguments that have type float are promoted to
  double. These are called the default argument promotions. [...]

7 If the expression that denotes the called function has a type that
does
  include a prototype, the arguments are implicitly converted, as if by
  assignment, to the types of the corresponding parameters, taking the
  type of each parameter to be the unqualified version of its declared
  type. The ellipsis notation in a function prototype declarator causes
  argument type conversion to stop after the last declared parameter.
The
  default argument promotions are performed on trailing arguments.


also check glibc's manual (may be out of date ??):
http://www.cs.utah.edu/dept/old/texinfo/glibc-manual-0.02/library_28.html#SEC478


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

--
Kernelnewbies: Help each other learn about the Linux kernel.
Archive:       http://mail.nl.linux.org/kernelnewbies/
FAQ:           http://kernelnewbies.org/faq/

