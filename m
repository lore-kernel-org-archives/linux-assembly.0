From: peter willy krause <wklux@yahoo.co.uk>
Subject: Re: GAS/GCC Assembler Code Modification
Date: Sat, 15 May 2004 14:32:01 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200405151432.01409.wklux@yahoo.co.uk>
References: <20040515112807.579e4d89@deepblack>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20040515112807.579e4d89@deepblack>
Content-Disposition: inline
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin <asmfreshmeat@gmx.de>
Cc: linux-assembly@vger.kernel.org, linux-assembly@mlists.in-berlin.de

Am Samstag, 15. Mai 2004 10:28 schrieb Martin:
> Hi folks,
>
> I have a question regarding GAS and GCC.
> Does the GAS modify the Assembler Code? If I try to assemble (for
> example) the following line:
>
> popl %esi
>
> the gas changes that to
>
> pop %esi

though gas 'optimizes', which cannot be configured(!), in your example gas 
doesn't, re listing by gas, itself! (my version ex binutils 2.14.90) - 
apparently, your disassembler translates differently. compare the code...

the only 'optimization' by gas, which I'm aware of, is branches distance 
coding and selection of alignment fill code. branches coding can be 
forced to always 'long' (4 bytes) by declaring the destn label '.global'.

while assembling gas tries to deduce the oprands' formats by mnemonics and 
register nameing and, tries some correction if the proper size specs were 
missing, plus emanating a concerning warning (not an error!) message.


best,
	hp
-- 
mail to 'hp': lx at lxhp : in-berlin : de

