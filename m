From: Scott Lanning <slanning@buphy.bu.edu>
Subject: Re: problem with printchar
Date: Wed, 24 Apr 2002 03:26:42 -0400
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.33.0204240321470.1939705-100000@buphy.bu.edu>
References: <web-5620564@m1.plasa.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <web-5620564@m1.plasa.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ssams <ssams@telkom.net>
Cc: linux-assembly@vger.kernel.org

On Wed, 24 Apr 2002, ssams wrote:
>i have this code
>.globl mulai
>mulai:
>   movl $4,%eax
>   movl $1,%ebx
>   movl $'a',%ecx

Wow, is that valid?
Anyway, %ecx should not be the value of 'a'
but rather a pointer to a buffer.

>   movl $1,%edx
>   int   $0x80
>   xorl  %eax,%eax
>   movl  $1,%eax

ITYM 'incl %eax'.

>   xorl  %ebx,%ebx
>   int   $0x80
>then i compile with
>as program1.s -o program1.o
>ld program1.o -o program1
>
>by this code i want print one char but there is no output.
>can anybody help me why..?

