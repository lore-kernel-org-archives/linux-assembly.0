From: Martin <asmfreshmeat@gmx.de>
Subject: Re: GAS/GCC Assembler Code Modification
Date: Sat, 15 May 2004 22:08:19 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040515220819.3ffa6298@deepblack>
References: <20040515112807.579e4d89@deepblack>
	<200405151432.01409.wklux@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200405151432.01409.wklux@yahoo.co.uk>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

peter willy krause <wklux@yahoo.co.uk> wrote:

> Am Samstag, 15. Mai 2004 10:28 schrieb Martin:
> > I have a question regarding GAS and GCC.
> > Does the GAS modify the Assembler Code? If I try to assemble (for
> > example) the following line:
> >
> > popl %esi
> >
> > the gas changes that to
> >
> > pop %esi
> 
> though gas 'optimizes', which cannot be configured(!), in your example gas 
> doesn't, re listing by gas, itself! (my version ex binutils 2.14.90) - 
> apparently, your disassembler translates differently. compare the code...
> 
> the only 'optimization' by gas, which I'm aware of, is branches distance 
> coding and selection of alignment fill code. branches coding can be 
> forced to always 'long' (4 bytes) by declaring the destn label '.global'.
Alright.
 
> while assembling gas tries to deduce the oprands' formats by mnemonics and 
> register nameing and, tries some correction if the proper size specs were 
> missing, plus emanating a concerning warning (not an error!) message.
Ok. I guess here is my error in reasoning. I just wondered because in AlephOnes
Paper about Stacksmashing he printed the following code:

[...]
        popl   %esi         
        movl   %esi,0x8(%esi)
        movb   $0x0,0x7(%esi)
        movl   $0x0,0xc(%esi)
        movl   $0xb,%eax
        movl   %esi,%ebx              
        leal   0x8(%esi),%ecx         
        leal   0xc(%esi),%edx         
        int    $0x80                
        movl   $0x1, %eax		
        movl   $0x0, %ebx
[...]

After assembling with gas and disassembling with gdb I got the following code:
[...]
        pop   %esi         
        mov   %esi,0x8(%esi)
        movb   $0x0,0x7(%esi)
        movl   $0x0,0xc(%esi)
        mov   $0xb,%eax      
        mov   %esi,%ebx      
        lea   0x8(%esi),%ecx 
        lea   0xc(%esi),%edx 
        int    $0x80         
        mov   $0x1, %eax	
        mov   $0x0, %ebx	
[...]

But if you are right, the code above should be the same. 

But I still have one question. Wouldn't be the code from AlephOne bigger (bytesize)
than the code I got?

Best regards,
thanks for your help.
Martin
