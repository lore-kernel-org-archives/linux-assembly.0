From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: Seg Fault
Date: Sat, 25 Jan 2003 17:05:08 -0800 (PST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15923.13380.688560.172281@eidolon.muppetlabs.com>
References: <200301251939.05251.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200301251939.05251.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dAvId KeDrOsKy <davidkedrosky@rogers.com>
Cc: linux-assembly@vger.kernel.org

> Can somebody help me out with why I'm getting a segmentation fault
> All I'm trying to do is send some text to stdout.

Take out the "ret" line. You have an appropriate exit syscall at the
end -- let that execute instead of trying to return.

b


> section         .model small
> section         .stack 100h
> 
> section         .data
> mesg            db      'Some message',0ah, 0
> 
> section         .text
> 
> global  _start
> _start:
> 
>         mov     eax, 4
>         mov     ebx, 1
>         mov     ecx, mesg
>         mov     edx, 13
>         int        0x80
>         ret
> 
>         mov     eax, 1
>         xor     ebx, ebx
>         int     0x80
