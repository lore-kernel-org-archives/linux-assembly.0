From: Scott Lanning <slanning@theworld.com>
Subject: Re: looping_code
Date: Sat, 31 Aug 2002 02:17:18 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.40.0208310210540.117091029-100000@shell01.TheWorld.com>
References: <web-43200817@m1.plasa.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-43200817@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

On Mon, 26 Aug 2002, ssams wrote:
> .data
> msg: .byte 65,10
>
> .text
>    .globl mulai
> mulai:
>     mov $10,%edx
>
> ulang:
>   mov $4,%eax
>   mov $1,%ebx
>   mov $msg,%ecx

This moves the value at 'msg'
rather than a pointer to 'msg'.
Try this:

    leal msg, %ecx

Also, how many times do you think it will loop? :)
(hint: which register is the loop counter)

>   int $0x80
>   loop ulang
>
>   mov $1,%eax
>   int $0x80

