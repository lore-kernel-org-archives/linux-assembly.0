From: "Richard Cooper" <peajay@funrestraints.com>
Subject: Re: video sync timing + softer update
Date: Mon, 29 Aug 2005 17:25:03 -0400
Message-ID: <op.swagf1lrnro9m0@sucks.airplane.fire>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.sv6lpibqnro9m0@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

> Any ideas how I might sync to bit 3 of port 0x3DA, the video card's  
> vertical sync signal?

Well, I don't know if anyone cares, but since I asked the question here, I  
figure it's appropriate to let everyone know what I came up with.

As best I can tell, it's just not possible under Linux.  Everything that  
does vertical refresh syncing in Linux does it with a CPU-time-eating busy  
loop.  It seems it isn't possible to give up the CPU for a period of time  
shorter than 10-20ms.  Since vertical retraces occur every 17ms, and 17 <  
20, if you want to have the CPU when the next retrace occurs, you can't do  
any kind of sleeping.  This is the case even under "realtime scheduling,"  
which seems to be a misnomer for what would be better called "priority  
scheduling."

Anyway, I also updated Softer so that it has that fun command that lets  
you just give it video data and it displays it.  If you want it, you can  
download it from the link at the bottom of this message board post:

http://xerse.nfshost.com/funrestraints/post/000000000016.html

It's basically version 125, but I made it a "preview" because I'm too  
angry now to bother with putting it through the amount of testing I  
usually do.  Seems to work just fine, though.

The last couple of paragraphs in that message are about Softer, the rest  
is just ranting.  You don't have to read the rants, but if you like  
Softer, consider reading them as a way of supporting it's development.  Or  
some nonsense like that.
