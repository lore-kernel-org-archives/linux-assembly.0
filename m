From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Using gcc to compiler assembly
Date: Sun, 03 Nov 2002 19:26:30 +0100
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3DC56A56.BCC83059@wp.pl>
References: <F31en0bcaQUXPXF2aZc0000966c@hotmail.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Andrew Haydon wrote:
> 
> How to use GCC compiling assembly codes? I attached my example code and
> tried gcc -c -o foo.o foo.S. This line "typedef foo_bar_t int;" choked.

Yes, "typedef" isn't assembly directive nor asm instruction.

> I
> read the Makefiles for linux kernel and still could not understand how these
> assebmly codes were compiled by GCC.

Some of them are only preporcessed by gcc (-E flag) and then send to the
assembler, linker... Maybe asm code is passed to gcc streight, i don't
remember, but notice that the code isn't mixed in form Your example is.

If You mix C & assembly code try C's asm keyword, ie:

void foo()
{
   double a;

   /* ... */

   asm("fsin" : "=st" (a));
}

For details on how to pass arguments to asm() see gcc's man page.

It's the first solution. The second one is to separate Your asm and C
code in their own files. Assemble Your low level code to *.o and then
pass it to the C compiler. I think it's better solution but of course
it's Your code.

Regards,

-- 
Maciej Hrebien

