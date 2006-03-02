From: Aleph One <amerei@gmail.com>
Subject: Re: grub thing
Date: Thu, 2 Mar 2006 06:46:34 +0000
Message-ID: <20060302064634.5acb6f7c.amerei@gmail.com>
References: <200602222126.57346.thiago.silva@kdemail.net>
	<20060301071033.0c9eb1d4.amerei@gmail.com>
	<200603011542.51608.markosc@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200603011542.51608.markosc@interia.pl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Marcin =?UTF-8?Q?Ko=C5=9Bcielnicki?= <markosc@interia.pl>
Cc: linux-assembly@vger.kernel.org

On Wed, 1 Mar 2006 15:42:50 +0100
Marcin Ko=C5=9Bcielnicki <markosc@interia.pl> wrote:

~> i'm looking at a disassembly of grub's stage 1. and i wanna know why=
 it
~> need's to CLI before setting up the environment??
~
~It's because it sets the stack address -- otherwise, interrupt could o=
ccur=20
~between mov to ss and mov to sp, which would use invalid stack address=
 and be=20
~lethal.

ahh! i see i see. it's for protection.

~
~Also, it has NOTHING to do with lack of interrupt handlers -- BIOS has=
=20
~handlers for all interrupts needed for bootstrap, and the others are=20
~disabled. No bad thing can happen. In fact, it re-enables interrupts r=
ight=20
~after setting the stack (sti)
~
~> i tried to interpret it=20
~> line by line and this is what i have so far
~>
~>  00007C4A  FA			cli			; disable interrupt
~>  00007C4B  80CA80		or dl,0x80          ; correct boot drive byte
~>  00007C4E  EA537C0000	jmp 0x0:0x7c53	; jmp to next inst
~>  00007C53  31C0		xor ax,ax           ; zero ax
~>  00007C55  8ED8		mov ds,ax		; zero data segment
~>  00007C57  8ED0		mov ss,ax		; zero stack segment
~>  00007C59  BC0020		mov sp,0x2000	; 8 kilobytes
~>  00007C5C  FB			sti			; enable interrupt
~>
~> also, since the origin is at 0000:7c00h i figured that must imply th=
at "mov
~> sp, 0x2000" means that the stack starts at 0x7c00+0x2000 =3D 9c000 r=
ight?
~
~No.
~
~>  00007C57  8ED0		mov ss,ax		; zero stack segment
~>  00007C59  BC0020		mov sp,0x2000	; 8 kilobytes
~
~Here, ss=3D=3D0 and sp=3D=3D0x2000. Stack starts at ss*0x10+sp =3D=3D =
0x0*0x10+0x2000 =3D=3D=20
~0x2000. Also, remember it grows down.

one note. why must (ss*0x10)?

~
~----------------------------------------------------------------------
~Kliknij po wiecej! >>> http://link.interia.pl/f18ed
~
~-
~To unsubscribe from this list: send the line "unsubscribe linux-assemb=
ly" in
~the body of a message to majordomo@vger.kernel.org
~More majordomo info at  http://vger.kernel.org/majordomo-info.html
-
To unsubscribe from this list: send the line "unsubscribe linux-assembl=
y" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
