From: Learner <ruxyz@yahoo.com>
Subject: Re: OFF-TOPIC : Confusion about basic C program behaviour
Date: Thu, 10 Mar 2005 03:54:13 -0800 (PST)
Message-ID: <20050310115414.47387.qmail@web41101.mail.yahoo.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
In-Reply-To: 6667
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Ray <steve@mrmighty.net>
Cc: Linux Kernel Newbie <kernelnewbies@nl.linux.org>, Assembly Linux <linux-assembly@vger.kernel.org>

Hi Stephen ,

   Thanks for catching the float to double promotion 
in printf . The man page below confirms this .

#> man 3 printf

<snip>
The conversion specifier

f,F -    

The  double  argument  is  rounded  and  converted  to
 decimal  notation  in the style [-]ddd.ddd, where the
number of digits after the decimal-point character  is
 equal  to the  precision  specification.   If  the
precision is missing, it is taken as 6; if the        
     precision is explicitly zero, no decimal-point
character appears.  If a  decimal  point            
appears, at least one digit appears before it.

<snip>


    Just to confirm my understanding, if the code was 
changed as below :-

printf(" CASE 3 : d-f > %d - %f \n\n", (int)a1, a2);

only the first 32 bits of the float data a1 would be 
put on stack & then the 64 bit float value . 

This would be because printf is implemented as a 
var args function , so everything is literally copied 
to the stack. 

Hence, the output would be correct.

Thanks for fixing my basics ! 

--- Stephen Ray <steve@mrmighty.net> wrote:
> Just a thought, but not a particularly educated one.
>  Compiling with 
> -Wall gives me:
> 
> test.c:4: warning: return type defaults to `int'
> test.c: In function `main':
> test.c:15: warning: int format, double arg (arg 3)
> test.c:16: warning: int format, double arg (arg 2)
> test.c:18: warning: int format, double arg (arg 2)
> test.c:18: warning: int format, double arg (arg 3)
> test.c:20: warning: control reaches end of non-void
> function
> 
> Looks like maybe the floats are automatically
> promoted to doubles before 
> they are passed to printf.  I don't know if that's
> standard behaviour, 
> but it seems reasonable.  So then in the first case,
> two 64-bit values 
> are put on the stack, and two 64-bit values are
> taken off the stack.
> 
> In the second case, two 64-bit values are put on the
> stack, one 64-bit 
> value is taken off the stack and presented
> correctly, and one 64-bit 
> value has only the first 32 bits read, and
> misinterpreted as a signed int.
> 
> In the third case, two 64-bit values are put on the
> stack, and the first 
> 32 bits are interpreted as the first signed int, and
> the second next 64 
> are interpreted as a double.  So case 3 is different
> from case 2 in that 
> the double value in case 3 is made up of two halves
> of two different 
> doubles, while in case 2 the double is made from an
> actual double.
> 
> Or something like that.
> 
> --
> Kernelnewbies: Help each other learn about the Linux
> kernel.
> Archive:      
> http://mail.nl.linux.org/kernelnewbies/
> FAQ:           http://kernelnewbies.org/faq/
> 
> 


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Easier than ever with enhanced search. Learn more. 
http://info.mail.yahoo.com/mail_250
