From: "Richard Cooper" <peajay@funrestraints.com>
Subject: How to Use the vm86 System Call
Date: Thu, 15 Sep 2005 14:04:47 -0400
Message-ID: <op.sw5ohxaknro9m0@winfuck>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org


Does anyone know how to make use of the vm86 system call?  The man page for it is pretty light on the details, and the names of the fields of the structures in the header file aren't very explanatory.

All I can seem to find on the internet is stuff like this:

16:02:17 <SLACKo> anyone knows how to use vm86() ?
16:02:24 <SLACKo> system call
16:02:59 <SLACKo> how can I creat the struct  vm86plus_struct
16:03:03 <SLACKo> ?
16:03:15 <SLACKo> I couldn't find any documentation on that
16:06:53 <air>        #include <sys/vm86.h>
16:07:13 <air>  /usr/include/sys/vm86.h
16:07:22 <air> all the documentation u could ever want
16:07:48 <SLACKo> couldn't find what the struct members should contain
16:07:55 <SLACKo> :(
16:08:23 <SLACKo> struct vm86plus_struct {
16:08:24 <SLACKo>         struct vm86_regs regs;
16:08:24 <SLACKo>         unsigned long flags;
16:08:24 <SLACKo>         unsigned long screen_bitmap;
16:08:24 <SLACKo>         unsigned long cpu_type;
16:08:26 <SLACKo>         struct revectored_struct int_revectored;
16:08:26 <SLACKo>         struct revectored_struct int21_revectored;
16:08:28 <SLACKo>         struct vm86plus_info_struct vm86plus;
16:08:36 <SLACKo> };

It seems so hopeless.

I was working on a new Softer-like thing, except that it would work in framebuffer mode too, and it would just provide video access rather than all of that "orange protocol" stuff.  However, I'm writing it to use with a game that I want to release as shareware, but if the game is shareware, then I want it to work well for people (so that they'll give me money), and part of working well is being able to run it in whatever video mode the user wants.  With framebuffer, you only get the one video mode that the framebuffer is in, and that's not very nice since the user might want framebuffer in 1600x1200 because they run X in framebuffer mode, but in all likelyhood they'd rather run the game in something like 640x480.  I'd much rather just call the VESA BIOS and be able to make it support every mode available in both text mode and framebuffer mode rather than deal with the unstability of SVGA
 lib or the "maybe we can change modes, and maybe we can't" stuff you get with things like SDL  
under X, but the vm86 call doesn't seem to be documented anywhere.

I actually decided to write the thing in Windows because of that, but reading through the Windows documentation, I'm not sure how much of that hungarian notation I can tolerate.  If I could just figure out how to use this vm86 call then I could make the game support the video modes that I want it to support, and then I wouldn't have to learn to program for a whole new OS, and I could write the game in Linux like I origionally wanted to.

(And just in case anyone is wondering, the part that does the graphics modes would be public domain just like Softer, only the game itself would be closed source shareware.)
