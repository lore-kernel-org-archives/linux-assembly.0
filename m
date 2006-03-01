From: Marcin =?utf-8?q?Ko=C5=9Bcielnicki?= <markosc@interia.pl>
Subject: Re: grub thing
Date: Wed, 1 Mar 2006 15:42:50 +0100
Message-ID: <200603011542.51608.markosc@interia.pl>
References: <200602222126.57346.thiago.silva@kdemail.net> <20060301071033.0c9eb1d4.amerei@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060301071033.0c9eb1d4.amerei@gmail.com>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> i'm looking at a disassembly of grub's stage 1. and i wanna know why it
> need's to CLI before setting up the environment??

It's because it sets the stack address -- otherwise, interrupt could occur 
between mov to ss and mov to sp, which would use invalid stack address and be 
lethal.

Also, it has NOTHING to do with lack of interrupt handlers -- BIOS has 
handlers for all interrupts needed for bootstrap, and the others are 
disabled. No bad thing can happen. In fact, it re-enables interrupts right 
after setting the stack (sti)

> i tried to interpret it 
> line by line and this is what i have so far
>
>  00007C4A  FA			cli			; disable interrupt
>  00007C4B  80CA80		or dl,0x80          ; correct boot drive byte
>  00007C4E  EA537C0000	jmp 0x0:0x7c53	; jmp to next inst
>  00007C53  31C0		xor ax,ax           ; zero ax
>  00007C55  8ED8		mov ds,ax		; zero data segment
>  00007C57  8ED0		mov ss,ax		; zero stack segment
>  00007C59  BC0020		mov sp,0x2000	; 8 kilobytes
>  00007C5C  FB			sti			; enable interrupt
>
> also, since the origin is at 0000:7c00h i figured that must imply that "mov
> sp, 0x2000" means that the stack starts at 0x7c00+0x2000 = 9c000 right?

No.

>  00007C57  8ED0		mov ss,ax		; zero stack segment
>  00007C59  BC0020		mov sp,0x2000	; 8 kilobytes

Here, ss==0 and sp==0x2000. Stack starts at ss*0x10+sp == 0x0*0x10+0x2000 == 
0x2000. Also, remember it grows down.

----------------------------------------------------------------------
Kliknij po wiecej! >>> http://link.interia.pl/f18ed

