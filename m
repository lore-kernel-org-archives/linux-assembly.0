From: Frederic Marmond <fmarmond@eprocess.fr>
Subject: Re: Does anyone code in assembler today?
Date: Thu, 18 Sep 2003 08:31:28 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <3F695140.60003@eprocess.fr>
References: <200309110801.37516.rafael.diniz@ic.unicamp.br> <200309111414.47716.wklux@yahoo.co.uk> <200309150730.23968.jko@save-net.com> <200309171020.17639.jko@save-net.com>
Reply-To: fmarmond@eprocess.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
In-Reply-To: <200309171020.17639.jko@save-net.com>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jeff <jko@save-net.com>
Cc: linux-assembly-admin@mlists.in-berlin.de, linux-assembly@vger.kernel.org

Hi all,
In my work, I don't code all days in assembly, but I made some work with 
it (our own linux loader, some inline assembly, lot of debugging, ...)
I'm sad to say that assembly is baddly considered by most of 'new' 
programmers, who don't know anything about how a computer is made, but 
only know programming products (they know where to click to make their 
graphical project generate code and compile).

For those who want to work (a little) in assembly, I can suggest them to 
find a company that use/debug/write drivers. Lot of drivers are in C, 
but we still can find some that need assembly for performance or small 
code (the main goal for all embeded systems.)
The other way to do assembly is to find a company that use buggy drivers 
;-), or who port drivers from an arch to an other, or who don't have 
sources of it, ...

But I don't think assembly may be used for a 'real soft' other than just 
parts of a lib or driver... :-(
This good old time is now deprecated ;)

Fred


jeff wrote:

>I guess most programmers work in Java one of the
>newer object oriented languages.   Or maybe
>Linux is not ideal for assembler and the few remaining
>coders use other platforms?
>
>The level of activity on this list and others indicate
>the assembler community is not very active.   That
>is one indicator.  Another is the number of people
>interested in new programs.  Ten years ago when
>i released a program, a large number of people
>jumped on it to look at the code.  My release of a
>few days ago resulted in three responses.
>
>So.. maybe we are a small community which is
>difficult to join?  That's OK, there is always a niche
>for small fast code and as systems mature the
>competition moves from features to speed. 
>
>I think this happened to some extent with DOS.  Once
>it matured the companies needed something new to
>sell.  They had a problem with the competition building
>fast programs optimized in .asm.  This happened with
>spreadsheets and other programs.
>
>Of course, the argument is that hardware is getting faster
>and speed is no longer an issue.  Also, memory is cheap
>and big bloated programs are best because they get into the
>market quickly.  It is much easier to train programmers
>in the newer languages and todays tools isolates everyone
>from knowing much about hardware or hex.
>
>So.. i wonder if it would be better to port some old DOS
>libraries to work under X or stay with the console?  I see
>some asm activity in graphics and games.  There is also
>the embedded linux area...
>
> jeff (looking for an interesting asm project)
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-assembly" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>


