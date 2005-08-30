From: Stephen Ray <steve@mrmighty.net>
Subject: Re: video sync timing + softer update
Date: Mon, 29 Aug 2005 23:54:09 -0300
Message-ID: <4313CA51.5000902@mrmighty.net>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire> <op.swagf1lrnro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.swagf1lrnro9m0@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Cooper <peajay@funrestraints.com>
Cc: linux-assembly@vger.kernel.org

Richard Cooper wrote:
>> Any ideas how I might sync to bit 3 of port 0x3DA, the video card's  
>> vertical sync signal?
> 
> 
> Well, I don't know if anyone cares, but since I asked the question here, 
> I  figure it's appropriate to let everyone know what I came up with.
> 
> As best I can tell, it's just not possible under Linux.  Everything 
> that  does vertical refresh syncing in Linux does it with a 
> CPU-time-eating busy  loop.  It seems it isn't possible to give up the 
> CPU for a period of time  shorter than 10-20ms.  Since vertical retraces 
> occur every 17ms, and 17 <  20, if you want to have the CPU when the 
> next retrace occurs, you can't do  any kind of sleeping.  This is the 
> case even under "realtime scheduling,"  which seems to be a misnomer for 
> what would be better called "priority  scheduling."
> 

What kernel series are you using?  Did you compile it yourself?  What is 
HZ set at?  100? 250? 1000?  If it's a 2.6 kernel, did you try enabling 
preemption?  With HZ at 100, it is impossible for the kernel to give you 
  better than 10 ms resolution.  With HZ at 1000, it can achieve 1 ms 
resolution (in theory).  What else is running on your machine?  These 
questions could help answer whether it's possible.

Stephen
