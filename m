From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: paddw vs paddb
Date: Thu, 23 Dec 2004 10:59:49 +0000 (GMT)
Message-ID: <20041223105949.5295.qmail@web52903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: assembly <linux-assembly@vger.kernel.org>

      1 #include<stdio.h>
      2 #include<inttypes.h>
      3 int main()
      4 {
      5         uint8_t
a[8]={1,2,3,4,5,6,7,8},b[8]={1,2,3,4,5,6,7,8},i;
      6         asm("movq (%1), %%mm0 \n"
      7             "paddb (%0), %%mm0 \n"
      8             "movq  %%mm0, (%0) \n"
      9                 :
     10                 :"r"(b),"r"(a)
     11                 :"%mm0"
     12         );
     13         for(i=0;i<8;i++)
     14         printf("%d ",b[i]);
     15         return 0;
     16 }
     17
Both the programs give the same output

WHY IS IT SO? i am using paddb and paddw. it dosent
make any diff?

  1 #include<stdio.h>
      2 #include<inttypes.h>
      3 int main()
      4 {
      5         uint8_t
a[8]={1,2,3,4,5,6,7,8},b[8]={1,2,3,4,5,6,7,8},i;
      6         asm("movq (%1), %%mm0 \n"
      7             "paddd (%0), %%mm0 \n"
      8             "movq  %%mm0, (%0) \n"
      9                 :
     10                 :"r"(b),"r"(a)
     11                 :"%mm0"
     12         );
     13         for(i=0;i<8;i++)
     14         printf("%d ",b[i]);
     15         return 0;
     16 }
     17
~

ankit jain



________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
