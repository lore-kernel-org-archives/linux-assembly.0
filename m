From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: which assembler to use : newbie query
Date: Mon, 31 Jul 2006 13:01:28 -0700
Message-ID: <44CE6198.6040101@sonoma.edu>
References: <a779d4420607310812w3be15123ja4902cb19bdaea3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <a779d4420607310812w3be15123ja4902cb19bdaea3b@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Only OpenSource <onlyopensource@gmail.com>
Cc: linux-assembly@vger.kernel.org

Only OpenSource wrote:
> Hello all
>
> I want to learn assembly language properly so that I can understand
> FreeBSD assembly code.
> Which assembler do I need to use : as or nasm.
>
> Please help me out.
If you wish to understand code that others have written, I recommend
learning the assembler they have used. (I don't have my FreeBSD running
right now, so I don't know what is commonly used.)

If you wish to understand the assembly "underneath" the C code, I
think as is better. You can use the -S switch in gcc to see what it
generates. This is especially useful if you use embedded assembly
code. Also, at least in Linux, you can use the objdump program to
disassemble object files, and it does in in as syntax.

My opinions are based on my writing a lot of assembly language
in industry during the 70s and 80s. I also taught the subject at
the university level from 1983 - 2004. This last gig prompted me
to write a 400-page textbook on the subject. The book is based on
the premise that one should almost never write in assembly language,
but it's important to understand how computers work at that level.
Most of my examples are written in C, then show what gcc generates
(using -S), then how it would be written in assembly language (at
least, my way of writing it). I use as in my book.

