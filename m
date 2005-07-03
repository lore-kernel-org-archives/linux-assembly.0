From: "Stephen Pelc" <stephen@mpeltd.demon.co.uk>
Subject: Re: new behavior with kernels 2.6.10+
Date: Mon, 4 Jul 2005 00:30:02 +0100
Message-ID: <42C8830A.14199.AAC6681@localhost>
References: <070320050307.12502.42C75678000A24E5000030D62205884484C0CF9D0A0B0E0AAD0A08AB@comcast.net>
Reply-To: Stephen Pelc <stephen@mpeltd.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <42C7F316.9040205@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

> Doesn't appear to have a writeable section at all. But "objdump
> -h" says:
> 
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>    0 .text         0000000c  00000000  00000000  00000034  2**2
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>    1 .data         00000000  00000000  00000000  00000040  2**2
>                    CONTENTS, ALLOC, LOAD, DATA
>    2 .bss          00000000  00000000  00000000  00000040  2**2
>                    ALLOC

I don't know if this is relevant, but under Suse 9.2 an 
executable program does not require any sections at all! 
Providing that your code (text) segment is marked as writable, 
everything is fine. Since an ELF file can be marked as RWX, my 
tests using Nasm producing a binary file, and constructing the 
ELF headers by hand, I can produce an ELF file that has three 
segments (interp, text, dynamic) that loads libc and calls 
printf.

According to a contact, the library loader does not require 
sections at all. Sections are only required by the the system 
linker, usually ld.

Stephen

--
Stephen Pelc, stephen@mpeltd.demon.co.uk
MicroProcessor Engineering Ltd - More Real, Less Time
133 Hill Lane, Southampton SO15 5AF, England
tel: +44 23 80 631441, fax: +44 23 80 339691
web: http://www.mpeltd.demon.co.uk - free VFX Forth downloads
