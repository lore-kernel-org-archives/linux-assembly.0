From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: which assembler to use : newbie query
Date: Tue, 01 Aug 2006 18:17:48 -0400
Message-ID: <44CFD30C.60900@comcast.net>
References: <a779d4420607310812w3be15123ja4902cb19bdaea3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <a779d4420607310812w3be15123ja4902cb19bdaea3b@mail.gmail.com>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Only OpenSource <onlyopensource@gmail.com>
Cc: linux-assembly@vger.kernel.org

Only OpenSource wrote:
> Hello all
> 
> I want to learn assembly language properly so that I can understand
> FreeBSD assembly code.
> Which assembler do I need to use : as or nasm.

Yes. :)

Here's something I just posted elsewhere - not really the same question, 
but maybe close enough...

--------------------------

MQ wrote:

 > Noway2 wrote:
 >
 >> Sam wrote:
 >>
 >>>> Can anyone recommend a tutorial on NASM syntax (other than Dr. Paul
 >>>> Carter's ?) Or any assembler book using NASM syntax? I'm shifting from
 >>>> gas to nasm -- that's why.
 >>>>
 >>>> thanks.
 >>>
 >>>
 >>> I'm new to assembler and thought I'd learn (g)as since GNU puts out a
 >>> ton of other development tools. Why are you shifting to NASM? Since I'm
 >>> fresh into learning assembler I might want to make the shift also...
 >>
 >>
 >> The fact that the gnu assembler syntax is awful probably has a lot to
 >> do with it.
 >
 >
 >
 > yes, gas uses AT&T syntax, which is a pile of steaming manure...


Recent versions of Gas, perhaps not available for djgpp(?), have an 
".intel_syntax noprefix" switch, which produces *less* steam.

It wasn't added for gcc's convenience, so the argument that Gas is "only 
fit for gcc's output" is no longer true. (although it *was*, at one time!!!)

I'm one of Nasm's biggest fans, and I don't think you'll go far wrong 
choosing Nasm... *but*... Nasm doesn't have 64-bit support, and isn't 
likely to, soon. Gas (and Fasm and Yasm) do. This might influence your 
decision!

Why not become "bilingual"? I can't *write* anything in Gas without 
making a lot of syntax errors, but I can read it and figure out what 
it's doing... usually. Pretty handy to have *some* familiarity with 
both! (Fasm and Yasm are similar enough to Nasm that they almost come 
free... couple subtleties...)

As far as a tutorial... other than Dr. Carter's... Maybe:

http://docs.cs.up.ac.za/programming/asm/derick_tut/

http://www.leto.net/writing/nasm.txt

http://www.rawcode.org/

This last is brand new - mostly in Italian (except for the code, which 
is in Intel), but being translated to English "as we speak" - and the 
guy is looking for help!

Seems to me there are a couple more - I can't find links right now - 
none of 'em as extensive as Dr. Carter's...

http://www.linuxassembly.org

is a good place to look for info and links...

Best,
Frank

P.S. For BSD, add the BSD Developer's Handbook, chapter... 17, I think? 
You can find it. *Very* good!


