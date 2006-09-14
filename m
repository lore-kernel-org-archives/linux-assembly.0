From: Henio Paszczak <blurrpp@yahoo.com>
Subject: hint?
Date: Thu, 14 Sep 2006 12:58:52 -0700 (PDT)
Message-ID: <20060914195852.88791.qmail@web50313.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi.
I've read hint in some magazine that if you are not
using the same registers in following lines new
procesor ( my is quite old PIII(coppermine)600Mhz )
can make commands syumyltaniously ie:

mov %eax,%ebx
mov %ecx,%edx

can be does allmost in the same time. i've check it by
using extremly simple example:

movl $3,%ebx
movl $3,%edx
movl $0b111111111111111111111111111,%ecx

loop:
sall $2,%eax
orl  %ebx,%eax
sall $2,%edi
orl  %edx,%edi
   loop loop

it works ( agains theorem from magazine ) faster then

movl $3,%ebx
movl $3,%edx
movl $0b111111111111111111111111111,%ecx

loop:
sall $2,%eax
sall $2,%edi
orl  %ebx,%eax
orl  %edx,%edi
   loop loop

so what is real answer ?
Secund i'he allways trying not to use moemory becouse
its extremly slow .

nut again if i exchange walue between registers with
using temporary memory:

movl %eax,temp
movl %ebx,%eax,
movl temp,%ebx

it works faster than:

movl %eax,%edx
movl %ebx,%eax,
movl %edx,%ebx

WHY? maybe linux is doing something in the mean time
... ?

amaizing hink is that 

xchgl %eax,%ebx

works slowest :) WHY ?

I realy need time in my programs thats why i'm looking
for any optimalization...

Lukas
 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
