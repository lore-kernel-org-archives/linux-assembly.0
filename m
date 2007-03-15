From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: cltq.
Date: Wed, 14 Mar 2007 18:01:34 -0700
Message-ID: <1173920494.5641.3.camel@ubuntu>
References: <a3399010703141717s6e9568f8qe8ecdae35206a79e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <a3399010703141717s6e9568f8qe8ecdae35206a79e@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ninjaboy <n0b0dyn1nj4@gmail.com>
Cc: linux-assembly@vger.kernel.org

I do not see this in my manual. So a google search turned up:
http://gcc.gnu.org/ml/gcc/2007-01/msg00613.html, which says it's the
same as the cdqe instruction.

Perhaps I can anticipate your next question. cdqe converts the
doubleword in eax to a quadword in rax with the same numerical value.


On Thu, 2007-03-15 at 01:17 +0100, ninjaboy wrote:
> hello,
> what does cltq do?
> 
> 0x0000000000400500 <my_m+4>:    movl   $0x0,0xfffffffffffffffc(%rbp)
> 0x0000000000400507 <my_m+11>:   jmp    0x40051b <my_m+31>
> 0x0000000000400509 <my_m+13>:   mov    0xfffffffffffffffc(%rbp),%eax
> 0x000000000040050c <my_m+16>:   mov    $0x4004e8,%edx
> 0x0000000000400511 <my_m+21>:   cltq
> 0x0000000000400513 <my_m+23>:   mov    %rdx,0xffffffffffffffa0(%rbp,%rax,8)
> 0x0000000000400518 <my_m+28>:   incl   0xfffffffffffffffc(%rbp)
> 0x000000000040051b <my_m+31>:   cmpl   $0xc,0xfffffffffffffffc(%rbp)
> 0x000000000040051f <my_m+35>:   jle    0x400509 <my_m+13>
> 
> what compares?
> Thanks in advance,


