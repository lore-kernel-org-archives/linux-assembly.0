From: Maciej Hrebien <m_hrebien@wp.pl>
Subject: Re: Does anyone code in assembler today?
Date: Sun, 21 Sep 2003 12:19:00 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F6D7B14.C37A3152@wp.pl>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br> <200309171020.17639.jko@save-net.com> <3F695140.60003@eprocess.fr> <200309180835.05190.jko@save-net.com>
Reply-To: m_hrebien@wp.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

jeff wrote:
> 
> On Wednesday 17 September 2003 11:31 pm, Frederic Marmond wrote:
> > I'm sad to say that assembly is baddly considered by most of 'new'
> > programmers,
> 
> I think this is true of assembler programmers also.  Some think it is
> difficult and use it for small projects.  Other programmers
> find it easy and use it for big projects.
> 
> This difference is interesting.  What makes assembler useful
> for some programmers and of limited use for others?  I know some
> of the answers but it is a complicated question.  Here are some
> facts that look accurate to me:
> 
> 1. Assembly can easily turn into a nightmare of spaghetti
>     code.  This requires functions and modules to be created
>     carefully and at lower levels than other languages.
> 2. Most Assembler tools are awful and new programmers have
>     not encountered good tools.
> 3. People are different and some people do not want to think
>     about registers and such.
> 4. It is easy to make assembler difficult for others to understand.
>    The use of macros and uncommented subroutines soon create a
>     language only readable by the original programmer.
> 5. A good assembler library can make coding speed and results about
>     the same as a high level language.  Now, this point will probably
>     create some argument.  About the only way to prove it would be
>     to have some timed trials.  I've done a few over the years and
>     found it true but creating the library in the first place was a big job.
> 
>    It is interesting we now have thousands of languages and still people
>    are working on new languages.  All these languages are not much different
>    from assembler with different libraries.

[ cut ]

All you say is true. With comparition to HLLs assembly is more
powerfull, flexible, not generalized like all HLLs, gives you more
control on code the cpu is executing, so any speed/size optimizations
can take place. It gives you possibility to use some special units of
cpu or the computer system as a whole. Generalizing: it makes possible
to use all features the computer system can offer & control them as you
wish.

I think people turn into assembly only if they want such power, they
want to know exactly what's going on & want to have control in details,
sometimes bit-details. Of course not even mention cases where assembly
is the only way to do the job.

Yes, people are diffrent & they "talk" in diffrent languages. Some of
them like more hardware focus in daily coding but some are focused only
on their data structures & algorithms and want to think only in
genaralized way without wondering what cpu will run their algorithms &
how it achieve this.

So there is another reason why more poeple stay in HLLs: they just want
their code to be more portable/machine independent & HLLs like ie. C
gives you (more or less) this advantage.

If we talk about generalization & bits, look at this very simple
example:

const bool carry = x&(1<<(sizeof(x)*8-1));
x = (x<<1)|carry;

Yes, it's simple rol. But look what a compiler will (possibly) generate:

lea (%eax,%eax),%ebx
shr $31,%eax
or %ebx,%eax

not just: rol $1,%eax. Comment it by yourself, in your language.. ;)

Yes, some tools are awful but don't forget we are mammals - we are
getting used to while using this tools more & more.. ;)

Regards,

-- 
Maciej Hrebien

