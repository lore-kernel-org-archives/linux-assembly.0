From: Learner <ruxyz@yahoo.com>
Subject: OFF-TOPIC : Confusion about basic C program behaviour
Date: Thu, 10 Mar 2005 02:00:18 -0800 (PST)
Message-ID: <20050310100018.15303.qmail@web41113.mail.yahoo.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Newbie <kernelnewbies@nl.linux.org>, Assembly Linux <linux-assembly@vger.kernel.org>

Hi,

  I know this is not the correct place to post this
question, but I feel it would be pretty easy for the
kernel gurus to explain this.  

TEST CODE
==========

#include <stdio.h>

main()
{
   float a1=1.0;
   float a2=2.0;

   printf(" \n");
   printf(" Size of Float > %d \n", sizeof(float) );
   printf(" Size of Int   > %d \n", sizeof(int) );
   printf(" \n");

   printf(" CASE 1 : f-f > %f - %f \n\n", a1, a2);
   printf(" CASE 2 : f-d > %f - %d \n\n", a1, a2);
   printf(" CASE 3 : d-f > %d - %f \n\n", a1, a2);
   printf(" CASE 4 : d-d > %d - %d \n\n", a1, a2);
}

OUTPUT :

 Size of Float > 4
 Size of Int   > 4

 CASE 1 : f-f > 1.000000 - 2.000000

 CASE 2 : f-d > 1.000000 - 0

 CASE 3 : d-f > 0 - 0.000000

 CASE 4 : d-d > 0 - 1072693248

==================================

The CASE1 & CASE2 & CASE4 outputs are expected.

   Any explanation for CASE3 behaviour. 
   I presume it should behave similar to CASE2 and
print 0 - 2.000000 .

   Could somebody please pin-point what is 
lacking in my presumtion .

Thanks !



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Easier than ever with enhanced search. Learn more. 
http://info.mail.yahoo.com/mail_250
