From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: Re: paddw vs paddb
Date: Sat, 25 Dec 2004 07:21:42 +0000 (GMT)
Message-ID: <20041225072142.80563.qmail@web52908.mail.yahoo.com>
References: <41CBDACD.1C92968D@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <41CBDACD.1C92968D@wp.pl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_hrebien@wp.pl
Cc: assembly <linux-assembly@vger.kernel.org>

thanks

but if u can solve one more problem

'a' is uint8_t type and i want to extract only 4 int
and store it as a word in mmx register

i am not able to understand that because movq is
extracting 8 bytes at a time. 

actually the problem is overflow. saturation is not
tht helpfull

thanks

ankit jain
 --- Maciej Hrebien <m_hrebien@wp.pl> wrote: 
> Ankit Jain wrote:
> > 
> >       1 #include<stdio.h>
> >       2 #include<inttypes.h>
> >       3 int main()
> >       4 {
> >       5         uint8_t
> > a[8]={1,2,3,4,5,6,7,8},b[8]={1,2,3,4,5,6,7,8},i;
> >       6         asm("movq (%1), %%mm0 \n"
> >       7             "paddb (%0), %%mm0 \n"
> >       8             "movq  %%mm0, (%0) \n"
> >       9                 :
> >      10                 :"r"(b),"r"(a)
> >      11                 :"%mm0"
> >      12         );
> >      13         for(i=0;i<8;i++)
> >      14         printf("%d ",b[i]);
> >      15         return 0;
> >      16 }
> >      17
> > Both the programs give the same output
> > 
> > WHY IS IT SO? i am using paddb and paddw. it
> dosent
> > make any diff?
> 
> Insert to a or b value for which a[i]+b[i]>255 where
> i is odd
> and you will see the difference, ie. a[7]=255.
> 
> -- 
> Maciej Hrebien
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
>  

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
