From: Jason Borden <jborden@sorenson.com>
Subject: Re: Threads, timing
Date: Mon, 7 Oct 2002 10:28:32 -0600
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <200210071028.32212.jborden@sorenson.com>
References: <002801c26dd0$22da4430$0d01a8c0@utopia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <002801c26dd0$22da4430$0d01a8c0@utopia>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lada 'Ray' Lostak <ray@unreal64.net>, linux-assembly@vger.kernel.org

I have to compliment you on your desire to make your own thread syncronization 
functions, however, the linux kernel does support native system calls to do 
this for you if you are interested. The kernel call is "ipc" which implements 
Sys V interprocess communication, including semaphores. You can get more 
information in the man pages, eg: man ipc, man semctl, man semget, man semop. 
From what I gather, the sysv ipc functions aren't exactly as fast at thread 
syncronization as a windows implementation, but that is being fixed in the 
2.5.x kernels using the new futex kernel call.

Hope that helps,
Jason

On Monday 07 October 2002 01:07 am, Lada 'Ray' Lostak wrote:
> Hi there :o)
>
>     I have small advanced problem about threads and sync. As you may
> remeber, we are porting huge application to linux. It is not problem at
> all, because we expect applications to be ported, so, it is ready. But
> right now, we don't know, if we can use more 'optimized' way for sync
> objects, because we don't know, if we can implement on linuxes. On linuxes,
> we don't use glibc at all, we use direct kernel calls (except sysdep
> components, such as database wrappers and other - they are compiled
> standalone). I don't want to flamewar about this (as usually :) bt it is
> done for shariong binaries acros more OS and one CPU.
>...
