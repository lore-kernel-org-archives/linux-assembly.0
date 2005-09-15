From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: How to Use the vm86 System Call
Date: Thu, 15 Sep 2005 16:48:18 -0400
Message-ID: <op.sw5v2ltgnro9m0@winfuck>
References: <20050915195205.20599.qmail@web26002.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20050915195205.20599.qmail@web26002.mail.ukl.yahoo.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Claudio Fontana <sick_soul@yahoo.it>
Cc: linux-assembly@vger.kernel.org

On Thu, 15 Sep 2005 15:52:04 -0400, Claudio Fontana <sick_soul@yahoo.it> wrote:

> (gdb) ptype struct vm86plus_info_struct
> type = struct vm86plus_info_struct {
>     long unsigned int force_return_for_pic : 1;
>     long unsigned int vm86dbg_active : 1;
>     long unsigned int vm86dbg_TFpendig : 1;
>     long unsigned int unused : 28;
>     long unsigned int is_vm86pus : 1;
>     unsigned char vm86dbg_intxxtab[32];
> }

Yes, that's about where I'm at.  The questions I have are along the lines of "what does is_vm86pus do?" and "how do I put all of this together into a working program?"

I don't think reading any source code is going to do me any good.  Typically, comments only cover what the program is doing, not the details of the system calls.  When was the last time you read a comment like "open() will open the file, the first operand is a pointer to a null terminated string, which is the file we want to open..."  Granted, I could figure out things like the file name, but the source is just going to set is_vm86pus to 1 or 0 and probably never mention what it does, forcing me to wonder if maybe I should be setting it the other way for what I'm doing.

On the other hand, what else have I got to do?  (besides learn windows)  Assuming I can still get Linux to boot (lilo did a fun number on my windows drive and I haven't yet seen if the Linux one still works or not), I'll have a look and see if I can figure anything out.  I know that dosemu, svgalib, and X all use vm86, so maybe between the three of them I can at least figure out half of it.

> However, I would rather use SDL instead.

That would be the easy thing to do, but SDL just uses X or SVGAlib depending on where it's run under X or on a console, and so it won't get me anything that those two won't.  SVGAlib is just too unstable for me to want to use it, and only some of the X drivers support mode switching, the others require to you restart the X server to change modes, and if you're using the X framebuffer driver, you have to reboot Linux as well.  It used to be that you never had to reboot Linux for anything short of installing a new kernel, but the state of graphics support is changing that.  With this vm86 call I'm hoping to get things to where they should be, you decide you want a different mode and two seconds later you've got it, no restarts or reboots required.
