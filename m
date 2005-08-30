From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: video sync timing + softer update
Date: Tue, 30 Aug 2005 09:44:50 -0400
Message-ID: <op.swbps0s2nro9m0@sucks.airplane.fire>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire> <op.swagf1lrnro9m0@sucks.airplane.fire> <4313CA51.5000902@mrmighty.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <4313CA51.5000902@mrmighty.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Stephen Ray <steve@mrmighty.net>
Cc: linux-assembly@vger.kernel.org

> What kernel series are you using?

Linux version 2.4.26

> Did you compile it yourself?

Possibly, I've compiled kernels before, but I think this one did  
everything I needed out of the box, so I didn't have to recompile it.

> What is HZ set at?

Aparently 100.  I wasn't aware you could change it.  I wanted to once  
since Linux's multitasking is so sludgy sometimes, but I couldn't figure  
out how to do it.

(Turns out the slugyness is because it'll give processes more than one  
timeslice in a row, it'll give them like 20 before switching tasks, so  
you're only switching tasks 5 times a second.  Maybe I should just run  
everything under SCHED_RR...)

> If it's a 2.6 kernel, did you try enabling preemption?

I'm afraid to try 2.6.  I've heard nothing good about it.  (in fact, this  
is the first time I've seen 2.6 mentioned without being in relation to  
something not working because of it)

It's not a problem with kernel threads blocking the scheduling, the kernel  
is just sitting idle when I run my test program.  As best I can tell, the  
kernel simply doesn't want to schedule things outside of it's 10ms time  
slices.  So when I try to sleep for any amount of time, the wakeup time is  
always set for the beginning of one of those 10ms slices.  (which is the  
documented behavior, I'm just surprised to see that "realtime scheduling"  
doesn't fix it)  It's not that the kernel is incapable of splitting slices  
between processes, it does it all the time.  It just won't schedule  
anything that way.

> What else is running on your machine?

     1 ?        00:00:04 init
     2 ?        00:00:03 keventd
     3 ?        00:00:00 ksoftirqd_CPU0
     4 ?        00:00:06 kswapd
     5 ?        00:00:00 bdflush
     6 ?        00:00:00 kupdated
    10 ?        00:00:00 mdrecoveryd
    11 ?        00:00:00 kreiserfsd
    60 ?        00:00:00 syslogd
    63 ?        00:00:00 klogd
   172 ?        00:00:00 khubd
   872 ?        00:00:00 usb-storage-0
   873 ?        00:00:00 scsi_eh_1
   972 ?        00:00:00 inetd
   987 ?        00:00:00 cupsd
  1009 ?        00:00:00 crond
  1012 ?        00:00:00 httpd
  1013 tty1     00:00:00 bash
  1014 tty2     00:00:00 bash
  1015 tty3     00:00:00 bash
  1016 tty4     00:00:00 agetty
  1017 tty5     00:00:00 agetty
  1018 tty6     00:00:00 agetty
  1019 tty7     00:00:00 bash
  1020 tty8     00:00:00 bash
  1021 tty11    00:00:00 agetty
  1022 ?        00:00:00 adserver
  1023 ?        00:00:00 faucet
  1024 ?        00:00:00 httpd
  1025 ?        00:00:00 httpd
  1026 ?        00:00:00 httpd
  1027 ?        00:00:00 httpd
  1028 ?        00:00:00 httpd
  2191 tty8     00:00:00 startx
  2203 tty8     00:00:00 xinit
  2204 ?        00:01:09 X
  2208 tty8     00:00:00 xinitrc
  2209 tty8     00:00:00 startkde
  2222 ?        00:00:00 kdeinit
  2225 ?        00:00:00 kdeinit
  2227 ?        00:00:00 kdeinit
  2230 ?        00:00:00 kdeinit
  2241 ?        00:00:00 kdeinit
  2242 tty8     00:00:00 kwrapper
  2244 ?        00:00:00 kdeinit
  2245 ?        00:00:01 kdeinit
  2247 ?        00:00:00 kdeinit
  2249 ?        00:00:00 kdeinit
  2251 ?        00:00:00 kdeinit
  2254 ?        00:00:03 kdeinit
  2258 ?        00:00:00 kdeinit
  2260 ?        00:00:00 korgac
  2319 ?        00:00:00 adserver.pl <defunct>
  2768 ?        00:00:00 adserver.pl <defunct>
  2786 ?        00:00:00 adserver.pl <defunct>
  3407 ?        00:00:00 adserver.pl <defunct>
  6815 ?        00:00:00 httpd
  8789 ?        00:00:00 adserver.pl <defunct>
  9494 ?        00:00:00 adserver.pl <defunct>
10241 tty7     00:00:00 startx
10252 tty7     00:00:00 xinit
10253 ?        00:09:30 X
10257 tty7     00:00:00 xinitrc
10258 tty7     00:00:00 startkde
10277 ?        00:00:00 kdeinit
10280 ?        00:00:00 kdeinit
10282 ?        00:00:00 kdeinit
10285 ?        00:00:00 kdeinit
10294 ?        00:00:00 artsd
10296 ?        00:00:00 kdeinit
10297 tty7     00:00:00 kwrapper
10299 ?        00:00:00 kdeinit
10300 ?        00:00:04 kdeinit
10302 ?        00:00:00 kdeinit
10305 ?        00:00:02 kdeinit
10306 ?        00:00:03 kdeinit
10309 ?        00:00:06 kdeinit
10311 ?        00:00:00 kdeinit
10312 ?        00:00:00 kdeinit
10313 ?        00:00:02 kdeinit
10318 ?        00:03:35 opera
10344 ?        00:00:00 opera
10376 ?        00:00:00 adserver.pl <defunct>
11897 ?        00:00:00 adserver.pl <defunct>
11986 ?        00:00:00 adserver.pl <defunct>
11989 ?        00:00:00 adserver.pl <defunct>
11990 ?        00:00:00 adserver.pl <defunct>
11991 ?        00:00:00 adserver.pl <defunct>
12417 ?        00:00:10 gedit
12419 ?        00:00:00 gconfd-2
12421 ?        00:00:00 bonobo-activati
12480 ?        00:00:12 kdeinit
12498 ?        00:00:00 kdeinit
12879 ?        00:00:00 kdeinit
12891 ?        00:00:00 httpd
12892 ?        00:00:00 httpd
12893 ?        00:00:00 httpd
12894 ?        00:00:00 httpd
13338 tty2     00:00:00 softer
13340 tty2     00:00:00 processor_utili
13493 ?        00:00:00 kdeinit
13494 pts/1    00:00:00 bash
13565 pts/1    00:00:00 ps

top says 0.3% user, 0.7% system, 99% idle

No, I didn't mess it up, there really are two copies of X running.

> These questions could help answer whether it's possible.

I don't want to require that people modify their kernel just to run  
Softer.  The way it is now, you download it, and it just works.  (Or it  
tells you your in framebuffer mode.)  I download Linux programs now and  
then, and 75% of the time they don't work.  I don't want Softer to be like  
that.

The reason it works so well now is because it doesn't depend on anything.   
You don't need libraries, you don't even have to compile it, the binary  
will work just fine.  If people have to modify their kernel, then it's  
working becomes dependant on wether or not the kernel modifications are  
sucessful.  I can make sure that Softer will work, but I can't do anything  
to make sure that kernel modifications will work.
