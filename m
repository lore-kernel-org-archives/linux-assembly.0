From: Robert Plantz <plantz@sonoma.edu>
Subject: Re: suffix or operands invalid for
Date: Fri, 22 Dec 2006 08:16:21 -0800
Message-ID: <1166804181.4573.20.camel@localhost>
References: <d5418ffc0612211839n531644f2x11f8afc4f293f1dd@mail.gmail.com>
	 <458BD4BB.1050502@verizon.net>
	 <d5418ffc0612220618ra72b5dfpcca0312c356b45ce@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <d5418ffc0612220618ra72b5dfpcca0312c356b45ce@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kenton Brede <kbrede@gmail.com>
Cc: linux-assembly@vger.kernel.org

On Fri, 2006-12-22 at 08:18 -0600, Kenton Brede wrote:
> On 12/22/06, Frank Kotler <fbkotler@verizon.net> wrote:
> 
> At any rate I tried:
> 
> $ as --32 power.s -o power.o
> 
> $ ld power.o -o power
> 

First, at this point, if you do
    gcc -m32 power.o -o power
gcc will go directly to the ld phase (since it can tell that power.o is
already compiled/assembled). But the big advantage is that gcc will
automatically link in any C libraries needed to run your code. That is,
it links in all the set up stuff so you can start your programs with a
"main" function.

Then "main" functions will need to do:
           .globl  main
main:      pushl   %ebp        # save caller's base pointer
           movl    %esp, %ebp  # establish our base pointer
        # add to %esp for local vars here
        # save registers used in this function
        # now your code goes here
        # restore registers
           movl    $0, %eax    # return 0; for our shell
           movl    %ebp, %esp  # get rid of local var space on stack
           popl    %ebp        # for our caller
           ret
You can see how gcc does this by writing a main function in C, then
doing
       gcc -m32 -S foo.c
The "-S" (yes, that's upper case S) produces foo.s, which is gcc's
assembly language version of foo.c. You will lots of messing around with
the stack pointer beyond what I've shown above. I think that's to keep
the stack pointer on "nice" addressing boundaries. But what I've shown
above gets the job done while learning this stuff.

Next, I don't know what distro you're running. I run both Ubuntu Edgy
and Debian Etch. On these distros I needed to install the libc6-dev-i386
package. I also have ia32-libs and libc6-i386 installed.

Before I installed libc6-dev-i386, the error message I got when I
invoked the link stage (using gcc as above) was
   bob@debian:~$ gcc -m32 yes_no2.o -o yes_noxx
   /usr/bin/ld: skipping incompatible /usr/bin/../lib/libc.so when
searching for -lc
   /usr/bin/ld: skipping incompatible /usr/bin/../lib/libc.a when
searching for -lc/usr/bin/ld: skipping incompatible /usr/lib/libc.so
when searching for -lc
   /usr/bin/ld: skipping incompatible /usr/lib/libc.a when searching for
-lc
   /usr/bin/ld: cannot find -lc
   collect2: ld returned 1 exit status
   bob@debian:~$ gcc -m32 yes_no2.o -o yes_noxx

(Sorry for the word wrapping here; hope you can read it.)


On earlier Unbuntu releases, I think the required things were in
different packages, but I'm not sure.

Bob



