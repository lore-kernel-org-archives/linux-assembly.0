From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: linking with ld
Date: Sun, 15 Sep 2002 15:34:50 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D848C7A.ADFEE75D@wp.pl>
References: <4.3.2.7.2.20020914112556.00bdb340@mail.ciudad.com.ar> <20020914225123.48cbc74e.lx@lxhp.in-berlin.de> <3D83F713.4860A455@students.mimuw.edu.pl>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Mateusz Srebrny wrote:
> 
> Hi,
> 
> I have question about ld.
> Precisely:
> I have an ELF object (produced by nasm) defining global procedure named
> start.
> I want to link it with object made by 'gcc -c' on file loking like this:
> 
> #include <stdio.h>
> 
> extern void start(void);
> 
> int main() {
>   start();
>   return 0;
> }
> 
> I tried 'ld main.o start.o -o main -lc'...

You can link it using gcc, not ld directly like this: gcc -o mail
main.o start.o. It should work just fine.

> it complained sth about not defining _start label, and then refused to
> execute main file (which was produced despite ld warnings)...

_start is the default entry point. If You won't create any global label
named _start in Your code then the ld doesn't know what to put in ELF
header as a starting point. You may set it explicitly using ld's -e
option which i think is the good solution if You can't link with gcc
like in above example.
 
> I wanted to do it with ld, 'couse I thought that linker is to link
> things...
> Of course linking it with gcc works, but again I thought that compiler
> is to compile things to objects...

gcc works with ld. gcc sends its results to ld.
 
> and the info for ld doesn't offer help in the matter... (at least I
> don't see it there)
> 
> I would be grateful for your help...
>         Mateusz Srebrny
> 
> PS the question "why do I want to link a nasm object with a C one?" is
> very difficult to answer... i just have to do it...

-- 
Maciej Hrebien

