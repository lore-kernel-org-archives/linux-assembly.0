From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: jump_code
Date: Fri, 06 Sep 2002 21:59:22 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D79091A.6D77404F@wp.pl>
References: <web-46559356@m1.plasa.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

You have wrong value in edx register when calling kernel's write
routine!

> I build this code , iget output but i little bug ithink.
> i hope some body be correct it..
> 
> .data
>  msg1: .ascii "Mencetak Saya\n"
> msg2: .ascii "\nKok saya dilompati sih\n"
> msg2_len: .long .-msg2
> msg3: .ascii "Hai ini pesen ketiga "
> msg3_len: .long .-msg3
> 
> .text
>         .globl _start
> _start:
>         mov $4,%eax
>         mov $1,%ebx
>         mov $msg1,%ecx
>         mov $14,%edx
>         int $0x80
> 
>         jmp pesan3
> pesan2:
>         mov $4,%eax
>         mov $1,%ebx
>         mov $msg2,%ecx
>         sub $24,%edx

Change "sub $24,%edx" to "mov msg2_len,%edx".

>         int $0x80
> 
>         mov $1,%eax
>         xor %edx,%edx
>         xor %ecx,%ecx
>         int $0x80
> pesan3:
>         mov $3,%ecx
>    ulang:
>           push %ecx
> 
>         mov $4,%eax
>         mov $1,%ebx
>         mov $msg3,%ecx
>         sub $21,%edx

Change "sub $21,%edx" to "mov msg3_len,%edx".

>         int $0x80
>         pop %ecx
>         dec %ecx
>         jnz ulang
>         jmp pesan2
> 
> Output
>         Mencetak Saya
>         Hai ini pesen ketiga
>         Hai ini pesen ketiga
>         Hai ini pesen ketiga
>         Kok saya dilompati sih
>         Hai ini pesen ketiga
> 
> my questio is ..
> why the third message is printing for one again in the end
> of output
> althought no instruction point it..?

Regards,

-- 
Maciej Hrebien

