From: Frederic Marmond <zebarbuc@free.fr>
Subject: Re: add.c:6: incompatible types in assignment
Date: Tue, 30 Nov 2004 13:39:31 +0100
Message-ID: <1101818371.41ac6a03c55e3@imp1-q.free.fr>
References: <20041130110749.82070.qmail@web52902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20041130110749.82070.qmail@web52902.mail.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: assembly <linux-assembly@vger.kernel.org>

you mistake about data and pointer format.

 Try somehing like this

 #include<stdio.h>
 #include<inttypes.h>
 typedef union
 {
         char        bytes[8];
         long long u64;
 }GoodType;
 int main()
 {
          uint8_t a[8]={1,2,3,4,5,6,7,8},b[8]={1,2,3,4,5,6,7,8},i;
          GoodType fooBar;
          fooBar.bytes[0]=1;
          fooBar.bytes[1]=2;
          fooBar.bytes[2]=3;
          fooBar.bytes[3]=4;
          fooBar.bytes[4]=5;
          fooBar.bytes[5]=6;
          fooBar.bytes[6]=7;
          fooBar.bytes[7]=8;
          asm("movq (%1), %%mm0 \n"
              "paddb (%0), %%mm0 \n"
              "movq  %%mm0, (%0) \n"
                  :"=r"(fooBar)
                  :"r"(a)
                  :"%mm0"
          );
          for(i=0;i<8;i++)
          printf("%d ",fooBar.bytes[i]);
          return 0;
 }

 Fred


Selon Ankit Jain <ankitjain1580@yahoo.com>:

> the program gives error at line 6
>
> add.c:6: incompatible types in assignment
>
>   1 #include<stdio.h>
>       2 #include<inttypes.h>
>       3 int main()
>       4 {
>       5         uint8_t
> a[8]={1,2,3,4,5,6,7,8},b[8]={1,2,3,4,5,6,7,8},i;
>       6         asm("movq (%1), %%mm0 \n"
>       7             "paddb (%0), %%mm0 \n"
>       8             "movq  %%mm0, (%0) \n"
>       9                 :"=r"(b)
>      10                 :"r"(a)
>      11                 :"%mm0"
>      12         );
>      13         for(i=0;i<8;i++)
>      14         printf("%d ",b[i]);
>      15         return 0;
>      16 }
>
>
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping"
> your friends today! Download Messenger Now
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
Fred Marmond
