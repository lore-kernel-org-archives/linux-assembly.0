From: Lukas <blurrpp@yahoo.com>
Subject: Re: getting at raw command line
Date: Thu, 13 Sep 2007 10:15:26 -0700 (PDT)
Message-ID: <570602.5548.qm@web50303.mail.re2.yahoo.com>
References: <2cf50a010709130801y5c4538f2p5fdfae95954f8b52@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <2cf50a010709130801y5c4538f2p5fdfae95954f8b52@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

As i said, when you start program 'p whatever ' %esp
points place on stack where number of parameters was
put ex. 
$p 1 2 3 -> movl (%esp),%ecx => %ecx=3 )

next (%esp+4) adress of program name ex. 

$/home/usr/bin/p 1 2 3 -> (%esp+4) adres of string
"/home/usr/bin/p"

(%esp+8)(+16 if you have 64-bit arch) adress of text
string of first parameter, so if you write

$ p * -> movl (%esp+8),%ecx / movq (%rsp+16),%rcx
        movl (%ecx),%ebx / movq (%rcx),%rbx
       %ecx=42 ( '*' )
so now you can do with it whatever you want ( write
using SYS_WRITE, printf etc )
Lukas


--- Jack Andrews <effbiae@gmail.com> wrote:

> the shell changes arguments like * to a number of
> arguments.  is there
> a way to get the *?  that is, if my program is p, i
> want this
> behaviour:
> 
>  $ ls
>  file.1 file.2
>  $ ls *
>  file.1 file.2
>  $ p file.1
>  file.1
>  $ p *
>  *
> 
> i don't want
> 
>  $ p *
>  file.1 file.2
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



       
____________________________________________________________________________________
Pinpoint customers who are looking for what you sell. 
http://searchmarketing.yahoo.com/
