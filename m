From: "Richard Cooper" <syloriza@xersedefixion.com>
Subject: video sync: result of 2.6 kernel experimenting
Date: Tue, 30 Aug 2005 20:51:41 -0400
Message-ID: <op.swckofgm5khrlj@sucks.airplane.fire>
References: <op.sv6lpibqnro9m0@sucks.airplane.fire> <op.swagf1lrnro9m0@sucks.airplane.fire> <4313CA51.5000902@mrmighty.net> <op.swbps0s2nro9m0@sucks.airplane.fire> <43149921.5030709@mrmighty.net> <op.swb8aympnro9m0@sucks.airplane.fire>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <op.swb8aympnro9m0@sucks.airplane.fire>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

Vsync on 2.6 seems to work really well.

I downloaded 2.6.7 from slackware.com.  For some reason, after printing "BIOS data check sucessful" (or something like that) it doesn't do anything at all for 30 seconds.  I was about to give up and hit reset, but then it started going.

I ran Softer, it didn't give me any error messages, so I don't know what that guy's problem could have been.  It worked just fine for me.  May only happen on a specific 2.6 version, or maybe he deleted "/dev/mem" or something.  I dunno.

Anyway, I typed 'set' to see what HZ was set to, it was set to 100, but I figured the environment variable might be wrong.  Playing around in /proc/ I found that there was an interrupt going off 1000 times a second, so I figured it was probably HZ=1000.

I ran my test program and it basically worked, it just missed a retrace now and then, but got like 80% of them.  It stuck the itimer delay so that it bounced between 15998 and 15999.  Curious as to why it was there instead of 16000 and 16001 where the next 1ms boundary is, I did some investigating.  It seems 2.6 kernels, although they still schedule to the next clock tick, take into consideration how far into the current tick you are when they round the value up.  So when it set the itimer, it was 0.002ms past the last tick, so that was added to the itimer value, and the result rounded up to the next 1ms, making it bounce between 16ms and 17ms.  The 2.4 kernel didn't take this into consideration, it would have rounded the itimer value up to the next millisecond (if it were HZ=1000), then wait until the end of the current 1ms interval to start measuring, making 16000 delay for 16998, and 
 16001 delay for 17998.  Basically, it always assumed it was near the end of the current t!
 ick  
when rounding.

Anyway, attempting to sync the timer to the vertical retrace seemed a bit silly with such a low resolution timer.  So I just made it keep the timer at 15000us, which would delay between 15000 and 15999, and just poll from that point on.  I also made the script determine how many microseconds it took after the timer went off for the actual retrace to occur, and if it was more than 3333 (20% of a vertical retrace interval), it counted it as a miss.  This way if the kernel gave it the signal just a little too late, it would count something like 16000us, and know that it missed a frame.  If the kernel was more than 13000us late, then that wouldn't be caught, but since that's 13 timeslices, I figure it wouldn't happen.

So, I tested the thing, running it for 3600 retrace cycles (60 seconds).  On an idle system, it missed 2 retraces out of 3600, 0.06%.  Then I ran it with "cp -R /usr trash & cat /dev/urandom > /dev/null" running on another console.  Even with all of that going on, it still missed only two retraces.

I couldn't figure out a way to get rid of those two misses per minute, but I didn't expect the kernel to do it perfectly anyway, I just expected it to try.

While it's running, it uses 4.7% of the CPU.  Since the CPU usage depends on how close the itimer signal is to the actual retrace, the CPU usage should be the same regardless of CPU speed.

If anyone wants to play with the test program, the source is here:

http://xerse.nfshost.com/secret/softer/vsync.tgz

It's set up now for 80x30 text mode's refresh rate of 60 Hz, which will make it miss the retrace every time in 80x25.  To use it with 80x25 which runs at 70 Hz, change the itimer delay on line 134 from 15000 to 13000, the 3333 on line 85 to 2857, and the 60 on line 91 to 70.

Also, on 2.4 kernels with HZ=1000, you'll have to subtract 1000 from the itimer delay to correct for rounding differences in the kernel.  And it won't work at all if HZ=100.
