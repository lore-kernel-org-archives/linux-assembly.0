From: Frank Kotler <fbkotler@comcast.net>
Subject: Re: nasm / code distance
Date: Sat, 08 Apr 2006 10:55:57 -0400
Message-ID: <4437CEFD.7020505@comcast.net>
References: <200604071847.32559.thiago.silva@kdemail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200604071847.32559.thiago.silva@kdemail.net>
Sender: linux-assembly-owner@vger.kernel.org
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thiago Silva <thiago.silva@kdemail.net>
Cc: linux-assembly@vger.kernel.org

Thiago Silva wrote:
> Hello,
> I'm having some troubles with an asm application.
> 
> The first problem is about the "short jump".
> I get those messages "error: short jump is out of range" when using nasm on my 
> sources. Researching, I found that people answer this by saying "use -O1".
> Now, is this the appropriated way to deal with this problem?

That's one way.

Jumps, conditional or unconditional come in two sizes, "short" and 
"near". Weird that the longer jump is called "near", but that's the way 
it is. There's also a "far" jump which loads cs as well as eip. This 
isn't very useful in Linux, at least not in "user" code...

Nasm defaults to "near" for unconditional jumps:

     jmp my_label

Will jump +/- 2G-1 bytes (assuming 32-bit code). This will always 
"reach", but may produce longer code than necessary, since the parameter 
takes up four bytes. If the target is within -128/+127 bytes, we can do:

     jmp short my_label

...and the parameter is stored as just one byte. (note that these 
instructions use "relative addressing" - we write "my_label", but what's 
emitted for code is the "distance", forward or back, to "my_label") If 
you do this, and "my_label" is more than 127 bytes away - or becomes so 
as code is modified - you'll see that "out of range" message.

[H.P. Recktenwald (Hi, hp!) showed me a neat trick - pre "-O" switch - 
to deal with this - "%define jm jmp short", then use "jm" for all your 
unconditional jumps. If Nasm complains "out of range", just add "p"!]

Conditional jumps default to "short". Nasm doesn't want to default to 
"near", since it's not available on 8086 (and we write a lot of code for 
8086 :)... If the target is farther than 127 bytes away, we can:

jz near my_label

The "-O" switch alters these defaults. "-O1" is "special" - it will size 
a "backward" jump "as required", but forward jumps are "near", to 
guarantee they'll reach. Parameters greater than 1 enable that many 
(maximum) passes, so that jumps can be "sized" optimally. It *used* to 
be that "-O2" and "-O3" were "special cased" to 10 and 15 passes, but 
this has been changed - "-O2" and "-O3" are *not* enough, and are in 
fact "buggy" currently. There is no advantage to using a small number - 
Nasm quits when it's done. I usually use "-O999" if I use it at all.

The other effect of the "-O" switch - any parameter (>0) - is to enable 
the shorter "signed byte" form of instructions that have a short form, 
but that's a different issue...

> Second, I've been getting some strange (?) segfaults...
> Using valgrind, I found that there were 3 invalid reads on memory.
> Those reads uses data in the .data section. Now, moving the problematic 
> function to the beginning of the file, close to the entry point and other 
> sections, valgrind didn't complain and I got no segfaults.
> 
> I'm obviously missing something, so...can anyone help?

As Leslie says, I think we're going to need to see the code for that 
one. Doesn't sound right. (possibly from using "-O2"??? - does ld 
complain about "can't find entrypoint"???)

Best,
Frank

