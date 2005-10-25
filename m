From: =?ISO-8859-1?Q?Gerardo_Garc=EDa_Pe=F1a?= <gerardo@kung-foo.dhs.org>
Subject: [Fwd: Re: printf without '\n']
Date: Tue, 25 Oct 2005 17:49:45 +0200
Message-ID: <435E5419.1060201@kung-foo.dhs.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040909000601070303000708"
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
To: linux-assembly@vger.kernel.org

This is a multi-part message in MIME format.
--------------040909000601070303000708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------040909000601070303000708
Content-Type: message/rfc822;
 name="Re: printf without '\\n'"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="Re: printf without '\\n'"

Message-ID: <435E530F.5020004@kung-foo.dhs.org>
Date: Tue, 25 Oct 2005 17:45:19 +0200
From: =?ISO-8859-1?Q?Gerardo_Garc=EDa_Pe=F1a?= <gerardo@kung-foo.dhs.org>
User-Agent: Debian Thunderbird 1.0.2 (X11/20050817)
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: Ricardo Catalinas Jimenez <th1nk3r@server01.org>
Subject: Re: printf without '\n'
References: <20051025151602.GA2904@jehuty.server01.org>
In-Reply-To: <20051025151602.GA2904@jehuty.server01.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Ricardo Catalinas Jimenez wrote:

>Newbie simple question:
>
>With a code like this:
>
>.section .data
>MSG:
>	.ascii "Hello\0"
>.section .text
>	.globl _start
>_start:
>	pushl %ebp
>	movl %esp, %ebp
>
>	pushl $MSG
>	call printf
>
>        movl %ebp, %esp
>        popl %ebp
>
>	movl $1, %eax
>	xorl %ebx, %ebx
>	int $0x80
>
>I compiled it with:
>as code.s -o code.o; ld --dynamic-linker /lib/ld-linux.so.2 -lc \
>	test.o -o test
>
>With that ascii string, nothing is printed but when I use "Hello\n\0" it
>works fine.=20
>
>What is the reason for not printing the string if there isn't a '\n' in
>it?
>
>I something related with the buffered (by lines) IO?
>
>Why with a C program it does not happend.
>
>Thanks in advance.
>
> =20
>
You should flush stdio(3) buffers before exiting. Try with fflush(3).
This program exits with the _exit(2) system call without flushing=20
buffers nor deinitializing C standard libraries.
If you try to exit with exit(3) libc it will work.

You can the behaviour of your current program with this simple C program:

  main()
  {
    printf("hello");
    _exit(0);
  }

If you change _exit(2) by exit(3) it will work...

Luck,
Gerardo Garc=EDa Pe=F1a


--------------040909000601070303000708--
