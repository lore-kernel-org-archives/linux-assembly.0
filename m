From: =?iso-8859-1?q?Ankit=20Jain?= <ankitjain1580@yahoo.com>
Subject: extended asm+pointers
Date: Wed, 11 Aug 2004 10:00:12 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040811090012.14095.qmail@web52905.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly <linux-assembly@vger.kernel.org>

hi

well i want to understand how assembler treats
pointers?

my code is:

      1	#include<inttypes.h>
      2
      3
      4 int main()
      5 {
      6   uint8_t
a[8]={1,2,3,4,5,6,7,8},b[8]={0,0,0,0,0,0},i;
      7   uint8_t *m,*m1;
      8 
      9   m=a;
     10   m1=b;         //i have pointed m1 to b
     11   for(i=0;i<8;i++)
     12      printf("%d ",a[i]);
     13   printf("\n");
     14   asm("movq (%1), %%mm0 \n"
     15       "movq %%mm0, (%0) \n"
     16       :"=r"(m1)
     17       :"r"(m)
     18       );
     19 
     20   for(i=0;i<8;i++)
     21      printf("%d ",b[i]);
     22   return 0;
     23 }
well this problem is not solved yet. because when i
display b array then it prints all 0's. according to
me since i have initialised this m1 pointer then by b
then b whould have all the values which i have moved

some have advised me to use arrays here as constraint
but i want to use pointers. i am using r constraint
and it says it says that m1 will use a register (i
guess there is no problem in that)

what is the complete problem HOW THIS ASSEMBLER IS
TREATING THIS POINTER m1?

thanks 

ankit jain

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
