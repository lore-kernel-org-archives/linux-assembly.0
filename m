From: Jean-Yves Lamoureux <jylam@lnxscene.org>
Subject: Re: GAS colorr pixel problem
Date: Wed, 22 Nov 2006 20:42:40 +0100
Message-ID: <4564A830.30105@lnxscene.org>
References: <BAY22-F21A1B6BB16CDD02A834E41F5E30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY22-F21A1B6BB16CDD02A834E41F5E30@phx.gbl>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

A D wrote:
> Hello there! I'm new to x86 gnu assembly language and
> trying to learn it. I've a question: is it possible to draw
> a filled rectangle on monitor using gas? How do i
> color individual pixel on my monitor? If anyone can
> just give me the theory behind it or be kind enough to
> write the source code I would appreciate it. Thanks.
gas is just an assembler. You can do whatever you want with an 
assembler, as every single executed bit on your processor is the output 
of an assembler (ok purists, I just simplified).
"Filling a rectangle" means nothing. You have to draw something that 
will be interpreted as a bunch of pixels having the sahpe of a 
rectangle. You can do that in ascii (libcaca for example, 
http://libcaca.zoy.org ), or in graphic mode (SVGAlib, old as hell but 
works on most PC cards, without X), X11 (which itself has dozen of low 
(xlib) and high (sdl, ptc, gtk, qt, whatever) level libraries to do that).

I suggest you to learn how to call C-like functions (pushing arguments, 
calling function), how to work with memory (lea, syscalls, brk, etc), 
then to use something like SDL for example, which does most of the work 
for you.

Good luck.

-- 
Jean-Yves Lamoureux
Software Developper

