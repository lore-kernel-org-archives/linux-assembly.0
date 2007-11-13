From: ninjaboy <n0b0dyn1nj4@gmail.com>
Subject: Re: Trouble Creating File
Date: Tue, 13 Nov 2007 18:17:23 +0000
Message-ID: <a3399010711131017l19496a7cuf51804aba48f2a5@mail.gmail.com>
References: <394554.37517.qm@web45114.mail.sp1.yahoo.com>
	 <67BAE09A2D3D814E8F23BE11A200140E3A7B21@usaflcms06.usa-spaceops.ksc.nasa.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=42O0obAXZWRZbBsBs/y0Gn25kvTFtQlUcScv6Ybv/XQ=;
        b=RL4E6rZI3JKFm7l8O3dnl3o5bmwm4UPYpEHLKzSWp+HcOXj0yXz/p3r3zQ40N0eQBBMyXDiwrk2Jsj6xCSyFhHU4vc8vmSaS8C/LyKULxlgHUAXrEIXGiJHSVkbV2xEb8/a+slQ9yDeL2GbvuWnDCjUeHsiN1gD1pLqECK0VIRM=
In-Reply-To: <67BAE09A2D3D814E8F23BE11A200140E3A7B21@usaflcms06.usa-spaceops.ksc.nasa.gov>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "LaPoint, Adam W" <Adam.W.LaPoint@usa-spaceops.com>
Cc: Liam Prange <oasisbhrnw99@yahoo.com>, linux-assembly@vger.kernel.org

2007/11/13, LaPoint, Adam W <Adam.W.LaPoint@usa-spaceops.com>:
> Change
>   movl ( %eax ), %ebx    #save the fd
> to
>   movl %eax, %ebx
>
>
> -----Original Message-----
> From: linux-assembly-owner@vger.kernel.org
> [mailto:linux-assembly-owner@vger.kernel.org]On Behalf Of Liam Prange
> Sent: Tuesday, November 13, 2007 7:58 AM
> To: linux-assembly@vger.kernel.org
> Subject: Trouble Creating File
>
>
> Hi all,
>
> I am new to assembly language and I am having trouble
> writing a program that creates a file.  The file does
> get created, however, the program always causes a
> segmentation fault.  The program is called "test" and
> you give the name of the file you wish to create as an
> argument, like so:  ./test create.txt
>
> ..section .data
> ..section .bss
> ..lcomm BUFFER, 500
> ..section .text
> ..globl _start
> _start:
>
>   movl %esp, %ebp  #setup for referencing the stack
>
>   #Open/Create the file we are writing to
>   movl $5, %eax
>   movl 8( %ebp ), %ebx
>   movl $03101, %ecx
>   movl $0666, %edx
>   int $0x80
>   movl ( %eax ), %ebx    #save the fd
>
>   #close the file
>   movl $6, %eax
>   int $0x80
>
> Can anyone help me out as to why I am getting the
> segmentation fault?
>
and

_start:
         pushl %ebp
         movl %esp, %ebp
....
-- 
noone is alone.
