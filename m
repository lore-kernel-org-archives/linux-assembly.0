From: Frank Kotler <fbkotler@comcast.net>
Subject: Re:
Date: Mon, 31 Oct 2005 20:33:02 -0500
Message-ID: <4366C5CE.8080709@comcast.net>
References: <20051101025814.f5vl0yjbflnkkcso@webmail.itu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20051101025814.f5vl0yjbflnkkcso@webmail.itu.edu.tr>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sabancia@itu.edu.tr
Cc: linux-assembly@vger.kernel.org

sabancia@itu.edu.tr wrote:
> Hi everyone,
> I am a computer engineering student in Turkey. I came across your web site while
> I was searching how to generate Intel 80x86 assembly code of a C file by using
> gcc. I compiled my C code (a5.c) like this:
> gcc -S a5.c -o a5.s
> but the a5.s output file contains the assembly code in AT&T syntax.
> 
> I wanted to learn what I should do to get the code generated in Intel 80x86
> syntax, if it's possible.

Adding "-masm=intel" will (may) get you closer. I can't figure out how 
to get it to do the "noprefix" part of ".intel_syntax noprefix", so I 
still get the "%"s. You might be better off to let gcc generate at&t 
syntax and convert to Intel with "intel2gas" (which works either way) or 
"a2i". You might still have to do some "hand editing".

Best,
Frank

