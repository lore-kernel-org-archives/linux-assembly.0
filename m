From: "Daniel R. Blair" <joecamel@realcoders.org>
Subject: Re: Device Driver Development in Assembly Language
Date: Wed, 14 Jul 2004 12:15:39 -0400 (EDT)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040714120441.W77640@codepoet.unixcoders.org>
References: <1089708694.5852.200244241@webmail.messagingengine.com>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <1089708694.5852.200244241@webmail.messagingengine.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Fikri Aydemir <facse238@fastmail.fm>
Cc: linux-assembly@vger.kernel.org

On Tue, 13 Jul 2004, Fikri Aydemir wrote:

>
> Hi,
>
> I am making a research on device driver development in assembly
> programming language for linux systems. I know that it is easier to
> write a device driver in C but my professor wants me to make it in
> Assembly language, preferably in Intel syntax.
>
> Is there anyone who has worked on device driver development? Do you know
> any resource such as a book or web site which I can benefit from? Thank
> you...

There are two good books that I have read that will help you a little, 
with one example for a device driver for the pc speaker as a timer or 
something.. one is the infamous "Assembly Language: Step by Step" now in 
it's 2nd edition.. and the other is a smaller book called "Linux Assembly 
Language" it is white with Purple writing for the words "Linux Assembly 
Language Programming" (it may have Programming as part of the title, I'm 
not 100% sure..) but, both of them are great.. the first one is by Jeff
Dunteman (search Amazon for the 2 titles about and you'll find them).. His 
first edition (Black cover, blue writing for title) was widely accepted 
and lovedby lots of ASM programmers, and when I saw he had a 2nd edition 
out, (White with Red writing for the Title) I had to get it and read it 
too.. it is a lot of the same, but, updated for use with new registers, 
instructions, etc.. as well as a section(s) in the back on Linux.. he uses 
NASM too.. so, check these two books out, you will not be dissatisfied.. 
they are excellent books to read and to use as references later on.. the 
one by Jeff Dunteman should be read first, in my opinion, as it is not 
only a classic, but also teaches general assembly language.. the 2nd book 
is more for assembly language programmers who want to write assembly 
language under Linux.. showing how to place your function name, and params 
on the stack, and then call the function for system calls and C Library 
functions, etc.. it's very useful and goes into more depth than Jeff 
Dunteman does in "Assembly Language: Step by Step" but, Jeff Dunteman also 
explains how to call C functions by placing their name and then their 
parameters, in reverse order (so they can be popped properly) on the stack 
for proper C library and system call execution.. so, at that point, going 
into the "Linux Assembly Language [Programming]" book, you'll have some 
knowledge already, and it will concentrate almost entirely on teaching you 
how to write assembly FOR LINUX (and I beleive most of the techniques and 
stuff in the book are applicable to other OSes, like FreeBSD, Solaris, 
etc..) but, some of the other Unixes out there I'm sure have a different 
way for doing different things.. especially device drivers =]  But, I use 
FreeBSD, not linux, and most of everything in the book worked fine for me 
on FreeBSD (altough I do always have Linux Emulation enabled.. so.. it 
may/may not have helped for anything.. not 100% sure, as I didn't try with 
and without..)

Check out those books and then you can go from there with books like 
"Linux Kernel Development" from Orielly, and "Inside the Linux Kernel" 
also from Orielly I think.. those may be the same book.. the title should 
be almost right, if not 100%, not sure though.. it will explain how the 
linux kernel works (scheduling algorithms, loading procedures, context 
switching, memory mapping and management methods, etc..) so, you can then 
take that information (how it is done under Linux) and then apply that to 
how to I do it like that, under assembly language..

Hope this helps,

Danny

                            = Daniel Blair =
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
- dblair@realcoders.org -                   [http://www.realcoders.org]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

