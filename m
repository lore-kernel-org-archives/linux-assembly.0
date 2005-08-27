From: "Richard Cooper" <peajay@funrestraints.com>
Subject: video sync timing
Date: Sat, 27 Aug 2005 15:28:20 -0400
Message-ID: <op.sv6lpibqnro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org


Any ideas how I might sync to bit 3 of port 0x3DA, the video card's  
vertical sync signal?

Just watching the bit in a loop doesn't seem like a good idea, since the  
CPU could be off doing something else, but as far as I know any timer  
function I might use will only be accurate to 1/100 of a second, which  
wouldn't be much better than watching the bit in a loop.

Since things like DOOM run in Linux, I think there must be some way to do  
it.  I've discovered that simutaneously changing the screen data and the  
color palette without synchronization creates a flicker of a mess on the  
screen, and DOOM doesn't do that in Linux, so I guess it must be  
synchronizing somehow.
