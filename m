From: "Stephen Pelc" <stephen@mpeltd.demon.co.uk>
Subject: Re: Using C Libraries From Assembly
Date: Tue, 30 Aug 2005 10:17:49 +0100
Message-ID: <4314324D.10853.4AFFDB1@localhost>
References: <0D544207876CDA428F17DD7EA448C192088AC0@bailey.DOMAIN.KSNINC.PVT>
Reply-To: Stephen Pelc <stephen@mpeltd.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-reply-to: <0D544207876CDA428F17DD7EA448C192088AC0@bailey.DOMAIN.KSNINC.PVT>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

From:           	"Landon Blake" <lblake@ksninc.com>

> Can you call C functions from a program written in assembly
> language? I've googled this subject, but was only able to find
> one paragraph that didn't seem to help much. Most information
> seems to deal with going the other direction, that is, calling
> assembly from C functions. However, I'm guessing that it is
> possible, since both languages end up as machine code at some
> point. Are there any resources that explain how to do this?

We've been going through the same exercise porting one of our 
products. I've kept all my notes in one place so that I can 
publish them as "The Compiler Writer's Guide to Linux". The 
current set of notes includes a complete program that calls 
printf from the libc shared library.

The notes are at
  http://www.mpeforth.com/arena/cwgtLinux.txt

At this stage I can't say that everything is 100%, but so far so 
good. The next task is to set up signal handlers from assembly. 
All feedback, criticism and help is welcome. The final book will 
be available as a free PDF from our website. Printed copies with 
an accompaying CD will also be available.

Stephen

--
Stephen Pelc, stephen@mpeltd.demon.co.uk
MicroProcessor Engineering Ltd - More Real, Less Time
133 Hill Lane, Southampton SO15 5AF, England
tel: +44 23 80 631441, fax: +44 23 80 339691
web: http://www.mpeltd.demon.co.uk - free VFX Forth downloads
