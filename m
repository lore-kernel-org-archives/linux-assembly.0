From: asmfreshmeat@gmx.de
Subject: GCC Optimization?
Date: Tue, 23 Nov 2004 01:26:34 +0100 (MET)
Message-ID: <2462.1101169594@www25.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

Hello,

where is one question I didnt found a good answer. 
When I'm disassembling the main function with gdb or objdump
I see always code like this:

0x08048354 <main+0>:    push   %ebp
0x08048355 <main+1>:    mov    %esp,%ebp
0x08048357 <main+3>:    sub    $0x8,%esp
0x0804835a <main+6>:    and    $0xfffffff0,%esp
0x0804835d <main+9>:    mov    $0x0,%eax
0x08048362 <main+14>:   sub    %eax,%esp

I understand what the first 3 lines are good for. Pushing the 
Basepointer, moving the Basepointer to the Stackpointer,
reserving 8 Bytes on the stack for variables.

But why do they use and .... I think and does only even %esp
so that the last 4 Bits are set to Zero. 
But if %esp was 0xcccccccc before it would now be 0xccccccc0
what happens to the 4 Bits from 0xccccccc0 to 0xcccccccc?
And what is this good for?

Second question:
What does mov $0x0,%eax? Why dont they use xor %eax and what is it good for?

Third question: 
What is sub %eax,%esp good for? We subtract 0 from esp... mmmhh... for what?

Best regards

-- 
Geschenkt: 3 Monate GMX ProMail + 3 Top-Spielfilme auf DVD
++ Jetzt kostenlos testen http://www.gmx.net/de/go/mail ++
