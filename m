From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: system_read() question
Date: Mon, 3 Feb 2003 14:53:58 -0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15934.62214.452869.59727@eidolon.muppetlabs.com>
References: <200302031700.40580.davidkedrosky@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200302031700.40580.davidkedrosky@rogers.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Say I do something like this:
> 
>         mov     eax, 3          ;setup for system read()
>         mov     ebx, 0          ;receive input from stdin (keyboard)
>         mov     ecx, foo_input  ;input will act as a storage place for data
>         int     0x80            ;syscall interrupt
> 
> Does anything get added to the storage array (foo_input) after my
> input. Like the null or CR character?

We don't know the value of edx, so who know what will happen?

You need to set edx to the size of your input buffer (foo_input).

b
