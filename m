From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: video sync timing + softer update
Date: Mon, 29 Aug 2005 21:40:47 -0400
Message-ID: <4313B91F.4060206@comcast.net>
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

I took the liberty or reposting your question to news:alt.lang.asm - 
more of a warzone than an asm forum, these days, but we were discussing 
polling loops, and I thought somebody might have some ideas.

One response was "I don't bother doing that anymore, vga doesn't need 
it." Would be nice if it were true, but your experience seems to differ.

Another poster (f0dder) posted a link to Kris Heidenstrom's PC timing 
FAQ, and its info on "emulating a Vertical Retrace Interrupt". All dos 
stuff, it wouldn't work on Linux as written, of course. But I thought 
the principles might be useful. However, that's pretty much what you've 
tried, without success. I didn't realize that the resolution on the 
timers was so bad. Oh, well...

I still think that this approach has as much promise as anything. If the 
arithmetic doesn't work out... jeez, I'm really reluctant to say 
anything's "impossible"...

...
> http://xerse.nfshost.com/funrestraints/post/000000000016.html
> 
> It's basically version 125, but I made it a "preview" because I'm too  
> angry now to bother with putting it through the amount of testing I  
> usually do.  Seems to work just fine, though.

Great. I haven't looked at 1.26pre yet - barely getting into 1.24 - but 
it looks like a useful little tool, even if it *won't* synch. Making it 
a command line option as you've done may be the best you can do.

> The last couple of paragraphs in that message are about Softer, the 
> rest  is just ranting.  You don't have to read the rants, but if you 
> like  Softer, consider reading them as a way of supporting it's 
> development.  Or  some nonsense like that.

Okay, I've done my part :) Sorry to hear you're meeting with such 
frustration. Look on the bright side: Softer's a *hell* of a lot better 
than no graphics at all (which is what I'm used to). Thanks for sharing 
it with us!

Best,
Frank

