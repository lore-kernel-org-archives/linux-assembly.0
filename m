From: Lawrence <lawrencio@hotpop.com>
Subject: reply to jeff message
Date: Thu, 18 Sep 2003 09:13:56 +0800
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F6906D4.6050008@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi All,

I am working in a company that use entirely DOS and assembly to develop
a GUI platform and a variety of graphic related application.  I have
always been struggling to find an all-in-one solution for Linux assembly
program, so that we can do the porting.

From my experience, I think the most salient problem that hinder people
from using assembly as her development tool lies in the absent of a
robust assembly debugger.  Although people says gdb is good enough, I
still don't know how to treak it to symbolically debug my intel-syntax
asm program.  I've also try ald before, but I think it's the problem of
nasm, it cannot show the symbols too.

After I got the gift from Jeff, I've tried it out all night,  and I
finally figure out how to debug my asm program symboliclly under kdbg,
with his suggestion of using another version of nasm.  With Jeff's tool,
I finally can tried to start doing the porting.

I believe, with an integrated assembly development package, more and
more people using asm under DOS/MS Windows like me will give a try to
Linux.  Thanks Jeff for his endeavour, and of course other programmers
who contributed to the linux assembly tools.

Thanks and Regards,
Lawrence

