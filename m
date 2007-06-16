From: "A D" <a_d_249@hotmail.com>
Subject: ModR/M byte and placement of control register contents
Date: Sat, 16 Jun 2007 17:20:17 -0400
Message-ID: <BAY133-F2702D95ED2A2ADC1741E96F51D0@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-assembly@vger.kernel.org

I'm a bit confused about the mov instruction that moves from or to control
register to or from general purpose register. In intel's x86 manual it says:

"At the opcode level, the reg field within the ModR/M byte specifies which 
of the
control registers is loaded or read. The 2 bits in the mod field are always 
11B. The
r/m field specifies the general-purpose register loaded or read."

So you can clearly see that segment register is specified by reg field and 
general
purpose register is specified by r/m field. My question is how processor 
knows looking at the intel instruction that now if i mov the contents of 
control register to general
purpose register(with the mov instruction), the processor now has to read 
contents from
control register(not load to control register) and write to(not read from)
general purpose register? Is there any special bit in the instruction format 
that
speciefies it? Thanks.

_________________________________________________________________
Windows Live Hotmail gives you the control you need to help you keep your 
e-mail private, safe and secure. See for yourself! 
www.newhotmail.ca?icid=WLHMENCA147

