From: Stephan Walter <stephan.walter@gmx.ch>
Subject: Re: How interrupts work
Date: Fri, 23 Aug 2002 18:36:25 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20020823183625.0a22af1c.stephan.walter@gmx.ch>
References: <20020823112649Z318750-685+36066@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020823112649Z318750-685+36066@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

On Fri, 23 Aug 2002 08:30:51 -0300, RCS <cryptik@ig.com.br> wrote:

>   Thanks, but which assembler must I use for this code? GNU as? 
>   I'm asking that because I am only familiar with nasm. 

> >.data 
> >hello: 
> > .string "hello world\n" 
> >.text 
> >.globl _start 
> >_start: 
> > movl 4,%eax		// 4 - sys function 'write' 
> > movl 1,%ebx		// fd = fileno(stdio) 
> > movl $hello,%ecx	// buf = str 
> > movl $12,%edx	// count 
> > int $0x80 
> > 
> > movl 1,%eax 	// sys function 'exit' 
> > xorl %ebx,%ebx 
> > int $0x80 

This is GNU as syntax. You can use 'intel2gas' to convert from gas to
nasm and vice versa. (see
http://www.niksula.cs.hut.fi/~mtiihone/intel2gas )

Regards,
Stephan
