From: Lawrence <lawrencio@hotpop.com>
Subject: Using framebuffer device under Linux
Date: Tue, 18 Nov 2003 20:41:34 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3FBA137E.7000108@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi All,

I am planning to do graphic with asm under Linux without X11.  I am try
to use framebuffer as the "drawing plane".

I've reached the article entitled "Using the framebuffer device under
Linux" within http://linuxassembly.org and I've extracted and compiled
fb.n according to the instruction.  However, when I run "fb" under the
console in RH9, I only got a refresh and then back to the text console.

I've tried fb under the installation environment of Debian 3.0, with I
thought it is already in framebuffer mode, but still got a failure.


I've tried ald fb, but when it is going to switch to framebuffer mode,
Linux squeeze and I have to telnet into my linux box using another
machine and issue a reboot...

I can successfully run "leaves" under a-linux however, but I don't know
how to put fb under a-linux so as to see if it works, as there seems no
way to mount a floppy or access ethernet under a-linux.

Would anyone be so kind as to tell me how could I access linux
framebuffer correcely using assembly, or point me out the forgettable
steps in order to run 'fb' successfully?

my 'nasm -r' command spit out:

NASM version 0.98.22 compiled on Sep 19 2003

Thanks
Lawrence


