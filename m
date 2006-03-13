From: Tim Hoolihan <thoolihan@yahoo.com>
Subject: Re: hla
Date: Mon, 13 Mar 2006 08:29:21 -0800 (PST)
Message-ID: <20060313162921.12251.qmail@web31907.mail.mud.yahoo.com>
References: <441208B6.9070808@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <441208B6.9070808@comcast.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

I certainly did get a lot of response out of asking
for HLA opinions, and they don't seem very positive. 
That's fine by me, I don't have any affinity for it,
I've just written a couple of tests.  I'll think twice
before messing it with it too much, given the large
amount of dislike for the tool.

I am suprised at one thing though, every seems to view
it as a separate language, not a tool.  It uses other
(more popular assemblers) as a base.  I thought I'd
find more people using it the way high level
programmers using code generators and other
meta-programming tools.  Particulary in assembly where
there are so many mundane things to do (like saving
the current registry states, or user interface i/o
code), it seems to me like it could be useful to start
with hla to build a skeleton in (for example) gas and
then tweak the particular elements that are of
interest.  
Maybe people are using their own custom tools to avoid
repeating code so often.  

Thanks for all the feedback, and feel free to post
linux-assembly related things (or anything else you
think fits) on that same website. 
http://unmoldable.com

-Tim


--- Frank Kotler <fbkotler@comcast.net> wrote:

> leslie.polzer@gmx.net wrote:
> > On Fri, Mar 10, 2006 at 12:18:55PM -0800, Tim
> Hoolihan wrote:
> > 
> >>I posted some info on my sight about hla, and was
> curious if anyone
> >>on here has tried it? I've used mainly gas and
> nasm, but this seems a
> >>convenient way to use them.
> > 
> > HLA is an educational tool used in the book "The
> Art Of Assembly".
> >   I don't think anyone uses it in serious
> production.
> 
> What assemblers do folks use for "serious
> production"?
> 
> While HLA *is* designed as an educational tool, it's
> pretty "powerful", 
> and would be suitable for "serious production" if
> you wanted to.
> 
> >   Besides, IMHO it's quite ugly :D
> 
> Well... beauty is in the eye of the beholder! I
> wholeheartedly agree, 
> though! :)
> 
> Regarding Tim's correction to the install doc: Good
> point! That's new - 
> the last version wanted you to be in /usr. This one
> wants /. Best to 
> check. I don't think Randy's got the "packaging" for
> Linux down pat. I 
> add version numbers when I download 'em, for
> example...
> 
> I haven't used HLA much. I don't crave the kind of
> "power" it offers, 
> and... okay, it's ugly. Since it will produce code
> that will run on 
> *either* Windows or Linux, I think it's an
> "interesting" tool/toy. It's 
> the HLA Standard Library that allows it, of course.
> Ported to Windows 
> and Linux, with more OSen planned. We can call the C
> library, of course, 
> but some people might prefer a library written in
> asm (HLA, to be sure, 
> but recognizably asm). Call it, or read it to find
> out how things might 
> be done - I do more of the latter. :)
> 
> Best,
> Frank
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-assembly" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 

