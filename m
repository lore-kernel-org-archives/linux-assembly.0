From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Linear memory access, and register-modifier debugger
Date: Wed, 12 Jun 2002 12:36:17 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3D072421.2060905@eprocess.fr>
References: <3D06ED6F.6090804@eprocess.fr>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

I'm sorry to send it again, but I had troubles with my suscribtion, 
obliged to re-suscribe to the list
So, (as the archive is down) i couldn't read any (if any) answer...
could you please re-post me answer if, if you have one...

by the way:
I'm looking for a debugger capable of changing  registers while 
executing the code (during a break-point for exemple), or/and best, 
modifying the code itself in memory.
for the code
brk        :08048081 6689c0                 mov  ax, ax
when steping to this breakpoint, filling the 6689c0 by 909090, to 
disable this wonderfull instruction, and step to the following! ;-)

ok, I know, there are 'pro' debuggers under windows.
I've use turboDebugger (borland, under dos) from my young time...
but now, under GNU/linux, I miss it!
(perhapse that under Linux, there is no bug at all, opposate to 
windows... ;-))


thanks in advance!
Fred

> Hi all,
>
> I'd like to access to a memory area on a mtd device, without having 
> compiling the mtd support in the kernel.
> (read a firmware info, on a embeded environment => kernel as small as 
> possible)
> Is there any isue?
>
> I mean:
> is the device mapped anywhere, or is it really invisible, if i don't 
> compile the mtd support?
> If it is visible (how can i check that point?) do you know if there is 
> any way to access it (like in flat mode, by a largest descriptor or 
> something...)?
>
>
> thanks for answers!
>
> Fred
>
>



