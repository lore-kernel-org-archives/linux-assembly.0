From: Robin Miyagi <penguin@dccnet.com>
Subject: Re: How to open a KDE window in Assembler ?
Date: Mon, 26 Aug 2002 08:48:57 -0700
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <B0310885543@yoda.dccnet.com>
References: <200208261516.11559.torelli@alpha.szn.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200208261516.11559.torelli@alpha.szn.it>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Are your GUI routines speed critical?  I would save assembler for the speed 
critical components of your program, e.g. those parts that are 
computationally intensive.  user interfaces (including graphical ones) spend 
most of their time idle awaiting input from the user.

I do not know anything about graphical user interfaces apart from using them. 
 Unless there is some major advantage to using a GUI (e.g. display of 
graphical data), I tend to code command line utilities.

There are places for C++, and their are places for assembler (which should be 
left as a last resort) -- use the correct language for the job (sed/awk/perl 
for text processing, shell scripts scripts for programmes that mainly execute 
other programs, and C/C++/assembler for system programming or speed critical 
applications such as scientific mathematical simulations :)  Ones (dis)like 
for a computer language should have no bearing on the choice of language(s) 
used.

Perhaps your needs might be already met with the GNUplot package.  Most Linux 
distributors include this package with their distributions.  I am sure you 
can download this package from authoritive free software sources (e.g. GNU, 
sourceforge.net).  The package called octave works on top of GNUplot, and 
serves as a computer algebra system.

P.S.  Have you cloned any humans yet?

On Monday 26 August 2002 06:16, Giuseppe Torelli wrote:
> Hi,
>
> Do you know how to open a KDE window in assembler ?
> I don't like C++, I would like to create a GUI with buttons and menu
> in assembler, could you help me ?
>
> Thanks

-- 
Robin Miyagi<penguin@dccnet.com>
http://www.geocities.com/SiliconValley/Ridge/2544/asm/assembler.html
Beware of penguins :-)

