From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: how_shifting_bit
Date: Mon, 16 Sep 2002 17:17:33 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D85F60D.D5089C7E@wp.pl>
References: <web-49321140@m1.plasa.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

ssams wrote:
> 
> /* i am trying building some code with instruction 'shl'
> i have a little problem when print second char. this is my
> code
> want somebody correct it...?
> regard */
> .data
>  msg: .byte 0b111111    #char'?'
>  baris_baru: .byte 10
>  .text
>  .globl _start
>  _start:
>         mov $4, %eax    /* fungsi syscall - write */
>         mov $1, %ebx    /* file handler forstdout */
>         mov $1, %edx
>         mov $msg, %ecx
>         int $0x80       /* do syscall */
> 
>         mov $msg,%eax
>         mov $1,%cl
>         shl %cl,%eax    #eax=111 1110 = '~'
>         movzwl %ax,%ecx

xchg this two lines with:

shl %cl,(%eax)
mov %eax,%ecx

>         mov $4, %eax    /* fungsi syscall - write */
>         int $0x80
> /* after char '?' i want print '~'. No output generated
> what and where it wrong..?*/
> 
>         mov $baris_baru,%ecx
>         mov $4, %eax    /* fungsi syscall - write */
>         int $0x80
> 
>         mov $1,%eax
>         int $0x80
> can anybody explain me please..?
> regard.

-- 
Maciej Hrebien

