From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: paddw vs paddb
Date: Fri, 24 Dec 2004 10:01:01 +0100
Message-ID: <41CBDACD.1C92968D@wp.pl>
References: <20041223105949.5295.qmail@web52903.mail.yahoo.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Ankit Jain wrote:
> 
>       1 #include<stdio.h>
>       2 #include<inttypes.h>
>       3 int main()
>       4 {
>       5         uint8_t
> a[8]={1,2,3,4,5,6,7,8},b[8]={1,2,3,4,5,6,7,8},i;
>       6         asm("movq (%1), %%mm0 \n"
>       7             "paddb (%0), %%mm0 \n"
>       8             "movq  %%mm0, (%0) \n"
>       9                 :
>      10                 :"r"(b),"r"(a)
>      11                 :"%mm0"
>      12         );
>      13         for(i=0;i<8;i++)
>      14         printf("%d ",b[i]);
>      15         return 0;
>      16 }
>      17
> Both the programs give the same output
> 
> WHY IS IT SO? i am using paddb and paddw. it dosent
> make any diff?

Insert to a or b value for which a[i]+b[i]>255 where i is odd
and you will see the difference, ie. a[7]=255.

-- 
Maciej Hrebien

