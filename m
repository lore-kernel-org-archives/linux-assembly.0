From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: add.c:6: incompatible types in assignment
Date: Tue, 30 Nov 2004 11:07:49 +0000 (GMT)
Message-ID: <20041130110749.82070.qmail@web52902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: assembly <linux-assembly@vger.kernel.org>

the program gives error at line 6

add.c:6: incompatible types in assignment
   
  1 #include<stdio.h>
      2 #include<inttypes.h>
      3 int main()
      4 {
      5         uint8_t
a[8]={1,2,3,4,5,6,7,8},b[8]={1,2,3,4,5,6,7,8},i;
      6         asm("movq (%1), %%mm0 \n"
      7             "paddb (%0), %%mm0 \n"
      8             "movq  %%mm0, (%0) \n"
      9                 :"=r"(b)
     10                 :"r"(a)
     11                 :"%mm0"
     12         );
     13         for(i=0;i<8;i++)
     14         printf("%d ",b[i]);
     15         return 0;
     16 }


________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
