From: "Richard Cooper" <generic@xersedefixion.com>
Subject: Re: newbie question about integers size/portabilty.
Date: Tue, 28 Dec 2004 08:35:06 -0500
Message-ID: <opsjpz0szcuqea3r@sucks.airplane.fire>
References: <20041228122916.GA7137@ic.unicamp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20041228122916.GA7137@ic.unicamp.br>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-assembly@vger.kernel.org

> 	(about this question is about C programming, i think the
> 	"assemblers-guys" are most likely to answers quickly than not so
> 	advanced c programmers.... :)

I don't know, I think C programmers have to deal with this crap all the  
time, so they'd probably be more likely to know.  I know that crap like  
this is why I program in assembly.  No one can solve the problem of how to  
make data types portable when one system doesn't have the same sizes as  
another, so someone says "hey, let's just make four sizes, char, short,  
int and long, and be completely undecided and nonspecific about them,  
thereby passing the problem on to the programmer so that we don't have to  
deal with it" and that was that.  Nevermind that every programmer will  
have to deal with it, since if char isn't at least 7 bits then they need  
to make their strings out of shorts instead of chars.  Wonderful idea  
there.

I myself would have made sizes like "1bit" and "2bit" and "3bit" and  
"4bit" all the way up to "1000bit" and said that if you need at least 11  
bits in your number, use "11bit" and it'll compile into a data size at  
least large enough to hold 11 bit numbers.  But that would have made far  
too much sense.

But enough with my ranting...

I seem to recall seeing macros in C code like sizeof(int) used to figure  
out the size of things and then conditionally compile code.  Though I have  
no idea how it works, I would test sizeof(whatever) until I found one  
that's large enough, then define some word like "bits16" to whatever data  
type turns out to be that size or larger, and then use "bits16" when  
declaring variables instead of "int" or "long" or any of those.

Something like this:

if sizeof(char) >= 16
   define bits16 char
elseif sizeof(short) >= 16
   define bits16 short
elseif sizeof(int) >= 16
   define bits16 int
elseif sizeof(long) >= 16
   define bits16 long
else
   scream "you can't compile this program because your system sucks"
endif

Just repeat it for "bits1" through "bits32" or whatever you plan to go up  
to, and there you go.  Then in your program instead of doing "int varible"  
do "bits16 variable" and things will work pretty much how they should have  
be done in the first place.

> 	Does anyone know where i can get a accurate table for gcc compiler?

I think that char is 8, short is 16, long is 32, and int I think is also  
32.  I'm pretty sure.  That's the values I use when I have to convert  
those stupid size names in C structures into something that actually  
exists, and it seems to always work.

> i am mixing several integer types to pass to a hardware data structure,  
> this is not enough, i need exact values.

Oh, well, then, if you're doing something hardware specific, I suppose you  
can say to heck with the portability aspect.  So just use char for 8,  
short for 16, and int for 32 and be done with it.
