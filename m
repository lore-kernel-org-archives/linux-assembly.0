From: =?iso-8859-1?q?Anticipating=20a=20Reply?= <ruxyz@yahoo.com>
Subject: Re: calculating byte
Date: Thu, 24 Jul 2003 07:13:52 +0100 (BST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20030724061352.5198.qmail@web41109.mail.yahoo.com>
References: <web-3860654@b1.c.plasa.com>
Reply-To: ruxyz@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-3860654@b1.c.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ssams <ssams@telkom.net>, linux-assembly@vger.kernel.org

Hi ,

  You can find this by looking at the 
Machine Opcodes required for each instruction .
  
Bye 

 --- ssams <ssams@telkom.net> wrote: > hi all
> if u have time, please answer my following question
> i try to learn more about assembly. in a time
> i'found some 
> article that explain about exploit, and i get this 
> following code. My question is.. how to calculate
> byte at 
> each line..?
> thnaks before
> regard
> ssams
>             .....
>             ..... 
>             movl %esi,array-offset(%esi) # 3 bytes
>             movb $0x0,nullbyteoffset(%esi)# 4 bytes
>             movl $0x0,null-offset(%esi) # 7 bytes
>             movl $0xb,%eax # 5 bytes
>             movl %esi,%ebx # 2 bytes
>             leal array-offset,(%esi),%ecx # 3 bytes
>             leal null-offset(%esi),%edx # 3 bytes
>             int $0x80 # 2 bytes
>             ....
>             ....
>
===========================================================================================
> "TELKOMNet Instan Divre VI Kalimantan memberikan
> DISKON PROGRESSIVE kepada para pengguna 
> TELKOMNet-Instan hingga 50% mulai bulan Juli hingga
> September 2003." 
>
===========================================================================================
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
http://vger.kernel.org/majordomo-info.html 

________________________________________________________________________
Send free SMS using the Yahoo! Messenger. Go to http://in.mobile.yahoo.com/new/pc/
