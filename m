From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: looping_code
Date: Mon, 26 Aug 2002 16:59:20 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D6A4248.680E5EDE@wp.pl>
References: <web-43200817@m1.plasa.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

ssams wrote:
> 
> i really new in linux assembly. i want to know how i loop
> some code..?
> i feel it is different with tasm, i have try tasm way for
> looping but
> it was not run cleanly in gnu assembly. are there any body
> want to help me....?

I think it's NTG but lets see...

> by this code:
> 
> .data
> msg: .byte 65,10
> 
> .text
>    .globl mulai
> mulai:
>     mov $10,%edx

Why $10 if Your msg is two bytes long?

> ulang:
>   mov $4,%eax
>   mov $1,%ebx
>   mov $msg,%ecx
>   int $0x80
>   loop ulang
> 
>   mov $1,%eax
>   int $0x80

-- 
Maciej Hrebien

