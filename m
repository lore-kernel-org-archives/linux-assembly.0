From: Paul Irofti <bulibuta@gmail.com>
Subject: Re: 'defines.h' file not found
Date: Wed, 22 Jun 2005 00:09:43 +0000
Message-ID: <42B8AC47.8010804@gmail.com>
References: <42B8AB1B.5030408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <42B8AB1B.5030408@gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

Paul Irofti wrote:

> ofcourse, i need a header that has define directives as:
>
>
> ;output control
> %define NL 10
> %define STDIN 0
> %define STDOUT 1
> ...
> ;syscalls
> %define SYS_EXIT 1
> %define SYS_READ 3
> %define SYS_WRITE 4
> %define SYS_IOCTL 54
>
> ....
>
> and a sample code that can be found at www.linuxassembly.org is:
>
> .include "defines.h"
> .data
> hello:
>     .string "hello world\n"
>
> .globl    main
> main:
>     movl    $SYS_write,%eax
>     movl    $STDOUT,%ebx
>     movl    $hello,%ecx
>     movl    $12,%edx
>     int    $0x80
>
>     ret
>
>
> that's about it, i need this for an easier code writting. i can use 
> interrupts and numbers but a 'defines.h' would be nicer.
> thanks.
>
oh yeah, and the header snapshot that i gave is written in NASM syntax
which is Intel syntax similar. i need an AT&T syntax one...

