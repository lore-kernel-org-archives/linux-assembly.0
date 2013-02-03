From: Robert Plantz <plantz@sonoma.edu>
Subject: RE: Disassembly  of  00000
Date: Sun, 3 Feb 2013 16:42:35 +0000
Message-ID: <6E3CF6FDA48EC747AAAE0EAEDF16EFF802C63791@coronet.solar.sonoma.edu>
References: <20130202045339.GD2391@debian.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20130202045339.GD2391@debian.localdomain>
Content-Language: en-US
Sender: linux-assembly-owner@vger.kernel.org
List-ID: <linux-assembly.vger.kernel.org>
To: horseriver <horserivers@gmail.com>, "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>

Section 9.3 of my textbook (www.lulu.com/spotlight/bobplantz) provides a *very brief* introduction to x86-64 machine language (0s and 1s) coding. If it would help you, I would be happy to send you a pdf copy of this section. A free preview copy of my book is available at bob.cs.sonoma.edu.

Please note that the discussion in my book only describes the general nature of how instructions are coded in bit patterns. But once you understand this, I think it is obvious that trying to "disassemble" a set of random bit patterns would be meaningless. One could make some educated guesses, but there is no way to know for sure.

Back in the 70s, I heard of programmers who would write code such that a particular group of bits would be treated as (a) and instruction, (b) constant data, or (c) an address, depending on where it was accessed in the program flow. Back in those days, we used assembly language to write self-modifying code. I once did it for a driver on a CT scanner. Memory was expensive in those days.

Bob

________________________________________
From: linux-assembly-owner@vger.kernel.org [linux-assembly-owner@vger.kernel.org] on behalf of horseriver [horserivers@gmail.com]
Sent: Friday, February 01, 2013 8:53 PM
To: linux-assembly@vger.kernel.org
Subject: Disassembly  of  00000

hi:)

   I have a question about disassemblly utility .
   If I fill an elf's text section with some random data,then
   how does the disas command work for these data?
   Is there occasion that several sequence of bytes can not be translated
   into legal instructions?

thanks!

--
To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html