From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: hla
Date: Fri, 10 Mar 2006 18:16:06 -0500
Message-ID: <441208B6.9070808@comcast.net>
References: <20060310201855.23619.qmail@web31913.mail.mud.yahoo.com> <20060310203259.GA7399@wintermute>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <20060310203259.GA7399@wintermute>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-assembly@vger.kernel.org

leslie.polzer@gmx.net wrote:
> On Fri, Mar 10, 2006 at 12:18:55PM -0800, Tim Hoolihan wrote:
> 
>>I posted some info on my sight about hla, and was curious if anyone
>>on here has tried it? I've used mainly gas and nasm, but this seems a
>>convenient way to use them.
> 
> HLA is an educational tool used in the book "The Art Of Assembly".
>   I don't think anyone uses it in serious production.

What assemblers do folks use for "serious production"?

While HLA *is* designed as an educational tool, it's pretty "powerful", 
and would be suitable for "serious production" if you wanted to.

>   Besides, IMHO it's quite ugly :D

Well... beauty is in the eye of the beholder! I wholeheartedly agree, 
though! :)

Regarding Tim's correction to the install doc: Good point! That's new - 
the last version wanted you to be in /usr. This one wants /. Best to 
check. I don't think Randy's got the "packaging" for Linux down pat. I 
add version numbers when I download 'em, for example...

I haven't used HLA much. I don't crave the kind of "power" it offers, 
and... okay, it's ugly. Since it will produce code that will run on 
*either* Windows or Linux, I think it's an "interesting" tool/toy. It's 
the HLA Standard Library that allows it, of course. Ported to Windows 
and Linux, with more OSen planned. We can call the C library, of course, 
but some people might prefer a library written in asm (HLA, to be sure, 
but recognizably asm). Call it, or read it to find out how things might 
be done - I do more of the latter. :)

Best,
Frank

