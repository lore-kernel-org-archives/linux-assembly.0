From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: inside_SUB
Date: Mon, 16 Sep 2002 17:04:26 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D85F2FA.2723779D@wp.pl>
References: <web-49320142@m1.plasa.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

ssams wrote:
> 
> by this code bellow i want print new line with the simple
> way
> i sub first char "49" with 39. but i did not get output
> like what i want
> output from this code is
> 1>>
> when i look at ascii code this second char value is 187.
> would some body expalin me...?
> 
> regard
> 
> .data
>  msg: .byte 49
> .text
> .globl _start
> _start:
>         mov $msg,%ecx
>         mov $1,%ebx
>         mov $1,%edx
>         mov $4,%eax
>         int $0x80
> 
>         mov %ecx,%eax
>         sub $39,%eax

xchg "sub $39,%eax" with "sub $39,(%eax)". %eax have a ptr value & You
access a memory using this ptr!

>         #ul %ebx
>         mov %eax,%ecx
>         mov $4,%eax
>         int $0x80
> 
>         mov $1,%eax
>         int $0x80

-- 
Maciej Hrebien

