From: "Richard Cooper" <generic@xersedefixion.com>
Subject: OT: Re: newbie question about integers size/portabilty.
Date: Wed, 29 Dec 2004 02:21:49 -0500
Message-ID: <opsjrdenb4uqea3r@sucks.airplane.fire>
References: <20041228122916.GA7137@ic.unicamp.br> <opsjpz0szcuqea3r@sucks.airplane.fire> <16849.57445.118809.760890@eidolon.muppetlabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <16849.57445.118809.760890@eidolon.muppetlabs.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

If anyone's annoyed by offtopic discussions, I've got a perfectly good web  
board that's being used for nothing at the moment that we can move this to  
(assuming it goes any further).  It's at:
http://www.xersedefixion.com/forum/
However, I doubt anyone cares, so I'll assume that's the case until  
someone tells us to shut up, but I'll go ahead and post a copy of this  
there as well in case everyone else knows differently.

> This rather misses the point, I think.

It may very well, as it's simply how things currently appear to me.

> This is untrue. The ANSI C standard specifies minimum guaranteed
> sizes. chars have to be able to hold at least 8 bits, shorts and ints
> both have to be able to hold at least 16 bits, longs at least 32 bits,
> and long longs at least 64 bits.

Now that's much more useful for getting code written, but totally useless  
for porting to machines with different data type sizes.

It sounds fine from the perspective of eight-bits-to-the-byte computing,  
but go down to seven-bits-to-the-byte and it looks completely silly, as  
your chars will contain 6 more bits than you're allowed to use, your  
shorts will probably contain 12 more bits than you're allowed to use, and  
your longs will contain 24 extra bits.  Go up to nine-bits-to-the-byte and  
it's not quite as bad as that, but then you still have bits you're not  
allowed to use because they aren't there when compiled on an  
eight-bits-to-the-byte system.  So to stay compliant you have to pretend  
like you have an eight-bits-to-the-byte system, and if you're willing to  
do that to be portable, then why have those extra bits in your system at  
all?  Why not just go buy an eight-bits-to-the-byte system?  It makes  
sense I suppose in C context where the entire premise of portability is  
mearly coding to the lowest common denominator, but it's not what I would  
consider a workable solution to the problem.

>> I myself would have made sizes like "1bit" and "2bit" and "3bit" and
>> "4bit" all the way up to "1000bit" and said that if you need at
>> least 11 bits in your number, use "11bit" and it'll compile into a
>> data size at least large enough to hold 11 bit numbers.

> ... thereby passing the problem of what integer size will produce
> efficient code on to the programmer, so that you don't have to deal
> with it.

No, it wasn't something I even considered.  But now that I have, it only  
took me a few seconds to think of something better than ANSI C's hack of a  
solution.

Just have two sets of those data types, one for when you want the smallest  
type available, and another for when you want the fastest type available.   
Something like char1 through char99 for things like characters where  
you're just looking for small storage size, which always translate to the  
smallest size available, and another set like int1 through int99 for when  
you're looking for something you can make fast calculations with, which  
always translate to the machine's word size, except for the cases where it  
doesn't have enough bits, in which case it translates to something  
less-optimal yet sufficient.

Then if you write your code for a 36 bit machine, where you can use  
"int36" and make full use of all 36 bits without having to think about  
eight-bits-to-the-byte systems since on those machines it will compile  
into a 64 bit number.  Then you can use "int17" for other numbers which  
are smaller, but for which you still want your machine's 36 bit number for  
speed reasons, and they'll compile into 32 bit numbers on  
eight-bits-to-the-byte systems.  Now that is portable, whereas making the  
programmer go through their code and change all of their data types isn't,  
and making a programmer pretend like their 36 bit machine is a 32 bit  
machine is just plain dumb.

Am I mistaken that the goal is to have code that compiles without  
modification on different architectures?  I don't see how C as it is can  
do that without forcing less-than-optimial code on those other  
architectures.  Either people with 36 bit systems use only 32 bits, or  
they go and change half of their "ints" to "long longs" when they want to  
compile their code on a different system.  If you consider languages where  
it's only portable if someone "ports" the code, then by that definition  
every language is portable, and so including all of this nonsense for  
portability is just a waste of time since someone will have to go in and  
change all of the data type sizes anyway.

It seems to me like the goal is simply to be silly.  It's portability by  
appearance only.  You can't totally disregard bit sizes and end up with a  
solution that works, and ANSI C's standard of "lets just pretend everyone  
has eight-bits-to-the-byte systems" is still disregarding bit sizes, just  
in a way that works just fine for people with eight-bits-to-the-byte  
systems.

I really think some people have it stuck in their head that all that's  
needed to be done to create portability is to pretend like bits don't  
exist, and then everything will magically work because nothing depends on  
data type sizes.  But everything depends on data type sizes, and so you  
can't just ignore the bits.
