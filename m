From: an0nym@gmx.de
Subject: Re: GCC Optimization?
Date: Tue, 23 Nov 2004 10:22:46 +0100 (MET)
Message-ID: <25511.1101201766@www50.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org


>> But why do they use and .... I think and does only even %esp
>> so that the last 4 Bits are set to Zero. 
>> But if %esp was 0xcccccccc before it would now be 0xccccccc0
>> what happens to the 4 Bits from 0xccccccc0 to 0xcccccccc?
>> And what is this good for?
>
>The x86 push and pop instructions are much, much less efficient if the
>stack pointer is not dword-aligned. So if one function (say) pushes a
>segment register onto the stack, it can affect the performance of
>every function that is called from there.
Alright. Thanks!


>> Second question:
>> What does mov $0x0,%eax? Why dont they use xor %eax and what is it
>> good for?
>
>It zeros the accumulator, of course. As for why they don't use xor,
>why should they? What would be the advantage?
xor is imho a little bit faster than mov and xor %eax,%eax does the same
like mov $0x0,%eax. But I still don't know why the accumulator has to be
zeroed.


>> Third question: 
>> What is sub %eax,%esp good for? We subtract 0 from
>> esp... mmmhh... for what?
>
>Did you try building the same code with gcc optimizations turned on?
No I didn't use any optimiziation, I just thought of 'default'
optimiziations without turning -o2 or -o3 on.
So what is this code good for? I subtracts zero from %esp and saves the
result in %esp. So this code doesn't do anything with %esp. But I think
there should be a purpose?!

Best regards

-- 
Geschenkt: 3 Monate GMX ProMail + 3 Top-Spielfilme auf DVD
++ Jetzt kostenlos testen http://www.gmx.net/de/go/mail ++
