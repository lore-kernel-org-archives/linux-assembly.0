From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: GAS colorr pixel problem
Date: Sun, 31 Dec 2006 20:43:43 +0200
Message-ID: <d93f04c70612311043m566927f5n37123b480668837c@mail.gmail.com>
References: <BAY22-F21A1B6BB16CDD02A834E41F5E30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <BAY22-F21A1B6BB16CDD02A834E41F5E30@phx.gbl>
Content-Disposition: inline
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: A D <a_d_249@hotmail.com>
Cc: linux-assembly@vger.kernel.org

On 11/22/06, A D <a_d_249@hotmail.com> wrote:
> Hello there! I'm new to x86 gnu assembly language and
> trying to learn it. I've a question: is it possible to draw
> a filled rectangle on monitor using gas? How do i
> color individual pixel on my monitor? If anyone can
> just give me the theory behind it or be kind enough to
> write the source code I would appreciate it. Thanks.

Now that everybody else gave there answers, and I'm lonely on this
new years eve, hear is some other opinions/views ;^P

The biggest single problem with "graphics", is to get the
information out of the chipset manufacturers how to program that
interesting piece of silicon :( They don't like those "proprietary information"
to be leaked [Note1], so they typically provide very limited information,
other than drivers that have a standard set of interfacing etc.

In Windows I believe you have the options of using the GDI or the DirectX
routes as calls to get things done on the screen, but let's look at
the Linux world
for a moment and it's "options" I recall:

Raw Access:
 Here I assume there is nothing else having access to the display like X/fb/etc.
You'll need the chip set's port information to (a) setup the graphics mode
(b) to actually tell the chipset to lit up a pixel and typically to
(c) draw fancy
stuff etc.

 In this "mode" you'll typically look at things on a device by device setup to
do things... not that "nice" IMO unless you are doing embedded stuff
and have the
producers by the balls to release that info ;^P

 Usig "generic" (S)VGA:
See the SVGA lib for examples etc. and this might be a library to investigate to
use... again assuming no X/fb/etc.

 VESA:
This is a standardization "effort" to get the first things going, so almost all
(S)VGA adapters lately support that and it's modes. I believe you'll
find code snippets etc. on using it inside Linux in both SVGAlib and X, but
sometimes the "problem" might be that you'll need to do a realmode BIOS call
(yuck) to get things initialized... correct me if I'm wrong here...

 SDL:
I'm sometimes surprised on how long this has survived!! (given that OpenGL
got opened up by SGI) but that's another "layer" like SVGAlib/Xlib to get to the
display, sound etc.

 X:
Okay, this is one of those subjects that can become very interesting, but it's
allso one of those things that I'm sorry to have been bastardized to make things
fit for the proprietary guys :(

 First I'll have to mention that there are several "libraries" to talk to
Xservers, the simplest and rawest is Xlib, followed by Xaw (Athena Widgets..
is something still using this??) and previously licensed Motif and then the
latest Qt and GTK forming the base of KDE and GNOME respectively.

However, X consists of a protocol (There is/was an O'Reilly book out
in a series of X that described that protocol fairly in depth...) to tell the
Xserver/display what to do/display etc.
This protocol can be run over Unix Domain sockets (typically :0.0 with
the socket
in /tmp/.X/...) or over TCP/IP (hostname:0.0) with the TCP socket listening on
6000+0 and :1 on 6000+1 etc. Note that lately the TCP sockets in X is
off by default and have to be enabled explicitly for security reasons.

So simply speaking, you can then communicate with the Xserver using those
sockets to display things, and this I wouldn't be surprised to find
some Assembly
libraries to assist in talking "sockets" ;^P


However!!!! Enters FAST OpenGL:
 To get the performance out of the OpenGL chipsets, X's standard methods have
to be circumvented, and that's where DRI ec. enters, so you have a
direct connection
to the chipset/GPU to make things faster than the X protocol (Yes, X might
be in need for a redesign to help in this regard...IMHO). To make
things even more
complicated, ATI & nVidia have their own libraries that talk
secretively to their
own kernel modules (which is sorted closed sourced :() to be able to talk
to their GPUs :(

 The only way I currently see you having access to those ATI & nVidia
GPUs is via the
cg stuff where you can download a small cg program on to the GPU(s),
but that's a
different kettle of fish...

Hope that is a tad informative :)

Note1: These guys like ATI and nVidia, implement *LOTS* of stuff in
software, and
then only hand certain stuff to the processing units on the GPU(s) to
do, depending
on the GPUs abilities, and they don't even tell you always the exact
abilities of each
GPU all the time :( it's all about marketing etc. etc. etc. and finetuning
libraries to make benchmarks go faster etc. etc. etc.... but it appears to
be a neccesary evil we'll have to be content with for now :(

-- 
Hendrik Visage
