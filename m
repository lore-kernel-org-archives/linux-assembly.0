From: "Daniel R. Blair" <joecamel@realcoders.org>
Subject: Re: atoll
Date: Thu, 19 Feb 2004 10:16:33 -0500 (EST)
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <20040219100944.H54477@codepoet.unixcoders.org>
References: <200402181648.33694.drenal@fhi.pl>
Mime-Version: 1.0
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200402181648.33694.drenal@fhi.pl>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drenal <drenal@fhi.pl>
Cc: linux-assembly@vger.kernel.org

On Wed, 18 Feb 2004, drenal wrote:

> Hello, I'm a newbie in kernel-level programming, I'm trying to create module
> that compares indone value('d_ino') from 'struct dirent64' with my own data
> put to module thru some modified syscall as char* string.
>
> My question is: How can I convert char* string data to type '__off64_t' which
> is 8 bytes long on my system just like type 'long long'. I tried to use 'long
> long atoll(char*)' function from stdlib.h  but when I include this header in
> my kernel-based source code I have a lot of errors while compiling.
>
> I just want to convert char* data to 'long long' type in kernel-based program.
> How can I do this?

Unfortunately, I am unable to help you with your problem.. but, since I
use Pine, a unix based console MUA, I wanted to give you some advice as a
"newbie" posting on the list.. this would at least have helped me, and
most likely others at least understand your "subject line" a little more,
and possibly avoid deleting it.. I actually marked it for deletion and
accidentally read it I think, and then un-deleted it when I noticed it was
a list post..

When referecing a system call or function in the libraries.. reference it
proceeded with parens and the man page volume.... so, IMHO, I would have
re-done the subject line as follows:


old:  atoll
new:  atoll(3)

In realtiy, *I* would have made a longer, more descriptive subject line
like "using atoll with assembly and kernel space" or something, but, in
leiu of that, at least state it as atoll(3) so it's recognized as a
function call and not some way for a spammer to get away from the spam
eliminators by spelling words differently so they are not recognized as
standard subject lines..

Again, this is just me... I would imagine most would prefer my suggestion
rather than the original way you posted it (i.e. "atoll(3)" is
preffered over just "atoll"), but, I could be wrong..

And I am not getting mad at you in any way, shape or form.. I'm glad you
came to the list for help, and I am glad you are taking an active role in
coding in assembly.. but, again, using standards like referencing the sys
call properly could help others assess you matter.. some people on the
list may have just skimmed over your message because they were unaware it
was referencing the function call atoll();

Thanks for listening bud,

Danny

                           = Daniel Blair =
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
- dblair@realcoders.org -                   [http://www.realcoders.org]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

